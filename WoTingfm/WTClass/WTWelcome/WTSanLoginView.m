//
//  WTSanLoginView.m
//  WoTingfm
//
//  Created by jq on 2017/7/4.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTSanLoginView.h"

@implementation WTSanLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self CreateSanLoginUI];
    }
    return self;
}

- (void)CreateSanLoginUI{
    
    __weak WTSanLoginView *WeakSelf = self;
    
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleBtn setTitle:@"其他登录方式" forState:UIControlStateNormal];
    titleBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [titleBtn setTitleColor:HYC__COLOR_HEX(0xB9BABF) forState:UIControlStateNormal];
    [self addSubview:titleBtn];
    [titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(5);
        make.centerX.equalTo(WeakSelf.mas_centerX);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(15);
    }];
    
    //左边的线
    UIImageView *leftView = [[UIImageView alloc] init];
    leftView.backgroundColor = HYC__COLOR_HEX(0xEFEFEF);
    [self addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(11);
        make.right.equalTo(titleBtn.mas_left).with.offset(-5);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(0.5);
    }];
    
    //右边的线
    UIImageView *rightView = [[UIImageView alloc] init];
    rightView.backgroundColor = HYC__COLOR_HEX(0xEFEFEF);
    [self addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(11);
        make.left.equalTo(titleBtn.mas_right).with.offset(5);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(0.5);
    }];
    
    
    //新浪
    UIButton *XinLangBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    XinLangBtn.tag = 101;
    XinLangBtn.layer.cornerRadius = 60/2;
    XinLangBtn.layer.masksToBounds = YES;
    [XinLangBtn setImage:[UIImage imageNamed:@"timg-8"] forState:UIControlStateNormal];
    [XinLangBtn addTarget:self action:@selector(SanLoginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:XinLangBtn];
    [XinLangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(40);
        make.centerX.equalTo(WeakSelf.mas_centerX);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    
    //微信
    UIButton *WeiXinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    WeiXinBtn.tag = 102;
    WeiXinBtn.layer.cornerRadius = 60/2;
    WeiXinBtn.layer.masksToBounds = YES;
    [WeiXinBtn setImage:[UIImage imageNamed:@"timg-9"] forState:UIControlStateNormal];
    [WeiXinBtn addTarget:self action:@selector(SanLoginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:WeiXinBtn];
    [WeiXinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(40);
        make.right.equalTo(XinLangBtn.mas_left).with.offset(-40);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    
    //QQ
    UIButton *QQBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    QQBtn.tag = 103;
    QQBtn.layer.cornerRadius = 60/2;
    QQBtn.layer.masksToBounds = YES;
    [QQBtn setImage:[UIImage imageNamed:@"timg-10"] forState:UIControlStateNormal];
    [QQBtn addTarget:self action:@selector(SanLoginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:QQBtn];
    [QQBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(40);
        make.left.equalTo(XinLangBtn.mas_right).with.offset(40);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    
}

- (void)SanLoginBtnClick:(UIButton *)btn{
    
    if (btn.tag == 101) {   //新浪
        
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_Sina currentViewController:nil completion:^(id result, NSError *error) {
            if (error) {
                
            } else {
                UMSocialUserInfoResponse *resp = result;
                
                // 授权信息
                NSLog(@"Sina uid: %@", resp.uid);
                NSLog(@"Sina accessToken: %@", resp.accessToken);
                NSLog(@"Sina refreshToken: %@", resp.refreshToken);
                NSLog(@"Sina expiration: %@", resp.expiration);
                
                // 用户信息
                NSLog(@"Sina name: %@", resp.name);
                NSLog(@"Sina iconurl: %@", resp.iconurl);
                NSLog(@"Sina gender: %@", resp.gender);
                
                // 第三方平台SDK源数据
                NSLog(@"Sina originalResponse: %@", resp.originalResponse);
                
                //三方登录回调后台注册
             //   [self SanFangLoginWith:@"微博" andID:resp.uid andName:resp.name andImgName:resp.iconurl andResult:result];
            }
        }];
        
    }else if (btn.tag == 102){  //微信
        
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error) {
            if (error) {
                
            } else {
                UMSocialUserInfoResponse *resp = result;
                
                // 授权信息
                NSLog(@"Wechat uid: %@", resp.uid);
                NSLog(@"Wechat openid: %@", resp.openid);
                NSLog(@"Wechat accessToken: %@", resp.accessToken);
                NSLog(@"Wechat refreshToken: %@", resp.refreshToken);
                NSLog(@"Wechat expiration: %@", resp.expiration);
                
                // 用户信息
                NSLog(@"Wechat name: %@", resp.name);
                NSLog(@"Wechat iconurl: %@", resp.iconurl);
                NSLog(@"Wechat gender: %@", resp.gender);
                
                // 第三方平台SDK源数据
                NSLog(@"Wechat originalResponse: %@", resp.originalResponse);
                
                //三方登录回调后台注册
                //   [self SanFangLoginWith:@"微信" andID:resp.uid andName:resp.name andImgName:resp.iconurl andResult:result];
            }
        }];
        
    }else{  //QQ
        
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
            if (error) {
                
            } else {
                UMSocialUserInfoResponse *resp = result;
                
                // 授权信息
                NSLog(@"QQ uid: %@", resp.uid);
                NSLog(@"QQ openid: %@", resp.openid);
                NSLog(@"QQ accessToken: %@", resp.accessToken);
                NSLog(@"QQ expiration: %@", resp.expiration);
                
                // 用户信息
                NSLog(@"QQ name: %@", resp.name);
                NSLog(@"QQ iconurl: %@", resp.iconurl);
                NSLog(@"QQ gender: %@", resp.gender);
                
                // 第三方平台SDK源数据
                NSLog(@"QQ originalResponse: %@", resp.originalResponse);
                
                //三方登录回调后台注册
            //    [self SanFangLoginWith:@"QQ" andID:resp.uid andName:resp.name andImgName:resp.iconurl andResult:result];
            }
        }];
        
    }
    
}

@end
