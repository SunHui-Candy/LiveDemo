//
//  SHTabBarController.m
//  SHLiveOC
//
//  Created by ios on 2017/7/28.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHTabBarController.h"
#import "SHTabBar.h"
#import "SHNavgationController.h"

@interface SHTabBarController ()

@property (nonatomic, strong) SHTabBar *customTabBar;

@end

@implementation SHTabBarController



- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupChildVc];

    
    [self.tabBar addSubview:self.customTabBar];

    
    __weak typeof(self) weakSelf = self;
    
    [self.customTabBar setBtnBlock:^(NSInteger tag) {
        
        if (tag >= SHTabBarTypeLive) {
            weakSelf.selectedIndex = tag - SHTabBarTypeLive;
        }else{
            
        }
        
    }];
    
}


#pragma mark - Private&Public Methods
- (void)setupChildVc
{
    NSMutableArray *childArr = [NSMutableArray arrayWithObjects:@"SHOneViewController",@"SHThreeViewController", nil];
    for (NSInteger i = 0; i < childArr.count; i++) {
        UIViewController *vcName = [[NSClassFromString(childArr[i]) alloc] init];
        SHNavgationController *nav = [[SHNavgationController alloc] initWithRootViewController:vcName];
        [childArr replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = childArr;
    
}

#pragma mark - Getters
- (SHTabBar *)customTabBar
{
    if (!_customTabBar) {
        _customTabBar = [[SHTabBar alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 49)];
    }
    return _customTabBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
