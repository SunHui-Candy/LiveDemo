//
//  SHCustomControl.h
//  SHLiveOC
//
//  Created by ios on 2017/7/31.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SHCustomControl : NSObject

+ (UIButton *)customBtnTitle:(NSString *)btnTitle normalImgStr:(NSString *)normalImgStr selectImgStr:(NSString *)selectImgStr target:(id)target sel:(SEL)sel;

+ (UILabel *)customLableBgColor:(UIColor *)bgColor TextColor:(UIColor *)textColor Text:(NSString *)text;

+ (UIImageView *)customImageViewName:(NSString *)imageName;

+ (UIView *)customVBgColor:(UIColor *)bgColor;


@end
