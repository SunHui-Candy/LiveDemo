//
//  SHTabBar.m
//  SHLiveOC
//
//  Created by ios on 2017/7/31.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHTabBar.h"

@interface SHTabBar ()

@property (nonatomic, strong) NSArray *dataListArr;
@property (nonatomic, strong) UIImageView *bgImageV;
@property (nonatomic, strong) UIButton *lastSelBtn;
@property (nonatomic, strong) UIButton *camaraBtn;
@end

@implementation SHTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupChildItem];
    }
    return self;
}

- (void)setupChildItem
{
    [self addSubview:self.bgImageV];
    
    for (NSInteger i = 0; i < self.dataListArr.count; i++) {
        UIButton *btn = [SHCustomControl customBtnTitle:@"" normalImgStr:self.dataListArr[i] selectImgStr:kFormatStr(@"%@_p", self.dataListArr[i]) target:self sel:@selector(btnClick:)];
        btn.tag = SHTabBarTypeLive + i;
        if (i==0) {
            btn.selected = YES;
            self.lastSelBtn = btn;
        }
        [self addSubview:btn];
        
    }
    [self addSubview:self.camaraBtn];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width / self.dataListArr.count;

    for (UIView *btnV in self.subviews) {
        if (btnV.tag >= SHTabBarTypeLive) {
            btnV.frame = CGRectMake((btnV.tag - SHTabBarTypeLive) * width, 0, width, self.frame.size.height);
        }
        
    }
    self.bgImageV.frame = self.frame;
    CGPoint center = CGPointMake(self.center.x, self.center.y - 15);
    self.camaraBtn.center = center;

    
}

- (void)btnClick:(UIButton *)btn
{
    self.lastSelBtn.selected = NO;
    btn.selected = YES;
    self.lastSelBtn = btn;
    
    if (self.btnBlock) {
        self.btnBlock(btn.tag);
    }
    
    if (btn != self.camaraBtn) {
        [UIView animateWithDuration:0.25 animations:^{
            btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                btn.transform = CGAffineTransformIdentity;
            }];
        }];
    }
}

#pragma mark - Getters
- (UIButton *)camaraBtn
{
    if (!_camaraBtn) {
        _camaraBtn = [SHCustomControl customBtnTitle:@"" normalImgStr:@"tab_launch" selectImgStr:@"" target:self sel:@selector(btnClick:)];
        [_camaraBtn sizeToFit];
        
        
    }
    return _camaraBtn;
}
- (UIImageView *)bgImageV
{
    if (!_bgImageV) {
        _bgImageV = [SHCustomControl customImageViewName:@"global_tab_bg"];
    }
    return _bgImageV;
}

- (NSArray *)dataListArr
{
    if (!_dataListArr) {
        _dataListArr = @[@"tab_live",@"tab_me"];
    }
    return _dataListArr;
}
@end
