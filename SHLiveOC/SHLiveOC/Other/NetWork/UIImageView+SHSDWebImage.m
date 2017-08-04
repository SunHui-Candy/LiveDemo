//
//  UIImageView+SHSDWebImage.m
//  SHLiveOC
//
//  Created by ios on 2017/8/2.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "UIImageView+SHSDWebImage.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (SHSDWebImage)

- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:kImageName(imageName) options:SDWebImageRetryFailed|SDWebImageLowPriority];
}

- (void)downloadImage:(NSString *)url
          placeholder:(NSString *)imageName
              success:(SHDownloadImageSuccessBlock)success
               failed:(SHDownloadImageFailedBlock)failed
             progress:(SHDownloadImageProgressBlock)progress
{
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:imageName] options:SDWebImageRetryFailed|SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        progress(receivedSize * 1.0 / expectedSize);
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (error) {
            
            failed(error);
            
        } else {
            
            self.image = image;
            success(image);
        }
        
    }];
    
}


@end
