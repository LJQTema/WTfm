//
//  WTFoundCellView.h
//  WoTingfm
//
//  Created by jq on 2017/6/9.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTFoundCellView : UIView

@property (nonatomic, strong) UILabel *ContentLab;
@property (nonatomic, strong) UIImageView *TuBiaoImgV;
/**
 待跳转的页面属性   0:每日听单  1:编辑精选
 */
@property (nonatomic, assign) NSInteger *FoundType;

@property (nonatomic, weak) UIViewController *delegate;


@end
