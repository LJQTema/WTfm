//
//  WTNewsVC.m
//  WoTingfm
//
//  Created by jq on 2017/7/13.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTNewsVC.h"

#import "WTNewsCell.h"

@interface WTNewsVC ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *NewsTableV;

@end

@implementation WTNewsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _NewsTableV.delegate = self;
    _NewsTableV.dataSource = self;
    _NewsTableV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    _NewsTableV.backgroundColor = HYC__COLOR_HEX(0xEFEFEF);
    
    [self reageterNewsCell]; //注册
}

- (void)reageterNewsCell{
    
    UINib *NewCellNib = [UINib nibWithNibName:@"WTNewsCell" bundle:nil];
    [_NewsTableV registerNib:NewCellNib forCellReuseIdentifier:@"NewsID"];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        static NSString *cellID = @"HeaderID";
        
        WTNewsCell *cell = (WTNewsCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTNewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        
        
        return cell;
    }
    
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
