//
//  WTForRegistNextVC.m
//  WoTingfm
//
//  Created by jq on 2017/7/4.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTForRegistNextVC.h"

@interface WTForRegistNextVC ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *contentLab;

@property (weak, nonatomic) IBOutlet UIImageView *psdImgV;
@property (weak, nonatomic) IBOutlet UITextField *psdTield;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;


@end

@implementation WTForRegistNextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.psdImgV.layer.cornerRadius = self.psdImgV.frame.size.height/2.000;
    self.psdImgV.layer.masksToBounds = YES;
    self.psdImgV.layer.borderWidth = 1;
    self.psdImgV.layer.borderColor = HYC__COLOR_HEX(0xEFEFEF).CGColor;
    
    if (_Type == 0) {
        
        _contentLab.text = @"手机号注册";
        [_sureBtn setTitle:@"提交注册" forState:UIControlStateNormal];
        _psdTield.placeholder = @"请输入密码(6-20位)";
    }else{
        
        _contentLab.text = @"找回密码";
        [_sureBtn setTitle:@"完成" forState:UIControlStateNormal];
        _psdTield.placeholder = @"请输入新密码(6-20位)";
    }
    
    self.psdTield.delegate = self;
    
    self.psdTield.returnKeyType = UIReturnKeyGo;
    self.psdTield.secureTextEntry = YES;    //加密
}

#pragma mark - TextFiledDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChange:)           name:UITextFieldTextDidChangeNotification object:self.psdTield];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:self.psdTield];
    
}
- (void)textFieldDidChange:(NSNotification *)note
{
    
    if (self.psdTield.text.length >= 6) {
        
        _sureBtn.backgroundColor = HYC__COLOR_HEX(0xFD8548);
        _sureBtn.enabled = YES;
        
    }else{
        
        _sureBtn.backgroundColor = HYC__COLOR_HEX(0xCCCCCD);
        _sureBtn.enabled = NO;
        
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField.text.length >= 6) {
        
        [self SureNextBtnClick:nil];
        return YES;
        
    }else{
        
        return NO;
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SureNextBtnClick:(id)sender {
    
    if (_Type == 0) {   //注册
        
        NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:_code,@"code",_phoneText,@"phone",_psdTield.text,@"password", nil];
        
        NSString *login_Str = WoTing_register;
        
        [ZCBNetworking postWithUrl:login_Str refreshCache:YES params:parameters success:^(id response) {
            
            NSDictionary *resultDict = (NSDictionary *)response;
            
            NSString  *ReturnType = [resultDict objectForKey:@"msg"];
            if ([ReturnType isEqualToString:@"success"]) {
                
                [WKProgressHUD popMessage:@"注册成功" inView:nil duration:0.5 animated:YES];
                
            }else if ([ReturnType isEqualToString:@"Phone had already registered!"]){
                
                [WKProgressHUD popMessage:@"手机号已经注册" inView:nil duration:0.5 animated:YES];
            }
            
        } fail:^(NSError *error) {
            
            NSLog(@"%@", error);
            
        }];
        
    }else{  //忘记密码
        
        
        NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:_code,@"code",_phoneText,@"phone",_psdTield.text,@"password", nil];
        
        NSString *login_Str = WoTing_ChangePwd;
        
        [ZCBNetworking postWithUrl:login_Str refreshCache:YES params:parameters success:^(id response) {
            
            NSDictionary *resultDict = (NSDictionary *)response;
            
            NSString  *ReturnType = [resultDict objectForKey:@"msg"];
            if ([ReturnType isEqualToString:@"success"]) {
                
                [WKProgressHUD popMessage:@"密码找回成功" inView:nil duration:0.5 animated:YES];
                
                NSDictionary *data = [resultDict objectForKey:@"data"];
            }
            
        } fail:^(NSError *error) {
            
            NSLog(@"%@", error);
            
        }];
    }
}

- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
