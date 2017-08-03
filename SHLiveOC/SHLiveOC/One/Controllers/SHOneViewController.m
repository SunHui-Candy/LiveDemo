//
//  SHOneViewController.m
//  SHLiveOC
//
//  Created by ios on 2017/7/31.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHOneViewController.h"
#import "SHNavView.h"

@interface SHOneViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) SHNavView *navV;
@property (nonatomic, strong) UIScrollView *bgScrollV;
@property (nonatomic, strong) NSArray *titleArr;

@end

@implementation SHOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNav];
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat width = scrollView.frame.size.width;
    
    NSInteger index = offsetX / width;
   
    [self.navV scrollTitleBtnLine:index];
    
    UIViewController *childVC = self.childViewControllers[index];
    if ([childVC isViewLoaded]) {
        return;
    }
    childVC.view.frame = CGRectMake(offsetX, 0, width, scrollView.frame.size.height);
    
    [scrollView addSubview:childVC.view];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

#pragma mark - Private&Public Methods
- (void)setupUI
{
    [self.view addSubview:self.bgScrollV];
    NSArray *childVCArr = @[@"SHFocusViewController",@"SHHotViewController",@"SHNearViewController"];
    
    for (NSInteger i = 0; i< childVCArr.count ; i++) {
        UIViewController *vcName = [[NSClassFromString(childVCArr[i]) alloc]init];
        [self addChildViewController:vcName];
    }
    
    [self.bgScrollV setContentOffset:CGPointMake(kScreenW, 0) animated:YES];
}


- (void)setupNav
{
    [self.navigationController.navigationBar setBackgroundImage:kImageName(@"global_tittle_bg") forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:kImageName(@"global_search") style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:kImageName(@"title_button_more") style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];
    
    self.navigationItem.titleView = self.navV;
}

#pragma mark - Action
- (void)leftBarButtonClick
{
    
}

- (void)rightBarButtonClick
{
    
}

#pragma mark - Getters
- (UIScrollView *)bgScrollV
{
    if (!_bgScrollV) {
        _bgScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 49 - 64)];
        _bgScrollV.delegate = self;
        _bgScrollV.pagingEnabled = YES;
        _bgScrollV.contentSize = CGSizeMake(self.titleArr.count * kScreenW, 0);
    }
    return _bgScrollV;
}

- (SHNavView *)navV
{
    if (!_navV) {
        _navV = [[SHNavView alloc] initWithFrame:CGRectMake(0, 0, kScreenW - 100, 40) titleArr:self.titleArr titleBtnBlock:^(NSInteger btnTag) {
            [self.bgScrollV setContentOffset:CGPointMake(btnTag *kScreenW, 0) animated:YES];
        }];
    }
    return _navV;
}

- (NSArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = @[@"第1",@"第2",@"第3"];
    }
    return _titleArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
