//
//  WTRegisterViewController.m
//  WOTING
//
//  Created by jq on 2016/11/26.
//  Copyright © 2016年 jq. All rights reserved.
//

#import "WTRegisterViewController.h"

@interface WTRegisterViewController ()

@property (nonatomic,assign)NSInteger number;
//label上显示的数字
@property (nonatomic,strong)NSTimer *timer;
//定时器属性

@property (nonatomic,assign)NSInteger FirstYZM; //是否是第一次获取验证码 0 是 1 不是

@end

@implementation WTRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _FirstYZM = 0;

    _RegisterView.layer.cornerRadius = 5;
    _RegisterView.layer.masksToBounds = YES;
    
    _QueDBtn.layer.cornerRadius = 5;
    _QueDBtn.layer.masksToBounds = YES;
    _QueDBtn.backgroundColor = [UIColor lightGrayColor];
    
    _YanZView.layer.cornerRadius = 5;
    _YanZView.layer.masksToBounds = YES;
    
    _YanZMBtn.layer.cornerRadius = 5;
    _YanZMBtn.layer.masksToBounds = YES;
    
    
    
    [_YanZMTF addTarget:self action:@selector(changeNum:) forControlEvents:UIControlEventEditingChanged];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [_phoneTF resignFirstResponder];
    [_userNameTF resignFirstResponder];
    [_psdTF resignFirstResponder];
    [_YanZMTF resignFirstResponder];
    
    
}

