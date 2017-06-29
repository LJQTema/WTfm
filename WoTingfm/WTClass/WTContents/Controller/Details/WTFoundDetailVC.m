//
//  WTFoundDetailVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/9.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTFoundDetailVC.h"

@interface WTFoundDetailVC ()

@property (weak, nonatomic) IBOutlet UITableView *FoundDetailTabV;

@property (weak, nonatomic) IBOutlet UILabel *ContentLab;

@end

@implementation WTFoundDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_DetailType == 0) {
        
        _ContentLab.text = @"每日听单";
    }else if (_DetailType == 1) {
        
        _ContentLab.text = @"编辑精选";
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
