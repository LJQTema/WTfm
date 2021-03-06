//
//  WTContentsVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/8.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTContentsVC.h"        //首页

#import "WTFoundVC.h"   //发现
#import "WTSortVC.h"    //分类
#import "WTRadioVC.h"   //电台
#import "WTLiveVC.h"    //直播
#import "WTMainVC.h"    //我的


#import "SKMainScrollView.h"
#import "WTSearchView.h"    //语音View
#import "MainViewController.h"

#import "WTMainVC.h"

#define barLineImageViewWigth 50
@interface WTContentsVC ()<UIScrollViewDelegate>{
    
    SKMainScrollView    *contentScrollView;
    UIImageView         *barLineImageView;//标识条

    
    NSArray *_munuNameArray;
    
}

@property (weak, nonatomic) IBOutlet UIView *ContentView;   //标题

@end

@implementation WTContentsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _munuNameArray = @[@"精选",@"分类",@"电台",@"直播",@"我的"];
    
    //---->--->-->->伦理分割线----<---<--<-<//
    self.navigationController.navigationBar.hidden = YES;
    
    
    
    //---->--->-->->伦理分割线----<---<--<-<//
    [self initTabBarView];
    [self initScrollerView];
}

- (void)initTabBarView{
    
    
    
    for (int i = 0; i < _munuNameArray.count; i++) {
        
        UIButton *buttonMune = [[UIButton alloc]
                                initWithFrame:
                                CGRectMake(
                                           (WWWWW )/1.00/_munuNameArray.count * i,
                                           0, 
                                           (WWWWW )/1.00/_munuNameArray.count,
                                           self.ContentView.frame.size.height - 2)];
        buttonMune.tag = 1221 + i;
        [buttonMune setTitle:_munuNameArray[i] forState:UIControlStateNormal];
        [buttonMune setTitleColor:[UIColor blackColor] forState:0];
        buttonMune.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_ContentView addSubview:buttonMune];
        
        
        [buttonMune addTarget:self action:@selector(barButtonSelect:) forControlEvents:UIControlEventTouchUpInside];
        
            
        if (!i) {
            
            [buttonMune setTitleColor:HYC__COLOR_HEX(0xFD8548) forState:0];
            
            
            
            
            barLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake((buttonMune.frame.size.width - barLineImageViewWigth)/2.00, self.ContentView.frame.size.height - 1, barLineImageViewWigth, 1)];
            barLineImageView.backgroundColor = HYC__COLOR_HEX(0xFD8548);
            [_ContentView addSubview:barLineImageView];
        }
    }

}

- (void)initScrollerView{
    
    //  __weak WTXiangJiangViewController *weakSelf = self;
    contentScrollView = [[SKMainScrollView alloc] initWithFrame:CGRectMake(0, 64 + 36, K_Screen_Width, K_Screen_Height - 64 - 36 - 49)];
    contentScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:contentScrollView];
    
    // 防止scroll上下拖动
    contentScrollView.contentSize = CGSizeMake(K_Screen_Width * 5, 0);
    contentScrollView.pagingEnabled = YES;
    contentScrollView.bounces = NO;
    contentScrollView.contentOffset = CGPointMake(0, 0);
    contentScrollView.delegate = self;
