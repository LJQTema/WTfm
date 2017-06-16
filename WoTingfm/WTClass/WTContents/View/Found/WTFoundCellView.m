//
//  WTFoundCellView.m
//  WoTingfm
//
//  Created by jq on 2017/6/9.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTFoundCellView.h"

#import "WTFoundDetailVC.h"     //页面详情页

@implementation WTFoundCellView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setupView{
    
    //图标
    _TuBiaoImgV = [[UIImageView alloc] init];
    _TuBiaoImgV.image = [UIImage imageNamed:@"discount_icon_title.png"];
    [self addSubview:_TuBiaoImgV];
    [_TuBiaoImgV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(15);
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(15);
    }];
    
    //标题
    _ContentLab = [[UILabel alloc] init];
    _ContentLab.font = [UIFont systemFontOfSize:15];
    _ContentLab.textColor = HYC__COLOR_HEX(0x16181A);
    [self addSubview:_ContentLab];
    [_ContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(17);
        make.top.mas_equalTo(15);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(15);
    }];
    
    //更多按钮
    UIButton *MoreBtn = [[UIButton alloc] init];
    [MoreBtn setImage:[UIImage imageNamed:@"discount_icon_mores.png"] forState:UIControlStateNormal];
    [MoreBtn addTarget:self action:@selector(MoreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:MoreBtn];
    [MoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_equalTo(-6);
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(24);
    }];
    
}


- (void)MoreBtnClick{
    
    WTFoundDetailVC *wtFDVC = [[WTFoundDetailVC alloc] init];
    wtFDVC.DetailType = _FoundType;
    [self.delegate.navigationController pushViewController:wtFDVC animated:YES];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
