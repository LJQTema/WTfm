//
//  WTReadyVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/5.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTReadyVC.h"

#import "WTLoginVC.h"
#import "WTForgotPsd.h"

@interface WTReadyVC (){
    
    BOOL _zhuangtai;
    
}

@end

@implementation WTReadyVC



- (instancetype)initWithBooL:(BOOL)zhuangtai{
    
    self = [super init];
    if (self) {
        
        _zhuangtai = zhuangtai;
        
        
    }
    
    
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    
    //---->--->-->->伦理分割线----<---<--<-<//
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [_ContenetBtnName setTitleColor:HYC__COLOR_HEX(0x959698) forState:0];
    
    //---->--->-->->伦理分割线----<---<--<-<//
    [self BackBtnYesorNo];
    [self createContentView];
}

- (void)BackBtnYesorNo{
    
    if (!_zhuangtai) {
        
        [self.backBtnName removeFromSuperview];
        
    }
    
}


- (void)createContentView{
    
    __weak WTReadyVC *weakSelf = self;
    
    _LogoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_LogoBtn setImage:[UIImage imageNamed:@"AppIcon60x60.png"] forState:UIControlStateNormal];
    _LogoBtn.layer.cornerRadius = 10;
    _LogoBtn.layer.masksToBounds = YES;

    [self.view addSubview:_LogoBtn];
    [_LogoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_NavView.mas_bottom).with.offset(46);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    
    _ReigstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_ReigstBtn setTitle:@"新用户注册" forState:UIControlStateNormal];
    [_ReigstBtn addTarget:self action:@selector(ReigstBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.colors = @[
                             (__bridge id)HYC__COLOR_HEX(0xFFA855).CGColor, 
                             (__bridge id)HYC__COLOR_HEX(0xFF7447).CGColor
                             ];
    
    gradientLayer.locations = @[@0.2, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0, K_Screen_Width-60, 40);
    [_ReigstBtn.layer addSublayer:gradientLayer];
    
    _ReigstBtn.layer.cornerRadius = 19.5;
    _ReigstBtn.layer.masksToBounds = YES;
    
    _ReigstBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.view addSubview:_ReigstBtn];
    [_ReigstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_LogoBtn.mas_bottom).with.offset(80);
        make.height.mas_equalTo(40);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
    }];
    
    
    _LoginBtn = [[UIButton alloc]init];

    _LoginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_LoginBtn setTitle:@"手机登录" forState:UIControlStateNormal];
    [_LoginBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    _LoginBtn.backgroundColor = [UIColor whiteColor];
    _LoginBtn.layer.cornerRadius = 19.5;
    _LoginBtn.layer.masksToBounds = YES;
    
    _LoginBtn.layer.borderWidth = 1;
    _LoginBtn.layer.borderColor = HYC__COLOR_HEX(0xFF7447).CGColor;
    
    [_LoginBtn addTarget:self action:@selector(LoginbtnClick:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:_LoginBtn];
    [_LoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_ReigstBtn.mas_bottom).with.offset(16);
        make.height.mas_equalTo(40);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
    }];
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

//登录按钮
- (void)LoginbtnClick:(UIButton *)btn{
    
    WTLoginVC *LoginVc = [[WTLoginVC alloc] init];
    
    [self.navigationController pushViewController:LoginVc animated:YES];
    
}
//注册按钮
- (void)ReigstBtnClick:(UIButton *)btn{
    
    WTForgotPsd *wtFor = [[WTForgotPsd alloc] init];
    wtFor.Type = 0;
    [self.navigationController pushViewController:wtFor animated:YES];
}

#pragma mark - 切换根控制器
- (IBAction)BackBtnClick:(id)sender {
}
- (IBAction)ContenetBtnClick:(id)sender {
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tabbar" object:nil];
    
    
}
@end
