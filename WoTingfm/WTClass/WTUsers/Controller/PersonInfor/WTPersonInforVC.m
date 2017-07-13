//
//  WTPersonInforVC.m
//  WoTingfm
//
//  Created by jq on 2017/7/11.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTPersonInforVC.h"

#import "WTPersonHeaderCell.h"
#import "WTPersonSignCell.h"
#import "WTPersonCell.h"

@interface WTPersonInforVC ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *PerSonTabV;

@end

@implementation WTPersonInforVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _PerSonTabV.delegate = self;
    _PerSonTabV.dataSource = self;
    _PerSonTabV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _PerSonTabV.separatorStyle = UITableViewCellSeparatorStyleNone;
    _PerSonTabV.backgroundColor = HYC__COLOR_HEX(0xEFEFEF);
    
    [self reageterPresonCell]; //注册
}

- (void)reageterPresonCell{
    
    UINib *PHeaderCellNib = [UINib nibWithNibName:@"WTPersonHeaderCell" bundle:nil];
    [_PerSonTabV registerNib:PHeaderCellNib forCellReuseIdentifier:@"PHeaderID"];
    
    UINib *PersonCellNib = [UINib nibWithNibName:@"WTPersonCell" bundle:nil];
    [_PerSonTabV registerNib:PersonCellNib forCellReuseIdentifier:@"PersonID"];
    
    UINib *PersonSignCellNib = [UINib nibWithNibName:@"WTPersonSignCell" bundle:nil];
    [_PerSonTabV registerNib:PersonSignCellNib forCellReuseIdentifier:@"PersonSignID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 96;
    }else if (indexPath.row == 6){
        
        return 74;
    }else{
        
        return 50;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        static NSString *cellID = @"PHeaderID";
        
        WTPersonHeaderCell *cell = (WTPersonHeaderCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTPersonHeaderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }

        
        
        return cell;
    }else if (indexPath.row == 6){
        
        static NSString *cellID = @"PersonID";
        
        WTPersonCell *cell = (WTPersonCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTPersonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        
        
        return cell;
    }else{
        
        static NSString *cellID = @"PersonSignID";
        
        WTPersonSignCell *cell = (WTPersonSignCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTPersonSignCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        if (indexPath.row == 1) {
            
            cell.contentLab.text = @"昵称";
            
        }else if (indexPath.row == 2){
            
            cell.contentLab.text = @"听号";
            
        }else if (indexPath.row == 3){
            
            cell.contentLab.text = @"性别";
            
        }else if (indexPath.row == 4){
            
            cell.contentLab.text = @"年龄";
            
        }else{
            
            cell.contentLab.text = @"地区";
            
        }
        
        
        return cell;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
