//
//  SHNavView.m
//  SHLiveOC
//
//  Created by ios on 2017/8/1.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHNavView.h"

@interface SHNavView ()

@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, copy) TitleBtnType titleBtnBlock;
@property (nonatomic, strong) NSMutableArray *btnsArrM;



@end

@implementation SHNavView
- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr titleBtnBlock:(TitleBtnType)titleBtnBlock
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleBtnBlock = titleBtnBlock;
        self.titleArr = titleArr;
        [self setupSubView];
    }
    return self;
}

#pragma mark - Private&Public Methods

- (void)setupSubView
{
    CGFloat btnW = self.frame.size.width / self.titleArr.count;
    CGFloat btnH = self.frame.size.height;

    for (NSInteger i = 0; i < self.titleArr.count; i++) {
        UIButton *titleBtn = [SHCustomControl customBtnTitle:self.titleArr[i] normalImgStr:nil selectImgStr:nil target:self sel:@selector(titleBtnClick:)];
        [self.btnsArrM addObject:titleBtn];
        titleBtn.tag = i;
        
        titleBtn.frame = CGRectMake(i * btnW, 0, btnW,btnH);
        [self addSubview:titleBtn];
        
        if (i == 1) {
            [titleBtn.titleLabel sizeToFit];
            self.lineV.frame = CGRectMake(0, 0, titleBtn.titleLabel.bounds.size.width, 2);
            self.lineV.center= CGPointMake(titleBtn.center.x, btnH -2);
            
            [self addSubview:self.lineV];
        }
    }
    
}

#pragma mark - Action
- (void)titleBtnClick:(UIButton *)btn
{
    
    if (self.titleBtnBlock) {
        self.titleBtnBlock(btn.tag);
    }
    
    [self scrollTitleBtnLine:btn.tag];
    
}

- (void)scrollTitleBtnLine:(NSInteger)tag
{
    UIButton *btn = self.btnsArrM[tag];
    [UIView animateWithDuration:0.25 animations:^{
        CGPoint pointL = self.lineV.center;
        pointL.x = btn.center.x;
        self.lineV.center = pointL;
    }];

}
#pragma mark - Getters
- (UIView *)lineV
{
    if (!_lineV) {
        _lineV = [SHCustomControl customVBgColor:kRedColor];
    }
    return _lineV;
}

- (NSMutableArray *)btnsArrM
{
    if (!_btnsArrM) {
        _btnsArrM = [NSMutableArray array];
    }
    return _btnsArrM;
}
@end
































