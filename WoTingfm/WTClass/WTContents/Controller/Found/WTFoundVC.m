//
//  WTFoundVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/8.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTFoundVC.h"

#import "WTFoundCellView.h" //headerView样式

#import "WTFoundContentCell.h"  //contentCell样式
#import "WTFoundListCell.h"     //list样式

@interface WTFoundVC ()<UITableViewDelegate, UITableViewDataSource>{
    
    NSMutableArray  *dataFoundListArr;
}

@property (weak, nonatomic) IBOutlet UITableView *FoundTableView;

@end

@implementation WTFoundVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    dataFoundListArr = [NSMutableArray arrayWithCapacity:0];
    [dataFoundListArr addObject:@"1"];
    [dataFoundListArr addObject:@"1"];
    
    _FoundTableView.dataSource = self;
    _FoundTableView.delegate = self;
    _FoundTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _FoundTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self registerCell];
}

-(void)registerCell
{
    
    UINib *ContentNib = [UINib nibWithNibName:@"WTFoundContentCell" bundle:nil];
    [_FoundTableView registerNib:ContentNib forCellReuseIdentifier:@"CellContentID"];
    
    UINib *ListNib = [UINib nibWithNibName:@"WTFoundListCell" bundle:nil];
    [_FoundTableView registerNib:ListNib forCellReuseIdentifier:@"CellListID"];
    
}

#pragma mark - TableViewDelegate and DataSource

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WTFoundCellView *FoundHeaderView = [[WTFoundCellView alloc] initWithFrame:CGRectMake(0, 0, K_Screen_Width, 45)];
    FoundHeaderView.ContentLab.text = @"一路向北";
    FoundHeaderView.delegate = self;
    return FoundHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.0000000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 || indexPath.section == 1) {
        
        return 158 + ((K_Screen_Width - 12 * 2 - 10 * 2 )/3.000 - 92);
    }else if(indexPath.section == 2){
        
        return 84;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0 || section == 1) {
        
        return 1;
    }else if(section == 2){
        
        return dataFoundListArr.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 || indexPath.section == 1) {
        
        static NSString *cellID = @"CellContentID";
        
        WTFoundContentCell *cell = (WTFoundContentCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTFoundContentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
//        NSDictionary *dict = dataTuiJArray[indexPath.row];
//        [cell setCellWithDict:dict];
        
        
        return cell;
    }else if(indexPath.section == 2){
        
        static NSString *cellID = @"CellListID";
        
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

    return 0;
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
