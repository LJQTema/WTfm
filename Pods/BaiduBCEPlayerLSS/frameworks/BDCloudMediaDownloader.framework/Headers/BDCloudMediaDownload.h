// 
//  BDCloudMediaDownload.h
//  BDCloudMediaDownloader
//
//  Copyright © 2016 Bailu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BDCloudMediaItem.h"
#import "BDCloudMediaDownloadTask.h"

/**
 *  @brief BDCloudMediaDownload类的downloadTaskWithURL方法返回错误时，这里是关于错误码的定义。
 */
typedef NS_ENUM(NSUInteger, BDCloudMediaDownloadErrorCode) {
    /**
     *  可以下载。
     */
    BDCloudMediaDownloadErrorCodeOK,
    /**
     *  已经存在且已下载完毕。
     */
    BDCloudMediaDownloadErrorCodeAlreadyExists,
    /**
     *  协议不被支持。
     */
    BDCloudMediaDownloadErrorCodeProtocolNotSupport,
};

/**
 *  @brief BDCloudMediaDownload类的一些回调函数定义。
 */
@protocol BDCloudMediaDownloadDelegate <NSObject>

@optional

/**
 *  @brief 任务开始。
 *  @param task 任务。
 */
- (void)taskStart:(BDCloudMediaDownloadTask*)task;

/**
 *  @brief 下载任务需要认证。
 *  @param task 下载任务。
 *  @param parameters 设置认证参数的字典。
 */
- (void)task:(BDCloudMediaDownloadTask*)task needAuthentication:(NSMutableDictionary*)parameters;

/**
 *  @brief 任务进度上报。
 *  @param task     任务。
 *  @param progress 进度。0~100
 */
- (void)task:(BDCloudMediaDownloadTask*)task progress:(float)progress;

/**
 *  @brief 任务完成。
 *  @param task  任务。
 *  @param error 错误，不为空表示发生了错误。
 */
- (void)taskEnd:(BDCloudMediaDownloadTask*)task error:(NSError*)error;

@end

/**
 *  @brief 下载管理器。必须指定用户名和代理进行初始化。
 */
@interface BDCloudMediaDownload : NSObject


@property(nonatomic, weak) id<BDCloudMediaDownloadDelegate> delegate;


/**
 *  @brief 指定用户名进行初始化。在没有账户系统时，可指定默认值。
 *  @param user 用户名。
 *  @return 下载管理器。
 */
- (instancetype)initWithUser:(NSString*)user;

/**
 *  @brief 指定用户名和代理进行初始化。在没有账户系统时，可指定默认值。
 *  @param user     用户名。
 *  @param delegate 代理。
 *  @return 下载管理器。
 */
- (instancetype)initWithUser:(NSString*)user
                    delegate:(id<BDCloudMediaDownloadDelegate>)delegate;

/**
 *  @brief 冻结或者解除冻结。冻结后将不调度处于等待状态的任务。
 *  @param frozen 为YES时表示冻结，为NO时为解除冻结。
 */
- (void)frozen:(BOOL)frozen;

/**
 *  @brief 当前所有(下载中、下载完成)的item。
 *  @return item数组。
 */
- (NSArray<BDCloudMediaItem*>*)mediaItems;

/**
 *  @brief 删除一个item
 *  @param item item。
 */
- (void)removeMediaItem:(BDCloudMediaItem*)item;

/**
 *  @brief 下载指定的URL，并为其指定一个标题。如果返回值为空，表示发生了错误，其查看error。
 *  @param url   URL地址。
 *  @param title 标题。
 *  @param error 错误信息，错误码与BDCloudMediaDownloadErrorCode中定义的值对应。
 *  @return 下载任务。
 */
- (BDCloudMediaDownloadTask*)downloadTaskWithURL:(NSString*)url title:(NSString*)title error:(NSError**)error;

/**
 *  @brief 挂起下载任务。
 *  @param task 下载任务。
 */
- (void)suspendTask:(BDCloudMediaDownloadTask*)task;

/**
 *  @brief 继续下载任务。
 *  @param task 下载任务。
 */
- (void)resumeTask:(BDCloudMediaDownloadTask*)task;

/**
 *  @brief 取消下载任务，并删除已下载的数据。
 *  @param task 下载任务。
 */
- (void)cancelTask:(BDCloudMediaDownloadTask*)task;

/**
 *  @brief 继续上次未完成的下载任务。
 *  @return 返回下载任务的数组。
 */
- (NSArray<BDCloudMediaDownloadTask*>*)resumeUncompletedTasks;

/**
 *  @brief 停止所有下载任务。将任务下载进度保存到磁盘。
 */
- (void)stopAllTasks;

/**
 *  @brief 删除此用户的所有文件。调用后，该对象将不再可用。
 */
- (void)clean;

@end

