//
//  SHCustomControl.m
//  SHLiveOC
//
//  Created by ios on 2017/7/31.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHCustomControl.h"

@implementation SHCustomControl

+(UIButton *)customBtnTitle:(NSString *)btnTitle normalImgStr:(NSString *)normalImgStr selectImgStr:(NSString *)selectImgStr target:(id)target sel:(SEL)sel
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    [btn setImage:kImageName(normalImgStr) forState:UIControlStateNormal];
    [btn setImage:kImageName(selectImgStr) forState:UIControlStateSelected];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIImageView *)customImageViewName:(NSString *)imageName
{
    UIImageView *imgV = [[UIImageView alloc]initWithImage:kImageName(imageName)];
    return imgV;
}

+ (UILabel *)customLableBgColor:(UIColor *)bgColor TextColor:(UIColor *)textColor Text:(NSString *)text
{
    UILabel *lab = [[UILabel alloc] init];
    lab.text = text;
    lab.textColor = textColor;
    lab.backgroundColor = bgColor;
    return lab;
}

+ (UIView *)customVBgColor:(UIColor *)bgColor
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = bgColor;
    return view;
}

@end
