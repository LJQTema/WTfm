//
//  WTLoginViewController.h
//  WOTING
//
//  Created by jq on 2016/11/24.
//  Copyright © 2016年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTBaseViewController.h"

@interface WTLoginViewController : WTBaseViewController

@property (weak, nonatomic) IBOutlet UITextField *NameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *PWDTextfield;
@property (weak, nonatomic) IBOutlet UIView *LoginView;
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;

@property (weak, nonatomic) IBOutlet UILabel *ForgetPsdLab;

//三方登录按钮

@property (weak, nonatomic) IBOutlet UIButton *WeChetBtn;
@property (weak, nonatomic) IBOutlet UIButton *QQBtn;
@property (weak, nonatomic) IBOutlet UIButton *WeiBoBtn;



- (IBAction)blackBtnClick:(id)sender;

- (IBAction)RegistBtnClick:(id)sender;

- (IBAction)LoginBtnClick:(id)sender;

//三方登录按钮点击事件
- (IBAction)WeiChatBtnClick:(id)sender;
- (IBAction)QQBtnClick:(id)sender;
- (IBAction)WeiBoBtnClick:(id)sender;



@end
