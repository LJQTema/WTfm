//
//  WTPersonHeaderCell.m
//  WoTingfm
//
//  Created by jq on 2017/7/11.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTPersonHeaderCell.h"

@implementation WTPersonHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _contentImgV.layer.masksToBounds = YES;
    _contentImgV.layer.cornerRadius = 30;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
