//
//  UIImageView+SHSDWebImage.h
//  SHLiveOC
//
//  Created by ios on 2017/8/2.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SHDownloadImageSuccessBlock)(UIImage *image);
typedef void(^SHDownloadImageFailedBlock)(NSError *error);
typedef void(^SHDownloadImageProgressBlock)(CGFloat progress);


@interface UIImageView (SHSDWebImage)

/**
 *  异步加载图片
 *
 *  @param url       图片地址
 *  @param imageName 占位图片名
 */

- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName;

/**
 *  异步加载图片，可以监听下载进度，成功或失败
 *
 *  @param url       图片地址
 *  @param imageName 占位图片名
 *  @param success   下载成功
 *  @param failed    下载失败
 *  @param progress  下载进度
 */

- (void)downloadImage:(NSString *)url
          placeholder:(NSString *)imageName
              success:(SHDownloadImageSuccessBlock)success
               failed:(SHDownloadImageFailedBlock)failed
             progress:(SHDownloadImageProgressBlock)progress;



@end
