//
//  SHLive0C.h
//  SHLiveOC
//
//  Created by ios on 2017/7/31.
//  Copyright © 2017年 ios. All rights reserved.
//

#ifndef SHLive0C_h
#define SHLive0C_h

#define kImageName(imageNameStr) [UIImage imageNamed:imageNameStr]

//#define kFormat(string, args...)                  [NSString stringWithFormat:string, args]

#define kFormatStr(str,args...) [NSString stringWithFormat:str,args]

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height


#define kRedColor [UIColor redColor]

#endif /* SHLive0C_h */
