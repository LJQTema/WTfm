//
//  BDCloudMediaPlayerBitrateItem.h
//  BDCloudMediaPlayer
//
//  Copyright © 2016年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


/**
 抽象HLS多码率中的一个码率item。
 */
@interface BDCloudMediaPlayerBitrateItem : NSObject

/**
 从字符串构建。
 格式为: "<bitrate>,<width>x<height>"  例如："1000000,1920x1080"

 @param str 码率信息。
 @return 码率item。
 */
+ (instancetype)itemFromString:(NSString*)str;

/**
 分辨率。
 */
@property(nonatomic, readonly) CGSize resolution;

/**
 码率。
 */
@property(nonatomic, readonly) NSInteger bitrate;

@end
