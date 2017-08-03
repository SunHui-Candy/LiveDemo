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


@end
