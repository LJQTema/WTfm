//
//  WTReadyVC.h
//  WoTingfm
//
//  Created by jq on 2017/6/5.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MyBlock)(void);
@interface WTReadyVC : UIViewController

- (instancetype)initWithBooL:(BOOL)zhuangtai;



- (IBAction)BackBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *backBtnName;

@property (weak, nonatomic) IBOutlet UIButton *ContenetBtnName;
- (IBAction)ContenetBtnClick:(id)sender;


@property (weak, nonatomic) IBOutlet UIView *NavView;
@property (nonatomic,strong)UIButton    *LogoBtn;  //logo
@property (nonatomic,strong)UIButton    *LoginBtn;  //登录Btn
@property (nonatomic,strong)UIButton    *ReigstBtn; //注册Btn





@end
