//
//  SHTabBar.h
//  SHLiveOC
//
//  Created by ios on 2017/7/31.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    SHTabBarTypeLive = 100,
    SHTabBarTypeMe,
} SHTabBarType;


typedef void(^TabBarBtnType)(NSInteger tag);
@interface SHTabBar : UITabBar

@property (nonatomic, copy) TabBarBtnType btnBlock;

- (void)setBtnBlock:(TabBarBtnType)btnBlock;

@end
