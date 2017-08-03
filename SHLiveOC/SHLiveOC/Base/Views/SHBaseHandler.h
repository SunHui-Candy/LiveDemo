//
//  SHBaseHandler.h
//  SHLiveOC
//
//  Created by ios on 2017/8/2.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Handler处理完成后调用的Block
 */
typedef void (^SHCompleteBlock)();

/**
 *  Handler处理成功时调用的Block
 */
typedef void (^SHSuccessBlock)(id obj);

/**
 *  Handler处理失败时调用的Block
 */
typedef void (^SHFailedBlock)(id obj);



@interface SHBaseHandler : NSObject


@end
