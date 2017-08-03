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


@end
