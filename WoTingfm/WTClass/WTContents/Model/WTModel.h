//
//  WTModel.h
//  WoTingfm
//
//  Created by jq on 2017/6/14.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTModel : NSObject

@property (nonatomic, copy)NSString *ContentImg;      //内容图片
@property (nonatomic, copy)NSString *ContentName;     //内容名
@property (nonatomic, copy)NSString *ContentPlay;     //内容url
@property (nonatomic, assign)uint64_t ContentTimes;    //内容时长
@property (nonatomic, copy)NSString *ContentId;       //内容ID
@property (nonatomic, copy)NSString *ContentFavorite;  //是否喜欢
@property (nonatomic, copy)NSString *MediaType;       //电台类型
@property (nonatomic, copy)NSString *ContentPub;      //来源
@property (nonatomic, copy)NSString *ContentDescn;    //简介
@property (nonatomic, copy)NSString *ContentShareURL; //分享网址

@end
