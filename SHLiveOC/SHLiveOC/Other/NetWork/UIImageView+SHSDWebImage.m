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
@end
