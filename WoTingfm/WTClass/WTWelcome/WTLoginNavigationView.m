//
//  WTLoginNavigationView.m
//  WoTingfm
//
//  Created by jq on 2017/6/5.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTLoginNavigationView.h"

@implementation WTLoginNavigationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self createBackBtn];  //创建关闭btn
        [self createLab];      //稍后登录
    }
    return self;
}

- (void)createLab{
    
    UILabel *lab = [[UILabel alloc] init];
    lab.font = [UIFont systemFontOfSize:FONT_SIZE_OF_PX(32)];
    lab.textColor = HYC__COLOR_HEX(959698);
    lab.text = @"稍后登录";
    [self addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_equalTo(POINT_X(-12));
        make.bottom.mas_equalTo(POINT_Y(-14));
        make.width.mas_equalTo(POINT_X(64));
        make.height.mas_equalTo(POINT_Y(16));
    }];
}

- (void)createBackBtn{
    
    UIButton *btn = [[UIButton alloc] init];
    [self addSubview:btn];
    [btn setImage:[UIImage imageNamed:@"Nav_icon_close.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(POINT_X(2));
        make.top.mas_equalTo(POINT_X(20));
        make.width.mas_equalTo(POINT_X(44));
        make.height.mas_equalTo(POINT_X(44));
    }];
    
    
}

- (void)closeBtnClick:(UIButton *)btn{
    
    
    [self.delegateController.navigationController popViewControllerAnimated:YES];
}

@end
