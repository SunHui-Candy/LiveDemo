//
//  SHHotViewController.m
//  SHLiveOC
//
//  Created by ios on 2017/8/1.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHHotViewController.h"
#import "SHHotCell.h"
#import "SHHotLiveHandler.h"

static NSString *SHHotCellID = @"SHHotCellID";
@interface SHHotViewController ()

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation SHHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"SHHotCell" bundle:nil] forCellReuseIdentifier:SHHotCellID];
    [self loadData];
}

#pragma mark - 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHHotCell *cell = [tableView dequeueReusableCellWithIdentifier:SHHotCellID forIndexPath:indexPath];
    cell.liveModel = self.dataArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60 + self.view.bounds.size.width + 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark - Private&Public Methods
- (void)loadData
{
    [SHHotLiveHandler executeGetHotLiveTaskPage:0 success:^(id obj) {
        [self.dataArr addObjectsFromArray:obj];
        [self.tableView reloadData];
    } failed:^(id obj) {
        
    }];
}

#pragma mark - Getters
- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
