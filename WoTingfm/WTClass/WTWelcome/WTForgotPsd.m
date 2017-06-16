//
//  WTForgotPsd.m
//  WoTingfm
//
//  Created by jq on 2017/6/6.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTForgotPsd.h"     //注册or忘记密码

#import "RuntimeKit.h"
#import "UIButton+Timer.h"

@interface WTForgotPsd ()<UITextFieldDelegate>

@end

@implementation WTForgotPsd

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatContentView];    //搭建UI样式
    [self setAnyTextFiled];     //设置各种输入框
    _YanZMBtn.time = @"5";     //60秒计时
    _YanZMBtn.layer.masksToBounds = YES;
    _YanZMBtn.layer.cornerRadius = 15;
    
//    YanZMBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(40, 100, KScreenWidth - 80, 45);
//    button.layer.masksToBounds = YES;
//    button.layer.cornerRadius = 8;
//    
    if (_Type == 0) {   //注册
        
        _ContentLab.text = @"注册";
        [_SureBtn setTitle:@"注册" forState:UIControlStateNormal];
        _PsdNumTF.placeholder = @"请输入密码(6-20位)";
    }else{  //忘记密码
        
        _ContentLab.text = @"找回密码";
        [_SureBtn setTitle:@"确定" forState:UIControlStateNormal];
        _PsdNumTF.placeholder = @"请输入新密码(6-20位)";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setAnyTextFiled{
    
    self.phoneNumTF.delegate = self;
    self.YanZhengMaTF.delegate = self;
    self.PsdNumTF.delegate = self;
    
    self.PsdNumTF.returnKeyType = UIReturnKeyGo;
    self.PsdNumTF.secureTextEntry = YES;    //加密
    
}

- (void)creatContentView{
    
    self.phoneNumImageView.layer.cornerRadius = self.phoneNumImageView.frame.size.height/2.000;
    self.phoneNumImageView.layer.masksToBounds = YES;
    self.phoneNumImageView.layer.borderWidth = 1;
    self.phoneNumImageView.layer.borderColor = HYC__COLOR_HEX(0xEFEFEF).CGColor;
    
    self.yanZhengMaIamgeView.layer.cornerRadius = self.yanZhengMaIamgeView.frame.size.height/2.000;
    self.yanZhengMaIamgeView.layer.masksToBounds = YES;
    self.yanZhengMaIamgeView.layer.borderWidth = 1;
    self.yanZhengMaIamgeView.layer.borderColor = HYC__COLOR_HEX(0xEFEFEF).CGColor;
    
    self.PsdNumImageView.layer.cornerRadius = self.PsdNumImageView.frame.size.height/2.000;
    self.PsdNumImageView.layer.masksToBounds = YES;
    self.PsdNumImageView.layer.borderWidth = 1;
    self.PsdNumImageView.layer.borderColor = HYC__COLOR_HEX(0xEFEFEF).CGColor;
    
    self.SureBtn.layer.cornerRadius = self.SureBtn.frame.size.height/2.000;
    self.SureBtn.layer.masksToBounds = YES;
    self.SureBtn.enabled = NO;
    
}

#pragma mark - TextFiledDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChange:)           name:UITextFieldTextDidChangeNotification object:_phoneNumTF];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChange:)           name:UITextFieldTextDidChangeNotification object:_YanZhengMaTF];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChange:)           name:UITextFieldTextDidChangeNotification object:_PsdNumTF];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:_phoneNumTF];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:_YanZhengMaTF];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:_PsdNumTF];
    
}
- (void)textFieldDidChange:(NSNotification *)note
{
    
    if (_PsdNumTF.text.length >= 6
        &&
        _phoneNumTF.text.length != 0
        &&
        _YanZhengMaTF.text.length == 6
        ) {
        
        _SureBtn.backgroundColor = HYC__COLOR_HEX(0xFD8548);
        _SureBtn.enabled = YES;
        
    }else{
        
        _SureBtn.backgroundColor = HYC__COLOR_HEX(0xCCCCCD);
        _SureBtn.enabled = NO;
        
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField.text.length >= 6) {
        
        [self SureBtnClick:nil];
        return YES;
        
    }else{
        
        return NO;
        
    }
    
}

#pragma mark - 确定按钮点击事件
- (IBAction)SureBtnClick:(id)sender {
    
}

#pragma mark - 获取验证码
- (IBAction)getYanZhengMa:(id)sender {
    
    [_YanZMBtn startTime];
    
}

#pragma mark - 密码的显示与隐藏
- (IBAction)PsdNumChangeClick:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    
    btn.selected ^= YES;
    
    if (btn.selected) {
        
        _PsdNumTF.secureTextEntry = NO;
        
    }else{
        
        _PsdNumTF.secureTextEntry = YES;
        
    }

}

- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
