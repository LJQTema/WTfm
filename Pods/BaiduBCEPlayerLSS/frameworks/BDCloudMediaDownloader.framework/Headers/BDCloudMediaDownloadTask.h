// 
//  BDCloudMediaDownloadTask.h
//  BDCloudMediaDownloader
//
//  Copyright © 2016 Bailu. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 前置声明。
@class BDCloudMediaItem;

/**
 *  @brief 下载任务的状态。
 */
typedef NS_ENUM(NSUInteger, BDCloudMediaDownloadTaskState) {
    
    /**
     *  等待中。
     */
    BDCloudMediaDownloadTaskStateWait,
    /**
     *  下载中。
     */
    BDCloudMediaDownloadTaskStateRunning,
    /**
     *  已挂起。
     */
    BDCloudMediaDownloadTaskStateSuspend,
    /**
     *  已取消。
     */
    BDCloudMediaDownloadTaskStateCanceled,
    /**
     *  已完成。
     */
    BDCloudMediaDownloadTaskStateFinish,
    /**
     *  已失败。
     */
    BDCloudMediaDownloadTaskStateFailure
};

/**
 *  @brief 抽象一个下载任务。
 */
@interface BDCloudMediaDownloadTask : NSObject

/**
 *  @brief 下载任务相关信息。
 */
@property(nonatomic, copy, readonly) BDCloudMediaItem* item;

/**
 *  @brief 下载状态。
 */
@property(nonatomic, assign, readonly) BDCloudMediaDownloadTaskState state;

/**
 *  @brief 下载进度。
 */
@property(nonatomic, assign, readonly) float progress;

- (instancetype)init NS_UNAVAILABLE;

@end
