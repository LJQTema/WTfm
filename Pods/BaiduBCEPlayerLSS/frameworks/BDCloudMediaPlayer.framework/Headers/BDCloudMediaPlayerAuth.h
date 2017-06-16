//
//  BDCloudMediaPlayerAuth.h
//  BDCloudMediaPlayer
//
//  Copyright © 2016年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 认证代理。
 */
@protocol BDCloudMediaPlayerAuthDelegate <NSObject>
@optional

/**
 认证开始。
 */
- (void)authStart;

/**
 认证结束。

 @param error 错误不为空时，表示认证失败。
 */
- (void)authEnd:(NSError*)error;

@end

/**
 负责认证的单例。App启动后，必须进行认证，否则播放器无法运行。
 */
@interface BDCloudMediaPlayerAuth : NSObject

/**
 回调事件代理。
 */
@property(nonatomic, weak) id<BDCloudMediaPlayerAuthDelegate> delegate;

/**
 获取单例。

 @return 返回认证单例。
 */
+ (instancetype)sharedInstance;

/**
 设置AccessKey。

 @param ak AccessKey。注册成为百度云用户来获取。
 */
- (void)setAccessKey:(NSString*)ak;

@end
