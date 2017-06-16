//
//  BDCloudMediaPlayerController.h
//  BDCloudMediaPlayer
//
//  Copyright © 2016年 Baidu. All rights reserved.
//

#import "BDCloudMediaPlayerEnum.h"


/**
 百度云播放器iOS SDK (以下简称"SDK") 是百度云推出的IOS平台音视频播放器软件开发包（SDK），为iOS开发者提供简单、便捷的开发接口，帮助开发者在
 iPad/iPhone/iPod和Apple TV设备上实现媒体播放功能。播放器SDK内嵌百度自主研发的T5播放内核，提供简单、便捷的媒体应用开发能力，具有以下功能：
    * 本地全媒体格式支持
        * 突破iOS平台对视频格式的限制，支持所有主流的媒体格式 (mp4、avi、wmv、flv、mkv、mov、rmvb等)。
    * 支持主流的流媒体格式
        * 支持HLS、RTMP、RTSP、HTTP FLV等。
    * 高性能
        * 低CPU、内存占用。
    * 硬件加速
        * 支持GPU硬解码。
    * 完美用户体验
        * 直播秒开、追赶播放技术。
    * 低门槛、高灵活度实现播放功能
        * 简单易用的API，提供快速媒体播放功能开发和示开发例。播放器SDK提供了与系统播放器MPMoviePlayerController高度相似的调用接口。
 */
@interface BDCloudMediaPlayerController : NSObject

/**
 视频渲染的视图。
 视图只负责渲染视频内容，播放器相关控制UI(播放、暂停等)需要开发者实现。可以参考SDK包提供的Demo示例。
 相当于iOS系统播放器MPMoviePlayerController的控制方式controlStyle为MPMovieControlStyleNone的效果。
 */
@property(nonatomic, strong, readonly) UIView* view;

/**
 视频文件的URL地址，该地址可以是服务器地址, 或者本地地址(使用fileURLWithPath:isDirectory:创建URL)。
 使用contenString也能设置视频播放地址。
 
 * 当播放器正在播放视频时，设置contenURL将不会导致播放新视频。
 * 如果希望播放新视频，需要按以下方式调用:
    * [player stop];
    * [player reset];
    * player.contentURL = url;
    * [player prepareToPlay];
 */
@property(nonatomic, strong) NSURL* contentURL;

/**
 视频文件的地址，该地址可以是服务器地址, 或者本地地址。
 使用contentURL也能设置视频播放地址。
 
 * 当播放器正在播放视频时，设置contenURL将不会导致播放新视频。
 * 如果希望播放新视频，需要按以下方式调用:
 * [player stop];
 * [player reset];
 * player.contentString = content;
 * [player prepareToPlay];
 */
@property(nonatomic, copy) NSString* contentString;

/**
 播放器是否已完成视频的初始化工作。
 当调用prepareToPlay方法后，播放器开始视频的初始化，完成初始化会发送BDCloudMediaPlayerPlaybackIsPreparedToPlayNotification通知。
 并设置isPreparedToPlay为YES。
 */
@property(nonatomic, readonly) BOOL isPreparedToPlay;

/**
 播放器的当前状态。
 可以注册BDCloudMediaPlayerPlaybackStateDidChangeNotification通知来监听状态变化。
 */
@property(nonatomic, readonly) BDCloudMediaPlayerPlaybackState playbackState;

/**
 播放器的当前加载状态。
 可以注册BDCloudMediaPlayerLoadStateDidChangeNotification通知来监听加载状态变化。
 */
@property(nonatomic, readonly) BDCloudMediaPlayerLoadState loadState;

/**
 视频显示的缩放模式。默认为BDCloudMediaPlayerScalingModeAspectFit。
 */
@property(nonatomic) BDCloudMediaPlayerScalingMode scalingMode;

/**
 视频开始播放的时刻。浮点数，单位秒。
 当视频开始播放前，设置initialPlaybackTime来改变视频的起始播放位置。
 */
@property(nonatomic) NSTimeInterval initialPlaybackTime;

/**
 视频播放到的时刻。浮点数，单位秒。
 当视频正在播放时，设置currentPlaybackTime和调用seek:函数效果一致。
 */
@property(nonatomic) NSTimeInterval currentPlaybackTime;

