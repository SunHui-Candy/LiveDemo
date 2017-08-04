//
//  SHHttpTool.m
//  SHLiveOC
//
//  Created by ios on 2017/8/2.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHHttpTool.h"
#import <AFNetworking.h>

static NSString *kBaseUrl = SERVER_HOST;

@interface SHAFHttpClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end

@implementation SHAFHttpClient

+ (instancetype)sharedClient
{
    static SHAFHttpClient *_client;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _client = [[SHAFHttpClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl] sessionConfiguration:configuration];
        _client.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"text/plain",@"image/gif", nil];
        // 设置超时时间
        _client.requestSerializer.timeoutInterval = 15;
        // 安全策略
        _client.securityPolicy = [AFSecurityPolicy defaultPolicy];
    });
    return _client;
}

@end

@implementation SHHttpTool

+ (void)getPath:(NSString *)path params:(NSDictionary *)params success:(SHHttpSuccessBlock)success failure:(SHHttpFailureBlock)failure
{
    
    NSString *url = [kBaseUrl stringByAppendingPathComponent:path];
    [[SHAFHttpClient sharedClient]GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)postPath:(NSString *)path params:(NSDictionary *)params success:(SHHttpSuccessBlock)success failure:(SHHttpFailureBlock)failure
{
    NSString *url = [kBaseUrl stringByAppendingPathComponent:path];
    [[SHAFHttpClient sharedClient]POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)downloadPath:(NSString *)path success:(SHHttpSuccessBlock)success failure:(SHHttpFailureBlock)failure progress:(SHHttpDownloadProgressBlock)progress
{
    //获取完整的url路径
    NSString *urlStr = [kBaseUrl stringByAppendingPathComponent:path];
    //下载
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDownloadTask *downloadTask = [[SHAFHttpClient sharedClient] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress.fractionCompleted);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //获取沙河cache路径
        NSURL *documentsDirectoryUrl = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryUrl URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (error) {
            failure(error);
        }else{
            success(filePath.path);
        }
    }];
    [downloadTask resume];
}

+ (void)uploadImagePath:(NSString *)path
                 params:(NSDictionary *)params
              thumbName:(NSString *)imagekey
                  image:(UIImage *)image
                success:(SHHttpSuccessBlock)success
                failure:(SHHttpFailureBlock)failure
               progress:(SHHttpUploadProgressBlock)progress
{
    //获取完整的url路径
    NSString *urlStr = [kBaseUrl stringByAppendingPathComponent:path];
    NSData *data = UIImagePNGRepresentation(image);
    
    [[SHAFHttpClient sharedClient] POST:urlStr parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:imagekey fileName:@"01.png" mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress.fractionCompleted);

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

@end


















