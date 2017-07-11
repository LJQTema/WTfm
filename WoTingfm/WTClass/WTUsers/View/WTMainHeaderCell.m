//
//  WTMainHeaderCell.m
//  WoTingfm
//
//  Created by jq on 2017/7/11.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTMainHeaderCell.h"

@implementation WTMainHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _headerImgV.layer.masksToBounds = YES;
    _headerImgV.layer.cornerRadius = 30;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end