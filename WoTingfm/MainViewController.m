//
//  MainViewController.m
//  KitchenProject
//
//  Created by 胡云超 on 16/1/25.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "MainViewController.h"



@interface MainViewController ()
{
    //用临时变量记录高亮状态的按钮
    UILabel *_tmpLb;
    UINavigationController *_tmpNavigationController;
    UIImageView *_tmpImgV;
    
    NSString *_UPURL;
    
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

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

    
    
    //获得标签栏上的所有子视图
    NSArray *subViewsArray=self.tabBar.subviews;
    //遍历数组
    for (UIView *view in subViewsArray) {
        view.hidden=YES;
    }
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
    
//    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
//    
//    NSString *a =[userDef objectForKey:@"ZJJYHYCTABBAREVERY"];
//    
//    NSArray *array=self.viewControllers;
//    for (int i=0; i<array.count ; i++) {
//        
//        UINavigationController *nav=[array objectAtIndex:i];
//        //创建图片
//        UIImageView *itemImgV=[[UIImageView alloc]initWithFrame:CGRectMake(i*WWWWW/4, 0, WWWWW/4, 49)];
//        itemImgV.image=nav.tabBarItem.image;
//        //将图片添加到标签栏
//        [self.tabBar addSubview:itemImgV];
//        
//        //创建按钮上的文字
//        UILabel *lb=[[UILabel alloc]initWithFrame:CGRectMake(0, 38, WWWWW/4, 10)];
//        lb.text=nav.tabBarItem.title;
//        lb.textAlignment=NSTextAlignmentCenter;
//        lb.font=[UIFont systemFontOfSize:15];
//        [itemImgV addSubview:lb];
//        
//        if (a == nil) {
//            
//            a = @"0";
//            
//        }
//        
//        
//        //设置默认第一个按钮为高亮
//        if([a isEqualToString:[NSString stringWithFormat:@"%d",i]])
//        {
//            
//            
//            itemImgV.image=nav.tabBarItem.selectedImage;
//            [lb setTextColor:[UIColor orangeColor]];
//            //将当前高亮的按钮保存临时变量
//            _tmpLb=lb;
//            _tmpImgV=itemImgV;
//            _tmpNavigationController=nav;
//            
//        }
//        
//        if (i == 1) {
//            
//            UILabel *labelNumber = [[UILabel alloc]initWithFrame:CGRectMake(60, 5, 10, 10)];
//            
////            labelNumber.text = a;
//            
//            labelNumber.font = [UIFont systemFontOfSize:10];
//            
//            labelNumber.textAlignment = UITextAlignmentCenter;
//            
//            labelNumber.backgroundColor = [UIColor redColor];
//            
//            labelNumber.textColor = [UIColor whiteColor];
//            
//            labelNumber.layer.masksToBounds = YES;
//            labelNumber.layer.cornerRadius = labelNumber.frame.size.width/2.000000;
//            
//            labelNumber.tag = 150;
//            
//            [itemImgV addSubview:labelNumber];
//            
//        }
//        
//        
//        //创建点击手势
//        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
//        itemImgV.userInteractionEnabled=YES;
//        //为每张图片添加tag
//        itemImgV.tag=i+100;
//        [itemImgV addGestureRecognizer:tap];
//        
//        
//    }
    
}


-(void)tapClick:(UITapGestureRecognizer *)tap
{
    
    if (tap.view.tag == 101) {
        
        UILabel *labelName = (UILabel *)[self.view viewWithTag:150];
        
        [labelName removeFromSuperview];
        
    }
    
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:[NSString stringWithFormat:@"%ld",tap.view.tag-100] forKey:@"ZJJYHYCTABBAREVERY"];
    [userDef synchronize];
    
    NSString *a =[userDef objectForKey:@"ZJJYHYCTABBAREVERY"];
    
    
    //将临时变量改为低亮
    [_tmpLb setTextColor:[UIColor blackColor]];
    _tmpImgV.image=_tmpNavigationController.tabBarItem.image;
    
    //将点击的按钮变为高亮
    NSArray *navigationControllerArray=self.viewControllers;
    
    UINavigationController *nav=[navigationControllerArray objectAtIndex:tap.view.tag-100];
    
    UIImageView *imgV=(UIImageView *)tap.view;
    imgV.image=nav.tabBarItem.selectedImage;
    //获得图片上的label
    UILabel *lb=(UILabel *)[imgV.subviews lastObject];
    [lb setTextColor:[UIColor orangeColor]];
    
    
    //临时变量保存高亮按钮
    _tmpNavigationController=nav;
    _tmpLb=lb;
    _tmpImgV=imgV;
    
    
    
    //实现子视图控制器页面的切换
    self.selectedIndex=tap.view.tag-100;
    
    
    
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
