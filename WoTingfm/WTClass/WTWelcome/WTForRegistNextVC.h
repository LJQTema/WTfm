//
//  WTForRegistNextVC.h
//  WoTingfm
//
//  Created by jq on 2017/7/4.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTForRegistNextVC : UIViewController

@property(nonatomic, copy) NSString *phoneText; //手机号

@property (nonatomic, copy) NSString *code; //验证码


/**
 type = 0: 注册   !=0 : 忘记密码
 */
@property (nonatomic, assign) NSInteger   Type;

@end