/**
 视频的原始分辨率大小。单位像素。
 获取时机：在收到BDCloudMediaPlayerPlaybackIsPreparedToPlayNotification通知后获取。
 */
@property(nonatomic, readonly) CGSize naturalSize;

/**
 视频的总时长。单位秒。
 获取时机：在收到BDCloudMediaPlayerPlaybackIsPreparedToPlayNotification通知后获取。
 当为直播视频时，duration的值可能为0。
 */
@property(nonatomic, readonly) NSTimeInterval duration;

/**
 视频的可播放长度。单位秒。
 可播放长度 = 当前视频播放到的位置 + 已缓冲长度。
 */
@property(nonatomic, readonly) NSTimeInterval playableDuration;

/**
 是否自动播放。默认值为YES。
 * 如果设置为YES。在调用prepareToPlay，播放器完成视频初始化后(收到BDCloudMediaPlayerPlaybackIsPreparedToPlayNotification通知),
   会自动调用play方法播放视频。
 * 如果设置为NO。在调用prepareToPlay，播放器完成视频初始化后(收到BDCloudMediaPlayerPlaybackIsPreparedToPlayNotification通知),
   需要用户主动调用play方法来播放视频。
 */
@property(nonatomic) BOOL shouldAutoplay;

/**
 视频播放速率。默认值为1.0。取值范围 [0.0, 4.0] 。
 */
@property(nonatomic) float playbackRate;

/**
 网络视频下载速度。单位Bps.
 */
@property(nonatomic, readonly) float downloadSpeed;

/**
 初始化播放器，并设置播放地址URL。功能与initWithContentString一致。
 之后，还需要调用prepareToPlay方法来初始化视频。具体参考prepareToPlay的说明。

 @param contentURL 视频地址URL。
 @return 播放器实例。
 */
- (instancetype)initWithContentURL:(NSURL*)contentURL;

/**
 初始化播放器，并设置播放地址。功能与initWithContentURL一致。
 之后，还需要调用prepareToPlay方法来初始化视频。具体参考prepareToPlay的说明。

 @param contentString 视频地址
 @return 播放器实例。
 */
- (instancetype)initWithContentString:(NSString*)contentString;

/**
 播放器初始化视频。
 初始化完成后，播放器会发送BDCloudMediaPlayerPlaybackIsPreparedToPlayNotification通知，并设置isPreparedToPlay为YES。
 此时，可以获取视频的相关信息，如naturalSize, duration等。如果shouldAutoplay设置为YES。播放器还会自动调用play方法，自动播放视频。
 */
- (void)prepareToPlay;

/**
 播放。
 */
- (void)play;

/**
 暂停。
 */
- (void)pause;

/**
 停止。
 */
- (void)stop;

/**
 重置。
 */
- (void)reset;

/**
 快速定位播放位置。在播放时设置currentPlaybackTime的值，也会发起seek的调用。

 @param position 播放位置。
 */
- (void)seek:(NSTimeInterval)position;

/**
 当前播放器是否正在播放视频。即playbackState是否为BDCloudMediaPlayerPlaybackStatePlaying。

 @return 范围YES为正在播放视频。
 */
- (BOOL)isPlaying;

/**
 设置App进入后台后，播放器是否暂停播放。

 @param pause 传YES时会在进入后台后停止播放。
 */
- (void)setPauseInBackground:(BOOL)pause;

/**
 设置缓冲区的大小。默认值1MB。范围(0, 5MB]。

 @param bytes 缓冲区大小。单位字节。
 */
- (void)setMaxCacheSizeInBytes:(NSUInteger)bytes;

/**
 设置缓冲区长度。默认值1秒。范围（0， 4s]。

 @param time 缓冲区长度。单位秒。
 */
- (void)setCachePauseTime:(NSTimeInterval)time;

/**
 设置起播放时最大缓冲时长。默认值为1秒。范围（0， 4s]。
 
 @param time 缓冲区长度。单位秒。
 */
- (void)setFirstBufferingTime:(NSTimeInterval)time;

/**
 截图，对当前帧进行截图。

 @return 图片。
 */
- (UIImage*)thumbnailImageAtCurrentTime;
@end

/**
 播放器硬件加速类别。
 */
@interface BDCloudMediaPlayerController (HardwareAccelerateSupport)

