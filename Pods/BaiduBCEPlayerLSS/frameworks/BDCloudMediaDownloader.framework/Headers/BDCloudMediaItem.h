// 
//  BDCloudMediaItem.h
//  BDCloudMediaDownloader
//
//  Copyright © 2016 Bailu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @brief 一个离线音视频的状态。
 */
typedef NS_ENUM(NSUInteger, BDCloudMediaItemStatus) {
    /**
     *  正在下载。
     */
    BDCloudMediaItemStatusDownloading,
    /**
     *  下载完毕。
     */
    BDCloudMediaItemStatusReady,
    /**
     *  数据被删除。
     */
    BDCloudMediaItemStatusMiss
};

/**
 *  @brief 一个离线下载的相关信息。
 */
@interface BDCloudMediaItem : NSObject

/**
 *  @brief 标识。
 */
@property(nonatomic, copy, readonly) NSString* identify;

/**
 *  @brief 音视频的原始URL。
 */
@property(nonatomic, copy, readonly) NSString* url;

/**
 *  @brief 音视频标题。
 */
@property(nonatomic, copy, readonly) NSString* title;

/**
 *  @brief 数据保存路径。
 */
@property(nonatomic, copy, readonly) NSString* path;

/**
 *  @brief 可播放文件名。即可播放文件的全路径为 path + "/" + index
 */
@property(nonatomic, copy, readonly) NSString* index;

/**
 *  @brief 数据文件大小。
 */
@property(nonatomic, copy, readonly) NSString* size;

/**
 *  @brief 状态。
 */
@property(nonatomic, readonly) BDCloudMediaItemStatus status;

/**
 *  @brief 下载进度
 */
@property(nonatomic, assign, readonly) float progress;


- (instancetype)init NS_UNAVAILABLE;

@end
