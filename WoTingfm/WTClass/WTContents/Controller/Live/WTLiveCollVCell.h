//
//  WTLiveCollVCell.h
//  WoTingfm
//
//  Created by jq on 2017/6/19.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTLiveCollVCell : UICollectionViewCell

//封面图片
@property (weak, nonatomic) IBOutlet UIImageView *ContentImgV;
//直播或预告 图片
@property (weak, nonatomic) IBOutlet UIImageView *ZhiBoImgV;
//主标题
@property (weak, nonatomic) IBOutlet UILabel *ContentLab;
//副标题
@property (weak, nonatomic) IBOutlet UILabel *SubtitleLab;
//人数
@property (weak, nonatomic) IBOutlet UILabel *NumLab;


@end
