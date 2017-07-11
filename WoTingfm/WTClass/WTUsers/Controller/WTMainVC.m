//
//  WTMainVC.m
//  WoTingfm
//
//  Created by jq on 2017/7/11.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTMainVC.h"

#import "WTMainHeaderCell.h"
#import "WTMainSecondCell.h"
#import "WTMainHCell.h"
#import "WTMainCell.h"

@interface WTMainVC ()<UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *MainTabView;

@end

@implementation WTMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _MainTabView.delegate = self;
    _MainTabView.dataSource = self;
    _MainTabView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _MainTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _MainTabView.backgroundColor = HYC__COLOR_HEX(0xEFEFEF);
    
    [self reageterMainCell]; //注册
}

- (void)reageterMainCell{
    
    UINib *HeaderCellNib = [UINib nibWithNibName:@"WTMainHeaderCell" bundle:nil];
    [_MainTabView registerNib:HeaderCellNib forCellReuseIdentifier:@"HeaderID"];
    
    UINib *SecondCellNib = [UINib nibWithNibName:@"WTMainSecondCell" bundle:nil];
    [_MainTabView registerNib:SecondCellNib forCellReuseIdentifier:@"SecondID"];
    
    UINib *MainCellNib = [UINib nibWithNibName:@"WTMainCell" bundle:nil];
    [_MainTabView registerNib:MainCellNib forCellReuseIdentifier:@"MainID"];
    
    UINib *MainHCellNib = [UINib nibWithNibName:@"WTMainHCell" bundle:nil];
    [_MainTabView registerNib:MainHCellNib forCellReuseIdentifier:@"MainHID"];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 90;
    }else if (indexPath.row == 1){
        
        return 70;
    }else if (indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 9 ){
        
        return 56;
    }else{
        
        return 50;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        static NSString *cellID = @"HeaderID";
        
        WTMainHeaderCell *cell = (WTMainHeaderCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTMainHeaderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        
        cell.headerImgV.userInteractionEnabled = YES;
        UITapGestureRecognizer  *tapImgV = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerImgVClick)];
        [cell.headerImgV addGestureRecognizer:tapImgV];
        
        
        return cell;
    }else if(indexPath.row == 1){
        
        static NSString *cellID = @"SecondID";
        
        WTMainSecondCell *cell = (WTMainSecondCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTMainSecondCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        
        
        return cell;
        
    }else if(indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 9 ){
        
        static NSString *cellID = @"MainHID";
        
        WTMainHCell *cell = (WTMainHCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTMainHCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        if (indexPath.row == 2) {
            
            cell.ContentImgV.image = [UIImage imageNamed:@"icon_friends_chat.png"];
            cell.ContentLab.text = @"好友聊天";
            
        }else if (indexPath.row == 3){
            
            cell.ContentImgV.image = [UIImage imageNamed:@"icon_mine_subscribe.png"];
            cell.ContentLab.text = @"我的订阅";
            
        }else{
            
            cell.ContentImgV.image = [UIImage imageNamed:@"icon_mine_set.png"];
            cell.ContentLab.text = @"设置";
            
        }
        
        return cell;
        
    }else{
        
        static NSString *cellID = @"MainID";
        
        WTMainCell *cell = (WTMainCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTMainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        if (indexPath.row == 4) {
            
            cell.ContentImgV.image = [UIImage imageNamed:@"icon_mine_downLoad.png"];
            cell.ContentLab.text = @"我的下载";
            
        }else if (indexPath.row == 5){
            
            cell.ContentImgV.image = [UIImage imageNamed:@"icon_mine_like.png"];
            cell.ContentLab.text = @"我的喜欢";
            
        }else if (indexPath.row == 6){
            
            cell.ContentImgV.image = [UIImage imageNamed:@"icon_mine_music.png"];
            cell.ContentLab.text = @"我的听单";
            
        }else if (indexPath.row == 7){
            
            cell.ContentImgV.image = [UIImage imageNamed:@"icon_mine_recent.png"];
            cell.ContentLab.text = @"最近收听";
            
        }else{
            
            cell.ContentImgV.image = [UIImage imageNamed:@"icon_mine_archer.png"];
            cell.ContentLab.text = @"我要当主播";
            
        }
        
        
        return cell;
        
    }
    

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

//点击头像
- (void)headerImgVClick{
    
    
}

//返回
- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

//消息中心
- (IBAction)NewsBtnClick:(id)sender {
}


@end
