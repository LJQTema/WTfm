//
//  WTLiveCollVRightCell.m
//  WoTingfm
//
//  Created by jq on 2017/6/21.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTLiveCollVRightCell.h"

@implementation WTLiveCollVRightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _ContentImgV.layer.masksToBounds = YES;
    _ContentImgV.layer.cornerRadius = 5;
}

@end
