//
//  WTFoundContentCell.m
//  WoTingfm
//
//  Created by jq on 2017/6/9.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTFoundContentCell.h"

@implementation WTFoundContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _leftImgV.layer.cornerRadius = 2;
    _leftImgV.layer.masksToBounds = YES;
    
    _CenterImgV.layer.cornerRadius = 2;
    _CenterImgV.layer.masksToBounds = YES;
    
    _rightImgV.layer.cornerRadius = 2;
    _rightImgV.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