/**
 设置播放器解码模式。
 设置并不一定会生效。取决于具体的设备。

 @param mode 解码模式。
 */
- (void)setVideoDecodeMode:(BDCloudMediaPlayerVideoDecodeMode)mode;

/**
 是否硬解码。

 @return 硬解码返回YES。
 */
- (BOOL)viaHardwareAccelerate;
@end

@class BDCloudMediaPlayerBitrateItem;

/**
 HLS多码率支持类别。HLS有Master Playlist，支持用户在播放时根据网络情况选择合适的码率。
 有3个接口：
    * 获取多码率列表。
    * 获取当前码率索引。
    * 设置当前码率索引。
 */
@interface BDCloudMediaPlayerController (HLSMultiBitratesSupport)

/**
 获取多码率列表。
 如果返回数组的count小于2，表示不是一个多码率HLS视频。

 @return 多码率列表。
 */
- (NSArray<BDCloudMediaPlayerBitrateItem*>*)getSupportedBitrates;

/**
 获取当前码率索引。

 @return 当前码率索引。
 */
- (NSInteger)bitrateIndex;

/**
 设置当前码率索引。

 @param index 码率索引。
 */
- (void)setBitrateIndex:(NSInteger)index;
@end

/**
 类方法类别。
 */
@interface BDCloudMediaPlayerController (Class)

/**
 设置日志开关。

 @param report 设置为YES表示输出日志。
 */
+ (void)setLogReport:(BOOL)report;

/**
 设置日志报告级别。

 @param loglevel 日志级别。
 */
+ (void)setLogLevel:(BDCloudMediaPlayerLogLevel)loglevel;

/**
 获取播放器版本号。

 @return 版本号。
 */
+ (NSString*)getSDKVersion;
@end

/**
 版权保护类别。
 如果用户有版权保护的需求，可以接入百度云多媒体VOD服务。https://cloud.baidu.com/product/vod.html
 各种视频资源，在经过VOD服务转码后，可以生成支持版权保护的HLS视频资源，通过CDN分发。
 */
@interface BDCloudMediaPlayerController (DRM)

/**
 设置自定义playerID和playerKey。

 @param player 自定义的playerId。
 @param key 自定义的playerKey。
 */
- (void)setPlayerID:(NSString*)player key:(NSString*)key;

/**
 设置视频的token。
 token加密方式为临时授权，可以设置token的过期时间。相对于自定义playerID和playerKey的方式，更加灵活。

 @param token 临时token。
 */
- (void)setToken:(NSString*)token;
@end

/**
 水印支持类别。
 */
@interface BDCloudMediaPlayerController (Watermark)

/**
 设置水印图片。

 @param image 水印图片。
 */
- (void)setWatermark:(UIImage*)image;

/**
 设置水印图片显示的位置。
 这里设置的水印在视频渲染视图view上的位置。根据实际的缩放模式和宽高比，水印显示的位置可能有所变化，开发者需要处理横竖屏时水印的位置。

 @param pos 水印位置。
 */
- (void)setWatermarkPosition:(CGPoint)pos;
@end

// 通知相关

// 播放状态更新
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerPlaybackStateDidChangeNotification;

// 加载状态更新
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerLoadStateDidChangeNotification;

// 准备播放
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerPlaybackIsPreparedToPlayNotification;

// 播放完毕
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerPlaybackDidFinishNotification;

// 缓冲开始
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerBufferingStartNotification;

// 缓冲更新
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerBufferingUpdateNotification;

// 缓冲结束
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerBufferingEndNotification;

// 拖动
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerSeekCompleteNotification;

// 第一个视频帧渲染
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerFirstVideoFrameRenderedNotification;

// 第一个音频帧渲染
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerFirstAudioFrameRenderedNotification;

// 通知中获取信息的Key

// 播放完毕的原因，用于 BDCloudMediaPlayerPlaybackDidFinishNotification 中。
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerPlaybackDidFinishReasonUserInfoKey;

// 缓冲进度，用于 BDCloudMediaPlayerBufferingUpdateNotification 中。
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerBufferingProgressUserInfoKey;

// 缓冲位置，用于 BDCloudMediaPlayerBufferingUpdateNotification 中。
BDCLOUD_MP_EXTERN NSString* const BDCloudMediaPlayerBufferingPositionUserInfoKey;
