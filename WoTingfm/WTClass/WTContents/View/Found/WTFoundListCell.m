//
//  WTFoundListCell.m
//  WoTingfm
//
//  Created by jq on 2017/6/9.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTFoundListCell.h"

@implementation WTFoundListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _ContentImgV.layer.cornerRadius = 2;
    _ContentImgV.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
