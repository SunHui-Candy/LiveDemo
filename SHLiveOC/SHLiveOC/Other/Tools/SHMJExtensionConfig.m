//
//  SHMJExtensionConfig.m
//  SHLiveOC
//
//  Created by ios on 2017/8/2.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHMJExtensionConfig.h"
#import "SHCreatorModel.h"
#import "SHLive0C.h"


@implementation SHMJExtensionConfig
+ (void)load
{
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID": @"id"};
    }];
    
    [SHCreatorModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"desc":@"desciption"};
    }];
    

    
}
@end