- (void)changeNum:(UITextField *)tf {
    
    if (tf.text.length == 6) {  //输入6位验证码后 确定按钮可点击
        
        _QueDBtn.selected = YES;
        _QueDBtn.backgroundColor = [UIColor JQTColor];
    }else {
        
        _QueDBtn.selected = NO;
        _QueDBtn.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createTime {
    
    NSDictionary *userInfo = @{@"key":@"value"};
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(runTime:) userInfo:userInfo repeats:YES];
}

- (void)runTime:(NSTimer *)time {
    
    _number--;
    
    [_YanZMBtn setTitle:[NSString stringWithFormat:@"%lu",_number] forState:UIControlStateNormal];
    
    if (_number == -1) {
        
        [_YanZMBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        
        _YanZMBtn.selected = NO;
        
        [_timer setFireDate:[NSDate distantFuture]];
        
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)blackBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

//确认按钮
- (IBAction)QueDBtnClick:(id)sender {
    
    if (_QueDBtn.selected == YES) {
        [self YanZhengMa];  //验证验证码

//        NSString *IMEI = [AutomatePlist readPlistForKey:@"IMEI"];
//        NSString *ScreenSize = [AutomatePlist readPlistForKey:@"ScreenSize"];
//        NSString *MobileClass = [AutomatePlist readPlistForKey:@"MobileClass"];
//        NSString *GPS_longitude = [AutomatePlist readPlistForKey:@"GPS-longitude"];
//        NSString *GPS_latitude = [AutomatePlist readPlistForKey:@"GPS-latitude"];
//        
//        NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:IMEI,@"IMEI", ScreenSize,@"ScreenSize",@"1",@"PCDType", MobileClass, @"MobileClass",GPS_longitude,@"GPS-longitude", GPS_latitude,@"GPS-latitude", _phoneTF.text, @"PhoneNum", nil];
//        
//        NSString *login_Str = WoTing_phone;
//        
//        
//        [ZCBNetworking postWithUrl:login_Str refreshCache:YES params:parameters success:^(id response) {
//            
//            
//            NSDictionary *resultDict = (NSDictionary *)response;
//            
//            NSString  *ReturnType = [resultDict objectForKey:@"ReturnType"];
//            if ([ReturnType isEqualToString:@"1001"]) {
//                
//                [self YanZhengMa];  //验证验证码
//                
//            }else if ([ReturnType isEqualToString:@"1002"]){
//                
//                [WKProgressHUD popMessage:@"手机已绑定" inView:nil duration:0.5 animated:YES];
//            }else if ([ReturnType isEqualToString:@"1000"]){
//                
//                [WKProgressHUD popMessage:@"无法获取手机号" inView:nil duration:0.5 animated:YES];
//            }
//            
//        } fail:^(NSError *error) {
//            
//            
//            NSLog(@"%@", error);
//            
//        }];
//
    }
}

//获取验证码按钮
- (IBAction)YanZBtnClick:(id)sender {
    
    if (_phoneTF.text.length == 11) {   //输入11位手机号后， 可以获取验证码
        
        if (![_userNameTF.text isEqualToString:@""]) {
            
            if (![_psdTF.text isEqualToString:@""]) {

                if (_YanZMBtn.selected == NO) {
                    
                    
                    if (_FirstYZM == 0) {
                    
                        [_phoneTF resignFirstResponder];
                        [_userNameTF resignFirstResponder];
                        [_psdTF resignFirstResponder];
                        
                       [self GetVerificationCode:WoTing_phone];    //获取验证码
                    }else {
                        
                        [self GetVerificationCode:WoTing_yanZM];    //再次获取验证码
                    }
                
          
                }else{
                    
                    [WKProgressHUD popMessage:@"两次获取时间间隔最少60秒" inView:nil duration:0.5 animated:YES];
                    
                }
            }else{
                
                [WKProgressHUD popMessage:@"请输入密码" inView:nil duration:0.5 animated:YES];
            }
        }else {
            
            [WKProgressHUD popMessage:@"请输入昵称" inView:nil duration:0.5 animated:YES];
        }
    }else {
        
        [WKProgressHUD popMessage:@"请输入正确手机号" inView:nil duration:0.5 animated:YES];
        
    }

    
}

//获取验证码请求
- (void)GetVerificationCode:(NSString *)LoginStr {
    
    NSString *IMEI = [AutomatePlist readPlistForKey:@"IMEI"];
    NSString *ScreenSize = [AutomatePlist readPlistForKey:@"ScreenSize"];
    NSString *MobileClass = [AutomatePlist readPlistForKey:@"MobileClass"];
    NSString *GPS_longitude = [AutomatePlist readPlistForKey:@"GPS-longitude"];
    NSString *GPS_latitude = [AutomatePlist readPlistForKey:@"GPS-latitude"];
    
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:IMEI,@"IMEI", ScreenSize,@"ScreenSize",@"1",@"PCDType", MobileClass, @"MobileClass",GPS_longitude,@"GPS-longitude", GPS_latitude,@"GPS-latitude", @"1", @"OperType", _phoneTF.text, @"PhoneNum", nil];
    
    NSString *login_Str = LoginStr;
    
    
    [ZCBNetworking postWithUrl:login_Str refreshCache:YES params:parameters success:^(id response) {
        
        
        NSDictionary *resultDict = (NSDictionary *)response;
        
        NSString  *ReturnType = [resultDict objectForKey:@"ReturnType"];
        if ([ReturnType isEqualToString:@"1001"]) {
            
            [WKProgressHUD popMessage:@"验证码发送成功" inView:nil duration:0.5 animated:YES];
            _FirstYZM = 1;
            _YanZMBtn.selected = YES;
            _number = 60;
            [_YanZMBtn setTitle:@"60" forState:UIControlStateNormal];
            
            [self createTime];  //设置时间器
            
        }else if ([ReturnType isEqualToString:@"1002"]){
            
            [WKProgressHUD popMessage:@"状态错误，无法获取" inView:nil duration:0.5 animated:YES];
            
        }else if ([ReturnType isEqualToString:@"T"]){
            
            [WKProgressHUD popMessage:@"服务器异常" inView:nil duration:0.5 animated:YES];
            
        }
        
    } fail:^(NSError *error) {
        
        
        NSLog(@"%@", error);
        
    }];
    
}


//验证验证码
- (void)YanZhengMa{
    
    NSString *IMEI = [AutomatePlist readPlistForKey:@"IMEI"];
    NSString *ScreenSize = [AutomatePlist readPlistForKey:@"ScreenSize"];
    NSString *MobileClass = [AutomatePlist readPlistForKey:@"MobileClass"];
    NSString *GPS_longitude = [AutomatePlist readPlistForKey:@"GPS-longitude"];
    NSString *GPS_latitude = [AutomatePlist readPlistForKey:@"GPS-latitude"];
    
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:IMEI,@"IMEI", ScreenSize,@"ScreenSize",@"1",@"PCDType", MobileClass, @"MobileClass",GPS_longitude,@"GPS-longitude", GPS_latitude,@"GPS-latitude", _YanZMTF.text, @"CheckCode", _phoneTF.text, @"PhoneNum", nil];
    
    NSString *login_Str = WoTing_YanZhengbangDing;
    
    
    [ZCBNetworking postWithUrl:login_Str refreshCache:YES params:parameters success:^(id response) {
        
        
        NSDictionary *resultDict = (NSDictionary *)response;
        
        NSString  *ReturnType = [resultDict objectForKey:@"ReturnType"];
        if ([ReturnType isEqualToString:@"1001"]) {
            
            
            [self UserRegister:WoTing_register];    //用户注册
            
        }else if ([ReturnType isEqualToString:@"T"]){
            
            [WKProgressHUD popMessage:@"服务器异常" inView:nil duration:0.5 animated:YES];
            
        }else if ([ReturnType isEqualToString:@"1002"]) {
            
            [WKProgressHUD popMessage:@"验证码不匹配" inView:nil duration:0.5 animated:YES];
        }else if ([ReturnType isEqualToString:@"1004"]) {
            
            [WKProgressHUD popMessage:@"验证码已超时" inView:nil duration:0.5 animated:YES];
        }
        
        
    } fail:^(NSError *error) {
        
        
        NSLog(@"%@", error);
        
    }];
    
}

//用户注册
- (void)UserRegister:(NSString *)LoginStr {
    
    NSString *IMEI = [AutomatePlist readPlistForKey:@"IMEI"];
    NSString *ScreenSize = [AutomatePlist readPlistForKey:@"ScreenSize"];
    NSString *MobileClass = [AutomatePlist readPlistForKey:@"MobileClass"];
    NSString *GPS_longitude = [AutomatePlist readPlistForKey:@"GPS-longitude"];
    NSString *GPS_latitude = [AutomatePlist readPlistForKey:@"GPS-latitude"];
    
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:IMEI,@"IMEI", ScreenSize,@"ScreenSize",@"1",@"PCDType", MobileClass, @"MobileClass",GPS_longitude,@"GPS-longitude", GPS_latitude,@"GPS-latitude", @"1", @"UsePhone", _phoneTF.text, @"MainPhoneNum",_userNameTF.text,@"NickName",_psdTF.text,@"Password", nil];
    
    NSString *login_Str = LoginStr;
    
    
    [ZCBNetworking postWithUrl:login_Str refreshCache:YES params:parameters success:^(id response) {
        
        
        NSDictionary *resultDict = (NSDictionary *)response;
        
        NSString  *ReturnType = [resultDict objectForKey:@"ReturnType"];
        if ([ReturnType isEqualToString:@"1001"]) {
            
            [WKProgressHUD popMessage:@"注册成功" inView:nil duration:0.5 animated:YES];
            
            NSDictionary *UserId = resultDict[@"UserInfo"];
            NSDictionary *heheDict = [[NSDictionary alloc] initWithDictionary:UserId];
            
            [AutomatePlist writePlistForkey:@"LoginDict" valueDict:heheDict];
            [AutomatePlist writePlistForkey:@"Uid" value:heheDict[@"UserId"]];
            [AutomatePlist writePlistForkey:@"Region" value:heheDict[@"Region"]];
            [AutomatePlist writePlistForkey:@"NickName" value:heheDict[@"NickName"]];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginChangeNotification" object:nil userInfo:heheDict];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else if ([ReturnType isEqualToString:@"T"]){
            
            [WKProgressHUD popMessage:@"服务器异常" inView:nil duration:0.5 animated:YES];
            
        }
        
    } fail:^(NSError *error) {
        
        
        NSLog(@"%@", error);
        
    }];
    
    
}

@end
