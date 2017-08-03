//
//  SHNavView.h
//  SHLiveOC
//
//  Created by ios on 2017/8/1.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^TitleBtnType)(NSInteger btnTag);

@interface SHNavView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr titleBtnBlock:(TitleBtnType)titleBtnBlock;

- (void)scrollTitleBtnLine:(NSInteger)tag;

@end
