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

+ (void)executeGetAdvertiseWithSuccess:(SHSuccessBlock)success
                                failed:(SHFailedBlock)failed {
    
    [SHHttpTool getPath:API_Advertise params:nil success:^(id json) {
        
//        NSDictionary * resources = json[@"resources"][0];
//        SXTAdvertise * ad = [SXTAdvertise mj_objectWithKeyValues:resources];
//        success(ad);
        
    } failure:^(NSError *error) {
        
    }];
}




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

+ (void)executeNearLiveTaskWithSuccess:(SHSuccessBlock)success
                                failed:(SHFailedBlock)failed {
    
    NSDictionary * params = @{@"uid":@"85149891",
                              @"latitude":@"40.090562",
                              @"longitude":@"116.413353"
                              };
    
    [SHHttpTool getPath:API_NearLocation params:params success:^(id json) {
        
        NSInteger error = [json[@"dm_error"] integerValue];
        
        if (!error) {
            
            NSArray * lives = [SHLiveModel mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            
            success(lives);
            
        } else {
            
            failed(json);
            
        }
    } failure:^(NSError *error) {
        
        failed(error);
    }];
}

@end
