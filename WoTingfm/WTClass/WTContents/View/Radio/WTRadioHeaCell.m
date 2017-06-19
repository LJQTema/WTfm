//
//  WTRadioHeaCell.m
//  WoTingfm
//
//  Created by jq on 2017/6/16.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTRadioHeaCell.h"

#import "WTContentsDetailVC.h"

@implementation WTRadioHeaCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self CreatUI];
}

- (void)CreatUI{
    
    //本地台
    _BenDiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _BenDiBtn.tag = 100;
    [_BenDiBtn setImage:[UIImage imageNamed:@"Station_icon_local"] forState:UIControlStateNormal];
    [_BenDiBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_RadioView addSubview:_BenDiBtn];
    [_BenDiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(POINT_X(60));
        make.top.mas_equalTo(18);
        make.width.mas_equalTo(52);
        make.height.mas_equalTo(52);
    }];
    _BenDiLab = [[UILabel alloc] init];
    _BenDiLab.text = @"本地台";
    _BenDiLab.font = [UIFont systemFontOfSize:14];
    _BenDiLab.textAlignment = NSTextAlignmentCenter;
    [_RadioView addSubview:_BenDiLab];
    [_BenDiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(_BenDiBtn.mas_centerX);
        make.top.equalTo(_BenDiBtn.mas_bottom).with.offset(7);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(15);
    }];
    
    //国家台
    _GuoJiaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _GuoJiaBtn.tag = 101;
    [_GuoJiaBtn setBackgroundImage:[UIImage imageNamed:@"Station_icon_country"] forState:UIControlStateNormal];
    [_GuoJiaBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_RadioView addSubview:_GuoJiaBtn];
    [_GuoJiaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(_RadioView.mas_centerX);
        make.top.mas_equalTo(18);
        make.width.mas_equalTo(52);
        make.height.mas_equalTo(52);
    }];
    _GuoJiaLab = [[UILabel alloc] init];
    _GuoJiaLab.text = @"国家台";
    _GuoJiaLab.font = [UIFont systemFontOfSize:14];
    _GuoJiaLab.textAlignment = NSTextAlignmentCenter;
    [_RadioView addSubview:_GuoJiaLab];
    [_GuoJiaLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(_RadioView.mas_centerX);
        make.top.equalTo(_GuoJiaBtn.mas_bottom).with.offset(7);
        make.width.mas_equalTo(52);
        make.height.mas_equalTo(15);
    }];
    
    //省市台
    _ShengShiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _ShengShiBtn.tag = 102;
    [_ShengShiBtn setImage:[UIImage imageNamed:@"Station_icon_province"] forState:UIControlStateNormal];
    [_ShengShiBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_RadioView addSubview:_ShengShiBtn];
    [_ShengShiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(-POINT_X(60));
        make.top.mas_equalTo(18);
        make.width.mas_equalTo(52);
        make.height.mas_equalTo(52);
    }];
    _ShengShiLab = [[UILabel alloc] init];
    _ShengShiLab.text = @"省市台";
    _ShengShiLab.font = [UIFont systemFontOfSize:14];
    _ShengShiLab.textAlignment = NSTextAlignmentCenter;
    [_RadioView addSubview:_ShengShiLab];
    [_ShengShiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(_ShengShiBtn.mas_centerX);
        make.top.equalTo(_ShengShiBtn.mas_bottom).with.offset(7);
        make.width.mas_equalTo(52);
        make.height.mas_equalTo(15);
    }];

    
}

- (void)BtnClick:(UIButton *)btn{
    
    if (btn.tag == 100) {   //本地
        
        WTContentsDetailVC *wtDVC = [[WTContentsDetailVC alloc] init];
        wtDVC.LabText = @"本地台";
        [self.delegate.navigationController pushViewController:wtDVC animated:YES];
        
    }else if (btn.tag == 101){  //国家
        
        WTContentsDetailVC *wtDVC = [[WTContentsDetailVC alloc] init];
        wtDVC.LabText = @"国家台";
        [self.delegate.navigationController pushViewController:wtDVC animated:YES];
        
    }else{  //省市
        
        WTContentsDetailVC *wtDVC = [[WTContentsDetailVC alloc] init];
        wtDVC.LabText = @"省市台";
        [self.delegate.navigationController pushViewController:wtDVC animated:YES];
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
