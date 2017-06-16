//
//  WTRadioVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/8.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTRadioVC.h"

#import "WTFoundCellView.h" //headerView样式

#import "WTFoundListCell.h" //cell

@interface WTRadioVC ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation WTRadioVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _RadioTableV.delegate = self;
    _RadioTableV.dataSource = self;
    _RadioTableV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _RadioTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self registerRadioContentCell];
}

- (void)registerRadioContentCell{
    
    UINib *ListNib = [UINib nibWithNibName:@"WTFoundListCell" bundle:nil];
    [_RadioTableV registerNib:ListNib forCellReuseIdentifier:@"CellRadioID"];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WTFoundCellView *FoundHeaderView = [[WTFoundCellView alloc] initWithFrame:CGRectMake(0, 0, K_Screen_Width, 45)];
    FoundHeaderView.TuBiaoImgV.hidden = YES;
    FoundHeaderView.ContentLab.text = @"热门电台";
    FoundHeaderView.delegate = self;
    return FoundHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 0;
        
    }else{
    
        return 45;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.0000000001;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 84;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *cellID = @"CellRadioID";
    
    WTFoundListCell *cell = (WTFoundListCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        
        cell = [[WTFoundListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //
    //        NSDictionary *dict = dataTuiJArray[indexPath.row];
    //        [cell setCellWithDict:dict];
    //
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
