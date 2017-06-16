//
//  WTContentsDetailVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/15.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTContentsDetailVC.h"

#import "WTFoundListCell.h" //cell

@interface WTContentsDetailVC ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation WTContentsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _ContentLab.text = _LabText;
    
    _ContentTableV.delegate = self;
    _ContentTableV.dataSource = self;
    _ContentTableV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _ContentTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self registerContentCell];
}

- (void)registerContentCell{
    
    UINib *ListNib = [UINib nibWithNibName:@"WTFoundListCell" bundle:nil];
    [_ContentTableV registerNib:ListNib forCellReuseIdentifier:@"CellID"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    return 84;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *cellID = @"CellID";
    
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

- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
