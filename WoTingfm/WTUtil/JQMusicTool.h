//
//  JQMusicTool.h
//  WOTING
//
//  Created by jq on 2016/12/8.
//  Copyright © 2016年 jq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <BDCloudMediaPlayer/BDCloudMediaPlayer.h>
#import "Singleton.h"


@class WTModel;
@interface JQMusicTool : NSObject
singleton_interface(JQMusicTool)

@property(nonatomic, strong) BDCloudMediaPlayerController* BDplayer;

@property (nonatomic, copy) NSString *musicStr;//存路径
/*
 *音乐播放前的准备工作
 */
-(void)prepareToPlayWithMusic:(WTModel *)music;

/*
 *切歌
 */
- (void)ToChangeMusic:(WTModel *)model;

/*
 *播放
 */
-(void)play;
/*
 *暂停
 */
-(void)pause;



@end
