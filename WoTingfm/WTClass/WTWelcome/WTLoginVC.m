//
//  WTLoginVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/5.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTLoginVC.h"

#import "WTForgotPsd.h"     //忘记密码

@interface WTLoginVC ()<UITextFieldDelegate>

@end

@implementation WTLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationController.navigationBar.hidden = YES;
    
    //---->--->-->->伦理分割线----<---<--<-<//
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.phoneTextFileName.delegate = self;
    self.passwordTextFileName.delegate = self;
    
    
    
    
    //---->--->-->->伦理分割线----<---<--<-<//
    [self yuanhukuangzi];
    [self loding];
    
    
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

#define 初始化设置
- (void)loding{
    
    //密码File 的return样式改变
    _passwordTextFileName.returnKeyType = UIReturnKeyGo;
    
    //登陆按钮不可点击(初始)
    self.loginBtnName.userInteractionEnabled = NO;
    
    //密码框加密
    _passwordTextFileName.secureTextEntry = YES;
    
    //登陆按钮的初始填充
    _loginBtnName.backgroundColor = HYC__COLOR_HEX(0xCCCCCD);
    
    //字体颜色
    [_loginBtnName setTitleColor:[UIColor whiteColor] forState:0];
    
}


#define textFileDele
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChange:)           name:UITextFieldTextDidChangeNotification object:_passwordTextFileName];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChange:)           name:UITextFieldTextDidChangeNotification object:_phoneTextFileName];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:_passwordTextFileName];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:_phoneTextFileName];
    
}
- (void)textFieldDidChange:(NSNotification *)note
{
    
    //可以用note.object来获取产生该消息的UITextFie
    if ([note.object isEqual:_passwordTextFileName]) {
        
        // NSLog(@"%@",[note userInfo]);
        
    }
    NSLog(@"%@",_passwordTextFileName.text);
    
    if (_passwordTextFileName.text.length >= 6  
        &&
        _phoneTextFileName.text.length != 0
        ) {
        
        _loginBtnName.backgroundColor = [UIColor orangeColor];
        _loginBtnName.userInteractionEnabled = YES;
        
    }else{
        
        _loginBtnName.backgroundColor = HYC__COLOR_HEX(0xCCCCCD);
        _loginBtnName.userInteractionEnabled = NO;
        
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField.text.length >= 6) {
        
        [self loginBtnClick:nil];
        return YES;
        
    }else{
        
        return NO;
        
    }
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string  
{  
    NSInteger lengthIntger;
    
    if ([textField isEqual:self.phoneTextFileName]) {
        
        lengthIntger = 11;
        
    }else{
        
        lengthIntger = 20;
        
    }
    //敲删除键  
    if ([string length]==0) {  
        return YES;  
    }  
    //当输入框当前的字符个数大于18的时候，就不让更改了（不能等于18，因为如果等于18，在输入框字符个数等于18的情况下就不能进行粘贴替换内容了）  
    if ([textField.text length]>lengthIntger)  
        return NO;  
    //获得当前输入框内的字符串  
    NSMutableString *fieldText=[NSMutableString stringWithString:textField.text];  
    //完成输入动作，包括输入字符，粘贴替换字符  
    [fieldText replaceCharactersInRange:range withString:string];  
    NSString *finalText=[fieldText copy];  
    //如果字符个数大于18就要进行截取前边18个字符  
    if ([finalText length]>lengthIntger) {  
        textField.text=[finalText substringToIndex:lengthIntger];  
        return NO;  
    }  
    return YES;  
} 





#define 圆弧框子
- (void)yuanhukuangzi{
    
    self.phoneImageViewName.layer.cornerRadius = self.phoneImageViewName.frame.size.height/2.000;
    self.phoneImageViewName.layer.masksToBounds = YES;
    self.phoneImageViewName.layer.borderWidth = 1;
    self.phoneImageViewName.layer.borderColor = HYC__COLOR_HEX(0xEFEFEF).CGColor;
    
    self.passwordImageViewName.layer.cornerRadius = self.passwordImageViewName.frame.size.height/2.000;
    self.passwordImageViewName.layer.masksToBounds = YES;
    self.passwordImageViewName.layer.borderWidth = 1;
    self.passwordImageViewName.layer.borderColor = HYC__COLOR_HEX(0xEFEFEF).CGColor;
    
    self.loginBtnName.layer.cornerRadius = self.loginBtnName.frame.size.height/2.000;
    self.loginBtnName.layer.masksToBounds = YES;
    
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [self.phoneTextFileName endEditing:YES];
    [self.passwordTextFileName endEditing:YES];
    
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

- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

//登录请求
- (IBAction)loginBtnClick:(id)sender {
    
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:_phoneTextFileName.text,@"phone", _passwordTextFileName.text,@"password",  nil];
    
    NSString *login_Str = WoTing_Login;
    
    [ZCBNetworking postWithUrl:login_Str refreshCache:YES params:parameters success:^(id response) {
        
        NSDictionary *resultDict = (NSDictionary *)response;
        
        NSInteger  ReturnType = [[resultDict objectForKey:@"ret"] integerValue];
        if (ReturnType == 0) {
            
            //登录成功后, 切换控制器
            [[NSNotificationCenter defaultCenter]postNotificationName:@"tabbar" object:nil];
        }else{
            
            [WKProgressHUD popMessage:@"账号或密码错误" inView:nil duration:0.5 animated:YES];
        }
        
    } fail:^(NSError *error) {
        
        NSLog(@"%@", error);
        
    }];
    

    
}

#pragma mark - 显示与隐藏密码
- (IBAction)passwordLookUnoBtnClock:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    
    btn.selected ^= YES;
    
    if (btn.selected) {
        
        _passwordTextFileName.secureTextEntry = NO;
        
    }else{
        
        _passwordTextFileName.secureTextEntry = YES;
    
    }
    
}

#pragma mark - 去忘记密码页
- (IBAction)GoForgotPsdClick:(id)sender {
    
    WTForgotPsd *forgorVC = [[WTForgotPsd alloc] init];
    forgorVC.Type = 1;
    [self.navigationController pushViewController:forgorVC animated:YES];
}
@end
