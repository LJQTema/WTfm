//
//  WTGuidanceViewController.h
//  WOTING
//
//  Created by jq on 2017/3/28.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GuidanceViewDelegate <NSObject>

- (void)changeRootViewController;   //更改根控制器(跳过按钮)
- (void)changeLoginController;      //登录
- (void)chageRegisterController;    //注册

@end
@interface WTGuidanceViewController : UIViewController

@property (nonatomic,weak)id<GuidanceViewDelegate>delegate;

@end
