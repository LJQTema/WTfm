//
//  WTLoginViewController.m
//  WOTING
//
//  Created by jq on 2016/11/24.
//  Copyright © 2016年 jq. All rights reserved.
//

#import "WTLoginViewController.h"

#import "WTForgetPsdController.h"   //忘记密码

#import "WTRegisterViewController.h"

@interface WTLoginViewController ()

@end

@implementation WTLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _LoginBtn.layer.cornerRadius = 5;
    _LoginBtn.layer.masksToBounds = YES;
    
    
    _LoginView.layer.cornerRadius = 5;
    _LoginView.layer.masksToBounds = YES;
    
    
    _WeiBoBtn.layer.cornerRadius = _WeiBoBtn.frame.size.height/6;
    _WeiBoBtn.layer.masksToBounds = YES;
    
    
    _QQBtn.layer.cornerRadius = _QQBtn.frame.size.height/6;
    _QQBtn.layer.masksToBounds = YES;
    
    _WeChetBtn.layer.cornerRadius = _WeChetBtn.frame.size.height/6;
    _WeChetBtn.layer.masksToBounds = YES;
    
    _ForgetPsdLab.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapLab = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ForgetPsdLabClick:)];
    [_ForgetPsdLab addGestureRecognizer:tapLab];
}

//忘记密码
- (void)ForgetPsdLabClick:(UITapGestureRecognizer *)tap{
    
    WTForgetPsdController *wtForgetVC = [[WTForgetPsdController alloc] init];
    wtForgetVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:wtForgetVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//返回按钮
- (IBAction)blackBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

//跳转注册
- (IBAction)RegistBtnClick:(id)sender {
    
    WTRegisterViewController *wtRVC = [[WTRegisterViewController alloc] init];
   // wtRVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:wtRVC animated:YES];

}

//此处应该有网络请求
- (IBAction)LoginBtnClick:(id)sender {
    
    NSString *IMEI = [AutomatePlist readPlistForKey:@"IMEI"];
    NSString *ScreenSize = [AutomatePlist readPlistForKey:@"ScreenSize"];
    NSString *MobileClass = [AutomatePlist readPlistForKey:@"MobileClass"];
    NSString *GPS_longitude = [AutomatePlist readPlistForKey:@"GPS-longitude"];
    NSString *GPS_latitude = [AutomatePlist readPlistForKey:@"GPS-latitude"];
    
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:IMEI,@"IMEI", ScreenSize,@"ScreenSize",@"1",@"PCDType", MobileClass, @"MobileClass",GPS_longitude,@"GPS-longitude", GPS_latitude,@"GPS-latitude", _NameTextfield.text, @"UserName", _PWDTextfield.text, @"Password", nil];
    
    NSString *login_Str = WoTing_Login;
    

    [ZCBNetworking postWithUrl:login_Str refreshCache:YES params:parameters success:^(id response) {
        
        
        NSDictionary *resultDict = (NSDictionary *)response;
        
        NSString  *ReturnType = [resultDict objectForKey:@"ReturnType"];
        if ([ReturnType isEqualToString:@"1001"]) {
            
            NSDictionary *UserId = resultDict[@"UserInfo"];
            NSDictionary *heheDict = [[NSDictionary alloc] initWithDictionary:UserId];

            [AutomatePlist writePlistForkey:@"LoginDict" valueDict:heheDict];
            [AutomatePlist writePlistForkey:@"Uid" value:heheDict[@"UserId"]];
            [AutomatePlist writePlistForkey:@"Region" value:heheDict[@"Region"]];
            [AutomatePlist writePlistForkey:@"NickName" value:heheDict[@"NickName"]];
            [AutomatePlist writePlistForkey:@"UserSign" value:@"UserSign"];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginChangeNotification" object:nil userInfo:heheDict];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }else if ([ReturnType isEqualToString:@"1002"]){

            [WKProgressHUD popMessage:@"用户不存在" inView:nil duration:0.5 animated:YES];
            
        }else if ([ReturnType isEqualToString:@"1003"]){

            [WKProgressHUD popMessage:@"密码输入错误" inView:nil duration:0.5 animated:YES];
        }
        
    } fail:^(NSError *error) {
        
        
        NSLog(@"%@", error);
        
    }];
    
}

