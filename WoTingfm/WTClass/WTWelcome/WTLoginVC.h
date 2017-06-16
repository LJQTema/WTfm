//
//  WTLoginVC.h
//  WoTingfm
//
//  Created by jq on 2017/6/5.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTLoginVC : UIViewController

- (IBAction)backBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *phoneImageViewName;

@property (weak, nonatomic) IBOutlet UIImageView *passwordImageViewName;

- (IBAction)loginBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *loginBtnName;

- (IBAction)passwordLookUnoBtnClock:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *passwordTextFileName;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextFileName;

- (IBAction)GoForgotPsdClick:(id)sender;


@end
