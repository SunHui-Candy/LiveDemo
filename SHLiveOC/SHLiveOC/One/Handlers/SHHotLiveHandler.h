//
//  SHHotLiveHandler.h
//  SHLiveOC
//
//  Created by ios on 2017/8/2.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHBaseHandler.h"

@interface SHHotLiveHandler : SHBaseHandler

//热门
+ (void)executeGetHotLiveTaskPage:(NSInteger)pageNum success:(SHSuccessBlock)success failed:(SHFailedBlock)failed;
//下载广告
+ (void)executeGetAdvertiseWithSuccess:(SHSuccessBlock)success
                                failed:(SHFailedBlock)failed;

//附近
+ (void)executeNearLiveTaskWithSuccess:(SHSuccessBlock)success
                                failed:(SHFailedBlock)failed;


@end
