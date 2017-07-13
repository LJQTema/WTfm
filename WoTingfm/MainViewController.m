//
//  MainViewController.m
//  KitchenProject
//
//  Created by 胡云超 on 16/1/25.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "MainViewController.h"
#import "WTPlayerVC.h"


@interface MainViewController ()
{
    
    
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.tabBar.backgroundColor = [UIColor blackColor];


    //获得标签栏上的所有子视图
    NSArray *subViewsArray=self.tabBar.subviews;
    //遍历数组
    for (UIView *view in subViewsArray) {
        view.hidden=YES;
    }
    

    self.tabBar.backgroundColor = [UIColor blackColor];

    // Do any additional setup after loading the view.
}

+ (MainViewController *)sharedManager
{
    static MainViewController *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}


//隐藏系统tabbar上面的子视图
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    
    
//    //获得标签栏上的所有子视图
//    NSArray *subViewsArray=self.tabBar.subviews;
//    //遍历数组
//    for (UIView *view in subViewsArray) {
//        view.hidden=YES;
//    }
}

//创建导航条按钮,添加到tabbar
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:
                           CGRectMake(
                                      5, 
                                      5, 
                                      CGRectGetHeight(self.tabBar.frame) - 10, 
                                      CGRectGetHeight(self.tabBar.frame) - 10)
                           ];
    
    
    imageV.backgroundColor = [UIColor redColor];
    [self.tabBar addSubview:imageV];
    imageV.layer.cornerRadius = imageV.frame.size.height/2.000;
    imageV.layer.masksToBounds = YES;
    imageV.layer.borderWidth = 1;
    imageV.layer.borderColor = [UIColor colorWithRed:103/255.0 green:90/255.0 blue:242/255.0 alpha:1].CGColor;
    UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, 200, 20)];
    labelName.text = @"这是一首简单的小情歌";
    
    labelName.textColor = [UIColor greenColor];
    
    [self.tabBar addSubview:labelName];
    
    imageV.userInteractionEnabled = YES;
    
    [imageV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
    
    labelName.userInteractionEnabled = YES;
    
    [labelName addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
    
}


-(void)tapClick:(UITapGestureRecognizer *)tap
{
    
    WTPlayerVC *playerVC = [[WTPlayerVC alloc]init];
    
  //  playerVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:playerVC animated:YES completion:nil];
        
}

- (void)yincangTabbarHight{
    
        
        
            
            [UIView animateWithDuration:0.5 animations:^{
                
                self.tabBar.frame = CGRectMake(0, HHHHH, WWWWW, 49);  
                
            } completion:^(BOOL finished) {
                
            }];
}

- (void)xianshiTabbarHight{
    
    [UIView animateWithDuration:0.5 animations:^{
                        
                        self.tabBar.frame = CGRectMake(0, HHHHH - 49, WWWWW, 49);  
                        
                    } completion:^(BOOL finished) {
                        
                    }];
    
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
