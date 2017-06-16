//
//  JQMusicTool.m
//  WOTING
//
//  Created by jq on 2016/12/8.
//  Copyright © 2016年 jq. All rights reserved.
//

#import "JQMusicTool.h"

#import "WTModel.h"


@interface JQMusicTool()



@end

@implementation JQMusicTool
singleton_implementation(JQMusicTool)

-(void)prepareToPlayWithMusic:(WTModel *)music{
    //创建播放器

    _musicStr = music.ContentPlay;
    
    NSURL *musicURL = [NSURL URLWithString:_musicStr];
    
    _BDplayer = [[BDCloudMediaPlayerController alloc] initWithContentURL:musicURL];
     _BDplayer.shouldAutoplay = NO;  //等待播放指令
    [_BDplayer prepareToPlay];
   
    

//    if ([_musicStr hasSuffix:@"flv"] || [_musicStr hasSuffix:@"flv:fm"]) {
//
//        
//    }else {
//
//        
//        FMDatabase *db = [FMDBTool createDatabaseAndTable:@"XIAZAI"];
//        
//        BOOL isRept = NO;
//        FMResultSet *resultSet = [db executeQuery:@"SELECT * FROM XIAZAI"];
//        // 遍历结果，如果重复就删除数据
//        while ([resultSet next]) {
//            
//            NSData *ID = [resultSet dataForColumn:@"XIAZAI"];
//            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:ID options:NSJSONReadingMutableLeaves error:nil];
//            if ([_musicStr isEqualToString:jsonDict[@"ContentPlay"]]){
//                
//                isRept = YES;
//            }
//        }
//        
//        if (!isRept) {  //播网络
//            
//            NSURL *musicURL = [NSURL URLWithString:_musicStr];
//
//            
//        }else {  //播本地
            //遍历文件夹
//            NSString *appDocDir = [[[[NSFileManager defaultManager] URLsForDirectory: NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] relativePath];
//            NSString *appDocDir1 = [NSString stringWithFormat:@"%@/MCDownloadCache",appDocDir];
//            NSArray *contentOfFolder = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:appDocDir1 error:NULL];
//            for (NSString *aPath in contentOfFolder) {
//                NSString * fullPath = [appDocDir1 stringByAppendingPathComponent:aPath];
//                BOOL isDir = NO;
//                if ([[NSFileManager defaultManager] fileExistsAtPath:fullPath isDirectory:&isDir])
//                {
//                    
//                    if ([_musicStr hasSuffix:aPath]) {
//                        
//                      self.currentItem = [[AVPlayerItem alloc] initWithURL:[NSURL fileURLWithPath:fullPath]];
//                    }
//                    
//                }
//            }

    
}


-(void)play{
    

   [self.BDplayer play];
}


-(void)pause{
    
    [self.BDplayer pause];
}




@end
