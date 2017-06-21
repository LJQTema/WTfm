//
//  WTLiveCollVCell.m
//  WoTingfm
//
//  Created by jq on 2017/6/19.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTLiveCollVCell.h"

@implementation WTLiveCollVCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    _ContentImgV.layer.masksToBounds = YES;
    _ContentImgV.layer.cornerRadius = 5;
}

@end
