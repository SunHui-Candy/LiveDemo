//
//  SHHttpTool.h
//  SHLiveOC
//
//  Created by ios on 2017/8/2.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SHHttpSuccessBlock)(id json);
typedef void(^SHHttpFailureBlock)(NSError *error);
typedef void (^SHHttpDownloadProgressBlock)(CGFloat progress);
typedef void (^SHHttpUploadProgressBlock)(CGFloat progress);

@interface SHHttpTool : NSObject

/**
 *  get网络请求
 *
 *  @param path    url地址
 *  @param params  url参数  NSDictionary类型
 *  @param success 请求成功 返回NSDictionary或NSArray
 *  @param failure 请求失败 返回NSError
 */
+ (void)getPath:(NSString *)path params:(NSDictionary *)params success:(SHHttpSuccessBlock)success failure:(SHHttpFailureBlock)failure;

/**
 *  post网络请求
 *
 *  @param path    url地址
 *  @param params  url参数  NSDictionary类型
 *  @param success 请求成功 返回NSDictionary或NSArray
 *  @param failure 请求失败 返回NSError
 */
+ (void)postPath:(NSString *)path params:(NSDictionary *)params success:(SHHttpSuccessBlock)success failure:(SHHttpFailureBlock)failure;

/**
 *  下载文件
 *
 *  @param path     url路径
 *  @param success  下载成功
 *  @param failure  下载失败
 *  @param progress 下载进度
 */

+ (void)downloadPath:(NSString *)path
                 success:(SHHttpSuccessBlock)success
                 failure:(SHHttpFailureBlock)failure
                progress:(SHHttpDownloadProgressBlock)progress;

/**
 *  上传图片
 *
 *  @param path     url地址
 *  @param image    UIImage对象
 *  @param imagekey    imagekey
 *  @param params  上传参数
 *  @param success  上传成功
 *  @param failure  上传失败
 *  @param progress 上传进度
 */

+ (void)uploadImagePath:(NSString *)path
                     params:(NSDictionary *)params
                  thumbName:(NSString *)imagekey
                      image:(UIImage *)image
                    success:(SHHttpSuccessBlock)success
                    failure:(SHHttpFailureBlock)failure
                   progress:(SHHttpUploadProgressBlock)progress;


@end
