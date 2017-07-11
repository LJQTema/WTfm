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
#import "GuidanceViewController.h"
#import "WTReadyVC.h"           //登录页
#import "WTContentsVC.h"        //首页
#import "WTPlayerVC.h"
#import "MainViewController.h"
//#import <BaiduMobileAPM/BaiduMobileAPM.h>
#import <BDCloudMediaPlayer/BDCloudMediaPlayer.h>

@interface AppDelegate (){
    
    MainViewController *_mainVC;
    WTContentsVC *_firstVC;
    UINavigationController *_firstNavC;
    
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[BDCloudMediaPlayerAuth sharedInstance] setAccessKey:@"724c9abc6cd9403daece9d4d17c3e31b"];
    
    
    //设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"585a24992ae85b6dba0017c0"];
    
    //设置微信的appKey和appSecret wxf121849552e18759
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxf121849552e18759" appSecret:@"962517d5f0543ced89e2cd40591757ea" redirectURL:@"http://mobile.umeng.com/social"];
    
    
    //设置分享到QQ互联的appKey和appSecret
    // U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1105827057"  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    
    //设置新浪的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"1499359778"  appSecret:@"452ace3e601bcc9390fd2680717d3a6b" redirectURL:@"http://www.woting.com"];
    
    
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
        
    }];
    return guidance;
}



#pragma mark -- 创建登录页
- (UINavigationController *)createLoginView{
    
    
    
    return [[UINavigationController alloc]initWithRootViewController:[[WTReadyVC alloc]init]];
    
    
}

#pragma mark --创建根视图控制器

-(UIViewController *)createRootController
{  
   
    _firstVC=[[WTContentsVC alloc]init];
    _firstNavC=[[UINavigationController alloc]initWithRootViewController:_firstVC];

    _mainVC=[MainViewController sharedManager];

    _mainVC.viewControllers=@[_firstNavC];

    return
    
    _mainVC
    ;
    
    
    return [[UINavigationController alloc]initWithRootViewController:[[WTContentsVC alloc]init]];
    
}


// 分享回调
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
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
