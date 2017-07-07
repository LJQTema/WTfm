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

#import "WTSanLoginView.h"  //三方登录

@interface WTReadyVC ()

@property (nonatomic,strong)UIButton    *LogoBtn;  //logo
@property (nonatomic,strong)UIButton    *LoginBtn;  //登录Btn
@property (nonatomic,strong)UIButton    *ReigstBtn; //注册Btn
@property (nonatomic,strong)UIImageView *backgroupImgV; //背景图
@property (nonatomic,strong)UIButton    *randomBtn; //随便看看

@end

@implementation WTReadyVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    
    //---->--->-->->伦理分割线----<---<--<-<//
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];

    
    //---->--->-->->伦理分割线----<---<--<-<//

    [self createContentView];
}



- (void)createContentView{
    
    WTSanLoginView *sanLoginView = [[WTSanLoginView alloc] initWithFrame:CGRectMake(0, K_Screen_Height - 140, K_Screen_Width, 140)];
    [self.view addSubview:sanLoginView];
    
    __weak WTReadyVC *weakSelf = self;
    
    _backgroupImgV = [[UIImageView alloc] init];
    [self.view addSubview:_backgroupImgV];
    [_backgroupImgV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(K_Screen_Width);
        make.height.mas_equalTo(140);
        make.top.mas_equalTo(64 + 20);
        make.left.mas_equalTo(0);
    }];
    
    _LogoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_LogoBtn setImage:[UIImage imageNamed:@"AppIcon60x60.png"] forState:UIControlStateNormal];
    _LogoBtn.layer.cornerRadius = 10;
    _LogoBtn.layer.masksToBounds = YES;

    [self.view addSubview:_LogoBtn];
    [_LogoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(64+46);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];
    
    _ReigstBtn = [[UIButton alloc]init];
    [_ReigstBtn setTitle:@"手机号登录" forState:UIControlStateNormal];
    [_ReigstBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _ReigstBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [_ReigstBtn addTarget:self action:@selector(ReigstBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _ReigstBtn.layer.borderWidth = 1;
    _ReigstBtn.layer.borderColor = HYC__COLOR_HEX(0xFF7E42).CGColor;
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    
//    gradientLayer.colors = @[
//                             (__bridge id)HYC__COLOR_HEX(0xFFA855).CGColor, 
//                             (__bridge id)HYC__COLOR_HEX(0xFF7447).CGColor
//                             ];
//    
//    gradientLayer.locations = @[@0.2, @1.0];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1.0, 0);
//    gradientLayer.frame = CGRectMake(0, 0, K_Screen_Width-60, 40);
//    [_ReigstBtn.layer addSublayer:gradientLayer];
    
    _ReigstBtn.layer.cornerRadius = 19.5;
    _ReigstBtn.layer.masksToBounds = YES;
    
    [self.view addSubview:_ReigstBtn];
    
    if (K_Screen_Width > 320) {
        
        [_ReigstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(_backgroupImgV.mas_bottom).with.offset(52);
            make.height.mas_equalTo(40);
            make.left.mas_equalTo(30);
            make.right.mas_equalTo(-30);
        }];
    }else{
        
        [_ReigstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(_backgroupImgV.mas_bottom).with.offset(22);
            make.height.mas_equalTo(40);
            make.left.mas_equalTo(30);
            make.right.mas_equalTo(-30);
        }];
    }
    
    
    
    _LoginBtn = [[UIButton alloc]init];

    [_LoginBtn setTitle:@"注册" forState:UIControlStateNormal];
    _LoginBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [_LoginBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    _LoginBtn.backgroundColor = [UIColor whiteColor];
    _LoginBtn.layer.cornerRadius = 19.5;
    _LoginBtn.layer.masksToBounds = YES;
    
    _LoginBtn.layer.borderWidth = 1;
    _LoginBtn.layer.borderColor = HYC__COLOR_HEX(0xEFEFEF).CGColor;
    
    [_LoginBtn addTarget:self action:@selector(LoginbtnClick:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:_LoginBtn];
    [_LoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_ReigstBtn.mas_bottom).with.offset(16);
        make.height.mas_equalTo(40);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
    }];
    
    
    _randomBtn = [[UIButton alloc] init];
    [_randomBtn addTarget: self action:@selector(randomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_randomBtn setTitle:@"随便看看 >" forState:UIControlStateNormal];
    [_randomBtn setTitleColor:HYC__COLOR_HEX(0x84858A) forState:UIControlStateNormal];
    _randomBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_randomBtn];
    [_randomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(_LoginBtn.mas_bottom).with.offset(30);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
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

//注册按钮
- (void)LoginbtnClick:(UIButton *)btn{
    
    WTForgotPsd *wtFor = [[WTForgotPsd alloc] init];
    wtFor.Type = 0;
    [self.navigationController pushViewController:wtFor animated:YES];

    
}
//登录按钮
- (void)ReigstBtnClick:(UIButton *)btn{
    
    WTLoginVC *LoginVc = [[WTLoginVC alloc] init];
    
    [self.navigationController pushViewController:LoginVc animated:YES];
}

#pragma mark - 切换根控制器
- (void)randomBtnClick{
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tabbar" object:nil];
    
}
@end
