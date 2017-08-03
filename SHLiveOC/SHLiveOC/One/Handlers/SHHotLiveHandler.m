//
//  SHHotLiveHandler.m
//  SHLiveOC
//
//  Created by ios on 2017/8/2.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHHotLiveHandler.h"
#import "SHHttpTool.h"
#import "SHLiveModel.h"

@implementation SHHotLiveHandler

+ (void)executeGetHotLiveTaskPage:(NSInteger)pageNum success:(SHSuccessBlock)success failed:(SHFailedBlock)failed
{
    [SHHttpTool getPath:API_LiveGetTop params:@{@"uid":@"17800399"} success:^(id json) {
        NSInteger error = [json[@""] integerValue];
        if (!error) {
            //请求正常
            
            NSArray *livesArr = [SHLiveModel mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(livesArr);
        }else{
            failed(json);
        }
    } failure:^(NSError *error) {
        failed(error);
    }];
}
@end
