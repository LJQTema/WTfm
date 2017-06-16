//
//  BDCloudMediaPlayerEnum.h
//  BDCloudMediaPlayer
//
//  Copyright © 2016年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "BDCloudMediaPlayerDefines.h"

/**
 播放器状态。
 
 - BDCloudMediaPlayerPlaybackStateStopped:          停止。
 - BDCloudMediaPlayerPlaybackStatePlaying:          播放。
 - BDCloudMediaPlayerPlaybackStatePaused:           暂停。
 - BDCloudMediaPlayerPlaybackStateInterrupted:      中断。
 - BDCloudMediaPlayerPlaybackStateSeekingForward:   快进。
 - BDCloudMediaPlayerPlaybackStateSeekingBackward:  快退。
 */
typedef NS_ENUM(NSInteger, BDCloudMediaPlayerPlaybackState) {
    BDCloudMediaPlayerPlaybackStateStopped,
    BDCloudMediaPlayerPlaybackStatePlaying,
    BDCloudMediaPlayerPlaybackStatePaused,
    BDCloudMediaPlayerPlaybackStateInterrupted,
    BDCloudMediaPlayerPlaybackStateSeekingForward,
    BDCloudMediaPlayerPlaybackStateSeekingBackward
};

/**
 播放器加载状态。

 - BDCloudMediaPlayerLoadStateUnknown:              未知状态。
 - BDCloudMediaPlayerLoadStatePlayable:             可播放状态。
 - BDCloudMediaPlayerLoadStatePlaythroughOK:        缓冲完成，可以开始播放。
 - BDCloudMediaPlayerLoadStateStalled:              缓冲中。
 */
typedef NS_OPTIONS(NSInteger, BDCloudMediaPlayerLoadState) {
    BDCloudMediaPlayerLoadStateUnknown = 0,
    BDCloudMediaPlayerLoadStatePlayable = 1 << 0,
    BDCloudMediaPlayerLoadStatePlaythroughOK = 1 << 1,
    BDCloudMediaPlayerLoadStateStalled = 1 << 2
};

/**
 播放结束原因。
 
 - BDCloudMediaPlayerFinishReasonEnd:               正常结束。
 - BDCloudMediaPlayerFinishReasonError:             发生错误。
 - BDCloudMediaPlayerFinishReasonUser:              用户停止。
 */
typedef NS_ENUM(NSInteger, BDCloudMediaPlayerFinishReason) {
    BDCloudMediaPlayerFinishReasonEnd,
    BDCloudMediaPlayerFinishReasonError,
    BDCloudMediaPlayerFinishReasonUser
};

/**
 缩放模式。
 
 - BDCloudMediaPlayerScalingModeNone:               不缩放。
 - BDCloudMediaPlayerScalingModeAspectFit:          等比缩放，可能会产生黑边。
- BDCloudMediaPlayerScalingModeAspectFill:          等比填充，可能有部分画面被裁减。
 - BDCloudMediaPlayerScalingModeFill:               铺满整个视图。
 */
typedef NS_ENUM(NSInteger, BDCloudMediaPlayerScalingMode) {
    BDCloudMediaPlayerScalingModeNone,
    BDCloudMediaPlayerScalingModeAspectFit,
    BDCloudMediaPlayerScalingModeAspectFill,
    BDCloudMediaPlayerScalingModeFill
};

/**
 日志级别。
 
 - BDCloudMediaPlayerLogLevelUnknown:               未知。
 - BDCloudMediaPlayerLogLevelDefault:               默认。
 - BDCloudMediaPlayerLogLevelVerbose:               详细。
 - BDCloudMediaPlayerLogLevelDebug:                 调试。
 - BDCloudMediaPlayerLogLevelInfo:                  信息。
 - BDCloudMediaPlayerLogLevelWarnning:              警告。
 - BDCloudMediaPlayerLogLevelError:                 错误。
 - BDCloudMediaPlayerLogLevelFatal:                 严重错误。
 - BDCloudMediaPlayerLogLevelSilent:                静默。
 */
typedef NS_ENUM(NSInteger, BDCloudMediaPlayerLogLevel) {
    BDCloudMediaPlayerLogLevelUnknown,
    BDCloudMediaPlayerLogLevelDefault,
    BDCloudMediaPlayerLogLevelVerbose,
    BDCloudMediaPlayerLogLevelDebug,
    BDCloudMediaPlayerLogLevelInfo,
    BDCloudMediaPlayerLogLevelWarnning,
    BDCloudMediaPlayerLogLevelError,
    BDCloudMediaPlayerLogLevelFatal,
    BDCloudMediaPlayerLogLevelSilent
};

/**
 解码方式。

 - BDCloudMediaPlayerVideoDecodeModeSoftware:       软解。
 - BDCloudMediaPlayerVideoDecodeModeHardware:       硬解。
 - BDCloudMediaPlayerVideoDecodeModeAuto:           自动。
 */
typedef NS_ENUM(NSInteger, BDCloudMediaPlayerVideoDecodeMode) {
    BDCloudMediaPlayerVideoDecodeModeSoftware,
    BDCloudMediaPlayerVideoDecodeModeHardware,
    BDCloudMediaPlayerVideoDecodeModeAuto,
};
