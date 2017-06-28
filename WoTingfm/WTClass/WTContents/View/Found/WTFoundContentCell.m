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
    
    _leftImgV.userInteractionEnabled = YES;
    _leftLab.userInteractionEnabled = YES;
    UITapGestureRecognizer *leftImgTop = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftTop)];
    UITapGestureRecognizer *leftLabTop = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftTop)];
    [_leftImgV addGestureRecognizer:leftImgTop];
    [_leftLab addGestureRecognizer:leftLabTop];
    
    _CenterImgV.userInteractionEnabled = YES;
    _centerLab.userInteractionEnabled = YES;
    UITapGestureRecognizer *centerImgTop = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(CenterTop)];
    UITapGestureRecognizer *centerLabTop = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(CenterTop)];
    [_CenterImgV addGestureRecognizer:centerImgTop];
    [_centerLab addGestureRecognizer:centerLabTop];
    
    _rightImgV.userInteractionEnabled = YES;
    _rightLab.userInteractionEnabled = YES;
    UITapGestureRecognizer *rightImgTop = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightTop)];
    UITapGestureRecognizer *rightLabTop = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightTop)];
    [_rightImgV addGestureRecognizer:rightImgTop];
    [_rightLab addGestureRecognizer:rightLabTop];
}

- (void)NotificationdelegateWithType:(ImgandLabType)Type{
    //代理方法确认
    if ([self.delegate respondsToSelector:@selector(ImgandLabClick:)]) {
        [self.delegate ImgandLabClick:Type];
    }
}

- (void)leftTop{
    
    [self NotificationdelegateWithType:leftType];
}

- (void)CenterTop{
    
    [self NotificationdelegateWithType:centerType];
}

- (void)rightTop{
    
    [self NotificationdelegateWithType:rightType];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
