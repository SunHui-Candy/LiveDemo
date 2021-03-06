//
//  SHAPIConfig.h
//  SHLiveOC
//
//  Created by ios on 2017/8/2.
//  Copyright © 2017年 ios. All rights reserved.
//

#ifndef SHAPIConfig_h
#define SHAPIConfig_h

//http://service.ingkee.com/api/live/gettop?imsi=&uid=17800399&proto=5&idfa=A1205EB8-0C9A-4131-A2A2-27B9A1E06622&lc=0000000000000026&cc=TG0001&imei=&sid=20i0a3GAvc8ykfClKMAen8WNeIBKrUwgdG9whVJ0ljXi1Af8hQci3&cv=IK3.1.00_Iphone&devi=bcb94097c7a3f3314be284c8a5be2aaeae66d6ab&conn=Wifi&ua=iPhone&idfv=DEBAD23B-7C6A-4251-B8AF-A95910B778B7&osversion=ios_9.300000&count=5&multiaddr=1"

//http://service.ingkee.com/api/live/gettop?uid=17800399"

#define SERVER_HOST @"http://service.ingkee.com"

#define IMAGE_HOST @"http://img.meelive.cn/"

//首页数据
#define API_LiveGetTop @"api/live/gettop"

//广告地址
#define API_Advertise @"advertise/get"

//热门话题
#define API_TopicIndex @"api/live/topicindex"

//附近的人
#define API_NearLocation @"api/live/near_recommend"//?uid=85149891&latitude=40.090562&longitude=116.413353

//欢哥直播地址
#define Live_Dahuan @"rtmp://live.hkstv.hk.lxdns.com:1935/live/dahuan"


#endif /* SHAPIConfig_h */
