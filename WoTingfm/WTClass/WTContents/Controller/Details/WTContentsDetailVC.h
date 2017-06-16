//
//  WTContentsDetailVC.h
//  WoTingfm
//
//  Created by jq on 2017/6/15.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTContentsDetailVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *ContentLab;
- (IBAction)backBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *ContentTableV;


@property (nonatomic, copy) NSString *LabText;

@end
