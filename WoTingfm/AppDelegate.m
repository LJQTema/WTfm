//
//  AppDelegate.m
//  WoTingfm
//
//  Created by jq on 2017/5/22.
//  Copyright © 2017年 jq. All rights reserved.
//

//2017年06月05日14:01:47
//2017年06月15日15:18:27

/*
                             _ooOoo_
                            o8888888o
                            88" . "88
                            (| -_- |)
                             O\ = /O
                         ____/`---'\____
                       .   ' \\| |// `.
                        / \\||| : |||// \
                      / _||||| -:- |||||- \
                        | | \\\ - /// | |
                      | \_| ''\LJQ/'' | |
                       \ .-\__ `-` ___/-. /
                    ___`. .' /--.--\ `. . __
                 ."" '< `.___\_<|>_/___.' >'"".
                | | : `- \`.;`\ _ /`;.`/ - ` : | |
                  \ \ `-. \_ __\ /__ _/ .-` / /
          ======`-.____`-.___\_____/___.-`____.-'======
                             `=---='
 
          .............................................
                   佛祖镇楼                  BUG辟易
           佛祖曰:
                   写字楼里写字间，写字间里程序员；
                   程序人员写程序，又拿程序换酒钱。
                   酒醒只在网上坐，酒醉还来网下眠；
                   酒醉酒醒日复日，网上网下年复年。
                   但愿老死电脑间，不愿鞠躬老板前；
                   奔驰宝马贵者趣，公交自行程序员。
                   别人笑我忒疯癫，我笑自己命太贱；
                   不见满街漂亮妹，哪个归得程序员？
 
 */


#import "AppDelegate.h"
#import "Stotage.h"
#import "WTReadyVC.h"
#import "GuidanceViewController.h"
#import "WTReadyVC.h"
#import "WTPlayerVC.h"

//#import <BaiduMobileAPM/BaiduMobileAPM.h>
#import <BDCloudMediaPlayer/BDCloudMediaPlayer.h>

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [[BDCloudMediaPlayerAuth sharedInstance] setAccessKey:@"724c9abc6cd9403daece9d4d17c3e31b"];
  //  [BaiduAPM startWithApplicationToken:@"de0b9578cf3741b99df94a81d1ee4780"];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //引导页与芬兰的切换
    if ([Stotage getGuidanceValue]) {
        if ([Stotage getLoginValue]) {
            
            
            
            self.window.rootViewController = [self createRootController];
            
        }else{
            
            self.window.rootViewController = [self createLoginView];
            
        }
        
        
    }else{
        
        self.window.rootViewController = [self createGuidanceView];
        
    }
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(crearetabbar) name:@"tabbar" object:nil];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


- (void)crearetabbar{
    self.window.rootViewController = [self createRootController];
    
}
#pragma mark -- 创建引导页
- (GuidanceViewController *)createGuidanceView{
    NSArray *imageArray = Guidance;
    GuidanceViewController *guidance = [[GuidanceViewController alloc]initWithImagesArr:imageArray andBlock:^{
        
        
        if ([Stotage getLoginValue]) {
            
            self.window.rootViewController = [self createRootController];
            
        }else{
            
            self.window.rootViewController = [self createLoginView];
        }
        
        //        NSLog(@"进入应用成功");
        //===================
    }];
    return guidance;
}



#pragma mark -- 创建登录页
- (UINavigationController *)createLoginView{
    
    
    
    return [[UINavigationController alloc]initWithRootViewController:[[WTReadyVC alloc]initWithBooL:NO]];
    
    
}

#pragma mark --创建根视图控制器

-(UIViewController *)createRootController
{
    
    return [[UINavigationController alloc]initWithRootViewController:[[WTPlayerVC alloc]init]];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end