//    contentScrollView.showsHorizontalScrollIndicator=true;
//    contentScrollView.showsVerticalScrollIndicator=false;
    
    for (int i = 0; i < 5; i ++) {
        
        if (i == 0) {
            
            WTFoundVC *wtTuiJianVC = [[WTFoundVC alloc] init];
            
            [self addChildViewController:wtTuiJianVC];
            [contentScrollView addSubview:wtTuiJianVC.view];
            [wtTuiJianVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.width.equalTo(contentScrollView);
                make.height.equalTo(contentScrollView);
                make.left.mas_equalTo(@0);
                make.centerY.equalTo(contentScrollView);
            }];
            
        }else if (i == 1) {
            
            WTSortVC *wtDianTaiVC = [[WTSortVC alloc] init];
            
            [self addChildViewController:wtDianTaiVC];
            [contentScrollView addSubview:wtDianTaiVC.view];
            [wtDianTaiVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.width.equalTo(contentScrollView);
                make.height.equalTo(contentScrollView);
                make.left.mas_equalTo(K_Screen_Width * i);
                make.centerY.equalTo(contentScrollView);
            }];
            
        }else if (i == 2) {
            
            WTRadioVC *wtFenLeiVC = [[WTRadioVC alloc] init];
            
            [self addChildViewController:wtFenLeiVC];
            [contentScrollView addSubview:wtFenLeiVC.view];
            [wtFenLeiVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.width.equalTo(contentScrollView);
                make.height.equalTo(contentScrollView);
                make.left.mas_equalTo(K_Screen_Width * i);
                make.centerY.equalTo(contentScrollView);
            }];
            
        }else if (i == 3) {
            
            WTLiveVC *wtFenLeiVC = [[WTLiveVC alloc] init];
            
            [self addChildViewController:wtFenLeiVC];
            [contentScrollView addSubview:wtFenLeiVC.view];
            [wtFenLeiVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.width.equalTo(contentScrollView);
                make.height.equalTo(contentScrollView);
                make.left.mas_equalTo(K_Screen_Width * i);
                make.centerY.equalTo(contentScrollView);
            }];
            
        }else{
            
            WTMainVC *wtFenLeiVC = [[WTMainVC alloc] init];
            
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
- (void)barButtonSelect:(UIButton *)aBtn {
    
        for (int i = 1221; i < 1221 + _munuNameArray.count; i ++) {
            
            if (i != aBtn.tag) {
                
                UIButton *NOBtn = (UIButton *)[self.view viewWithTag:i];
                
                [UIView animateWithDuration:0.3 animations:^{
                   
                    [NOBtn setTitleColor:[UIColor blackColor] forState:0];
                    
                    
                }];
                
                
                
            }else{
                
                
                [UIView animateWithDuration:0.3 animations:^{
                    
                    [aBtn setTitleColor:HYC__COLOR_HEX(0xFD8548) forState:0];
                    
                    barLineImageView.frame = 
                    
                    CGRectMake
                    
                    (
                     
                     (aBtn.tag - 1221) * (WWWWW)/1.00/_munuNameArray.count + ((WWWWW)/1.00/_munuNameArray.count - barLineImageViewWigth)/2.00,
                     self.ContentView.frame.size.height - 1, 
                     barLineImageViewWigth,
                     1
                     
                     );
                    

                    [contentScrollView setContentOffset:CGPointMake(self.view.bounds.size.width * (aBtn.tag - 1221), 0) animated:YES];
                    
                }];
                
                contentScrollView.contentOffset = CGPointMake(self.view.bounds.size.width * (i - 1221), 0);
                
                

                     

                
                [contentScrollView setContentOffset:CGPointMake(self.view.bounds.size.width * (aBtn.tag - 1221), 0) animated:YES];

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
    
    NSLog(@"%f",numberFloat);
    if (numberFloat - number != 0) {
        
        [leftBtn setTitleColor:HYC__COLOR_RGBL(253 - 253.00 * (numberFloat - number),133 - 133.00 * (numberFloat - number),72 - 72.00 * (numberFloat - number),1) forState:0];
        
        [rightBtn setTitleColor:HYC__COLOR_RGBL(253 * (numberFloat - number), 133 * (numberFloat - number), 72 * (numberFloat - number), 1) forState:0];
        
        barLineImageView.frame = 
        
        CGRectMake
        
        (
         
         numberFloat * (WWWWW)/1.00/_munuNameArray.count + ((WWWWW)/1.00/_munuNameArray.count - barLineImageViewWigth)/2.00, 
         self.ContentView.frame.size.height - 1,
         barLineImageViewWigth, 
         1
         
         );
        
    }

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

#pragma mark - 进入个人中心
- (IBAction)BackBtnClick:(id)sender {
    
    
    WTMainVC *mainVC = [[WTMainVC alloc] init];
    
    [self.navigationController pushViewController:mainVC animated:YES];
    
    
}

#pragma mark - 点击搜索
- (IBAction)YuYinBtnClick:(id)sender {
    

}




@end
