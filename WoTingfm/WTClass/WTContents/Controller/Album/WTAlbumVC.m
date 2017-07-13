//
//  WTAlbumVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/21.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTAlbumVC.h"

#import "WTAlbumDetailVC.h"     //详情
#import "WTAlbumItem.h"         //节目
#import "WTAlbumSimilar.h"      //相似

#import "SKMainScrollView.h"

@interface WTAlbumVC ()<UIScrollViewDelegate>{
    
    SKMainScrollView    *contentScrollView;
    
    NSArray *_munuNameArray;
}

@property (weak, nonatomic) IBOutlet UILabel *ContentLab;
@property (weak, nonatomic) IBOutlet UIImageView *backgroudImgV;
@property (weak, nonatomic) IBOutlet UIImageView *ContentImgV;
@property (weak, nonatomic) IBOutlet UIButton *SubscribeBtn;

@property (weak, nonatomic) IBOutlet UIView *titleView;

@end

@implementation WTAlbumVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _munuNameArray = @[@"详情",@"节目",@"相似"];
    
    _ContentImgV.layer.cornerRadius = 5;
    _ContentImgV.layer.masksToBounds = YES;
    
    _SubscribeBtn.layer.cornerRadius = 32/2;
    _SubscribeBtn.layer.masksToBounds = YES;
    
    [self CreateAlbumUI];
    [self CreateTitleView];
    [self initScrollerView];
}

- (void)CreateAlbumUI{
    
    _backgroudImgV.image = [UIImage imageNamed:@"timg-8"];
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.barStyle = UIBarStyleBlack;
    
    [_backgroudImgV addSubview:toolbar];
    [toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];
    
    _ContentImgV.image = [UIImage imageNamed:@"timg-8"];
    
}

- (void)CreateTitleView{
    
    for (int i = 0; i < _munuNameArray.count; i++) {
        
        UIButton *buttonMune = [[UIButton alloc]
                                initWithFrame:
                                CGRectMake(
                                           K_Screen_Width/3.00 * i,
                                           0,
                                           K_Screen_Width/3.00,
                                           _titleView.frame.size.height)];
        buttonMune.tag = 1221 + i;
        [buttonMune setTitle:_munuNameArray[i] forState:UIControlStateNormal];
        [buttonMune setTitleColor:[UIColor blackColor] forState:0];
        buttonMune.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [_titleView addSubview:buttonMune];
        
        
        [buttonMune addTarget:self action:@selector(barAlbumButtonSelect:) forControlEvents:UIControlEventTouchUpInside];
        
        
        if (!i) {
            
            [buttonMune setTitleColor:HYC__COLOR_HEX(0xFD8548) forState:0];
            
        }
    }
    
}

- (void)initScrollerView{
    
    contentScrollView = [[SKMainScrollView alloc] initWithFrame:CGRectMake(0, 260, K_Screen_Width, K_Screen_Height - 260 - 49)];
    contentScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:contentScrollView];
    
    // 防止scroll上下拖动
    contentScrollView.contentSize = CGSizeMake(K_Screen_Width * 3, 0);
    contentScrollView.pagingEnabled = YES;
    contentScrollView.bounces = NO;
    contentScrollView.contentOffset = CGPointMake(0, 0);
    contentScrollView.delegate = self;
    
    for (int i = 0; i < 3; i ++) {
        
        if (i == 0) {
            
            WTAlbumDetailVC *wtTuiJianVC = [[WTAlbumDetailVC alloc] init];
            
            [self addChildViewController:wtTuiJianVC];
            [contentScrollView addSubview:wtTuiJianVC.view];
            [wtTuiJianVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.width.equalTo(contentScrollView);
                make.height.equalTo(contentScrollView);
                make.left.mas_equalTo(@0);
                make.centerY.equalTo(contentScrollView);
            }];
            
        }else if (i == 1) {
            
            WTAlbumItem *wtDianTaiVC = [[WTAlbumItem alloc] init];
            
            [self addChildViewController:wtDianTaiVC];
            [contentScrollView addSubview:wtDianTaiVC.view];
            [wtDianTaiVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.width.equalTo(contentScrollView);
                make.height.equalTo(contentScrollView);
                make.left.mas_equalTo(K_Screen_Width * i);
                make.centerY.equalTo(contentScrollView);
            }];
            
        }else{
            
            WTAlbumSimilar *wtFenLeiVC = [[WTAlbumSimilar alloc] init];
            
            [self addChildViewController:wtFenLeiVC];
            [contentScrollView addSubview:wtFenLeiVC.view];
            [wtFenLeiVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.width.equalTo(contentScrollView);
                make.height.equalTo(contentScrollView);
                make.left.mas_equalTo(K_Screen_Width * i);
                make.centerY.equalTo(contentScrollView);
            }];
            
            
        }
    }
}

#pragma mark - 菜单栏按钮被点击
- (void)barAlbumButtonSelect:(UIButton *)aBtn {
    
    for (int i = 1221; i < 1221 + _munuNameArray.count; i ++) {
        
        if (i != aBtn.tag) {
            
            UIButton *NOBtn = (UIButton *)[self.view viewWithTag:i];
            
            [NOBtn setTitleColor:[UIColor blackColor] forState:0];
            
            
        }else{
            
            
            [aBtn setTitleColor:HYC__COLOR_HEX(0xFD8548) forState:0];
            
            contentScrollView.contentOffset = CGPointMake(self.view.bounds.size.width * (i - 1221), 0);
            
        }
    }
    
}

#pragma mark - 视图左右切换
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    /** 如果滑动的ScrollView是contentScrollView，则通过判断偏移量，设置当前菜单选中状态 */
    
    //253,133,72
    
    NSInteger number = scrollView.contentOffset.x/WWWWW;
    float numberFloat = scrollView.contentOffset.x/WWWWW;
    
    
    UIButton *leftBtn = [self.view viewWithTag:1221 + number];
    UIButton *rightBtn = [self.view viewWithTag:1222 + number];
    
    NSLog(@"%f,%ld",numberFloat,number);
    if (numberFloat - number != 0) {
        
        [leftBtn setTitleColor:HYC__COLOR_RGBL(253 - 253.00 * (numberFloat - number),133 - 133.00 * (numberFloat - number),72 - 72.00 * (numberFloat - number),1) forState:0];
        
        [rightBtn setTitleColor:HYC__COLOR_RGBL(253 * (numberFloat - number), 133 * (numberFloat - number), 72 * (numberFloat - number), 1) forState:0];
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)moreBtnClick:(id)sender {
    

}

@end
