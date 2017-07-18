//
//  BoFangListView.m
//  WoTingfm
//
//  Created by jq on 2017/7/17.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "BoFangListView.h"

#import "BoFangListCell.h"

@interface BoFangListView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *BoFangListTab;

@property (nonatomic, strong) UILabel *ContentLab;  //播放列表

@property (nonatomic, strong) NSMutableArray    *dataBoFangListArr;

@end

@implementation BoFangListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self  createrBoFangListUI];
    }
    return self;
}

- (void)createrBoFangListUI{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_Screen_Width, 50)];
    headerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:headerView];
    UIView *baView = [[UIView alloc] initWithFrame:CGRectMake(0, 49, K_Screen_Width, 1)];
    baView.backgroundColor = HYC__COLOR_HEX(0xEFEFEF);
    [headerView addSubview:baView];
    
    UIImageView *listImgV = [[UIImageView alloc] initWithFrame:CGRectMake(2, 3, 44, 44)];
    listImgV.image = [UIImage imageNamed:@"Music-play_icon_list_black"];
    [headerView addSubview:listImgV];
    
    _ContentLab = [[UILabel alloc] init];
    _ContentLab.text = @"播放列表";
    _ContentLab.font = [UIFont systemFontOfSize:15];
    _ContentLab.textColor = HYC__COLOR_HEX(0x16181A);
    [headerView addSubview:_ContentLab];
    [_ContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(listImgV.mas_right);
        make.top.mas_equalTo(17);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(16);
    }];
    
    UIButton *DownBtn = [[UIButton alloc] init];
    [DownBtn setImage:[UIImage imageNamed:@"Music-BoFang_Down"] forState:UIControlStateNormal];
    [headerView addSubview:DownBtn];
    [DownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_equalTo(-2);
        make.top.mas_equalTo(3);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(44);
    }];
    
    UIButton *BoFangPaiXuBtn = [[UIButton alloc] init];
    [BoFangPaiXuBtn setImage:[UIImage imageNamed:@"Music-BoFang_PaiXu_n"] forState:UIControlStateNormal];
    [BoFangPaiXuBtn setImage:[UIImage imageNamed:@"Music-BoFang_PaiXu_s"] forState:UIControlStateSelected];
    [BoFangPaiXuBtn addTarget:self action:@selector(BoFangPaiXuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:BoFangPaiXuBtn];
    [BoFangPaiXuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(DownBtn.mas_left).with.offset(-10);
        make.top.mas_equalTo(3);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(44);
    }];
    
    //-----------------------------------------LJQ-------TableView---------------------------------------//
    
    _BoFangListTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, K_Screen_Width, 400) style:UITableViewStylePlain];
    _BoFangListTab.delegate = self;
    _BoFangListTab.dataSource = self;
    [self addSubview:_BoFangListTab];
    
    [self regsterListCell];
    
    //----------------------------------------esc-------------------------------------------------------//
    UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(0, 450, K_Screen_Width, 1)];
    barView.backgroundColor = HYC__COLOR_HEX(0xEFEFEF);
    [self addSubview:barView];
    UIButton   *escBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 450, K_Screen_Width, 49)];
    [escBtn setTitle:@"取消" forState:UIControlStateNormal];
    [escBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [escBtn addTarget:self action:@selector(ESCBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:escBtn];
}

- (void)regsterListCell{
    
    
    UINib *ContentNib = [UINib nibWithNibName:@"BoFangListCell" bundle:nil];
    [_BoFangListTab registerNib:ContentNib forCellReuseIdentifier:@"CellBoFangListID"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 62;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataBoFangListArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        
    static NSString *cellID = @"CellBoFangListID";
    
    BoFangListCell *cell = (BoFangListCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[BoFangListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

    
    
    
    return cell;

}


- (void)BoFangPaiXuBtnClick:(UIButton *)btn{
    
    btn.selected ^= 1;
    
}

- (void)ESCBtnClick:(UIButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(WTBoFangListViewESCClick)]) {
        
        [self.delegate WTBoFangListViewESCClick];
    }
    
}







@end