//三方登录
- (IBAction)WeiChatBtnClick:(id)sender {
    
    [self getAuthWithUserInfoFromWechat];
}

- (IBAction)QQBtnClick:(id)sender {
    
    [self getAuthWithUserInfoFromQQ];
}

- (IBAction)WeiBoBtnClick:(id)sender {
    
    [self getAuthWithUserInfoFromSina];
}

//微信登录
- (void)getAuthWithUserInfoFromWechat
{
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
            [self SanFangLoginWith:@"微信" andID:resp.uid andName:resp.name andImgName:resp.iconurl andResult:result];
        }
    }];
}

//qq登录
- (void)getAuthWithUserInfoFromQQ
{
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
            [self SanFangLoginWith:@"QQ" andID:resp.uid andName:resp.name andImgName:resp.iconurl andResult:result];
        }
    }];
}

//微博登录
- (void)getAuthWithUserInfoFromSina
{
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
            [self SanFangLoginWith:@"微博" andID:resp.uid andName:resp.name andImgName:resp.iconurl andResult:result];
        }
    }];
}

//三方登录回调后台注册
- (void)SanFangLoginWith:(NSString *)ThirdType andID:(NSString *)ThirdUserId andName:(NSString *)ThirdUserName andImgName:(NSString *)ThirdUserImg andResult:(NSData *)result {
    
    NSString *IMEI = [AutomatePlist readPlistForKey:@"IMEI"];
    NSString *ScreenSize = [AutomatePlist readPlistForKey:@"ScreenSize"];
    NSString *MobileClass = [AutomatePlist readPlistForKey:@"MobileClass"];
    NSString *GPS_longitude = [AutomatePlist readPlistForKey:@"GPS-longitude"];
    NSString *GPS_latitude = [AutomatePlist readPlistForKey:@"GPS-latitude"];
    
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:IMEI,@"IMEI", ScreenSize,@"ScreenSize",@"1",@"PCDType", MobileClass, @"MobileClass",GPS_longitude,@"GPS-longitude", GPS_latitude,@"GPS-latitude", ThirdType,@"ThirdType",ThirdUserId,@"ThirdUserId",ThirdUserName,@"ThirdUserName",ThirdUserImg,@"ThirdUserImg", nil];
    
    NSString *login_Str = WoTing_SanLogin;
    
    
    [ZCBNetworking postWithUrl:login_Str refreshCache:YES params:parameters success:^(id response) {
        
        
        NSDictionary *resultDict = (NSDictionary *)response;
        
        NSString  *ReturnType = [resultDict objectForKey:@"ReturnType"];
        if ([ReturnType isEqualToString:@"1001"]) {
            
            NSDictionary *UserId = resultDict[@"UserInfo"];
            NSDictionary *heheDict = [[NSDictionary alloc] initWithDictionary:UserId];
            
            [AutomatePlist writePlistForkey:@"LoginDict" valueDict:heheDict];
            [AutomatePlist writePlistForkey:@"Uid" value:heheDict[@"UserId"]];
            [AutomatePlist writePlistForkey:@"UName" value:heheDict[@"UserName"]];
            [AutomatePlist writePlistForkey:@"Region" value:heheDict[@"Region"]];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginChangeNotification" object:nil userInfo:heheDict];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }else if ([ReturnType isEqualToString:@"1000"]){
            
            [WKProgressHUD popMessage:@"无法获取用户资料" inView:nil duration:0.5 animated:YES];
            
        }else if ([ReturnType isEqualToString:@"1002"]){
            
            [WKProgressHUD popMessage:@"无法获取用户类型" inView:nil duration:0.5 animated:YES];
        }
        
    } fail:^(NSError *error) {
        
        
        NSLog(@"%@", error);
        
    }];
    
    
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
