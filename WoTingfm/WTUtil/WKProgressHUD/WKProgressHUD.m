//
//  WKProgressHUD.m
//  WKProgressHUD
//
//  Created by Welkin Xie on 3/8/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import "WKProgressHUD.h"
#import "WKMessageProgressHUD.h"
#import "WKWaitingProgressHUD.h"

#import "sys/utsname.h"

static NSMutableArray *HUDs;

@interface WKProgressHUD () <WKProgressHUDComponent>

@end

@implementation WKProgressHUD

+ (void)load {
    HUDs = [NSMutableArray array];
}

+ (instancetype)showInView:(UIView *)view withText:(NSString *)text animated:(BOOL)animated {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    WKProgressHUD *HUD = [[WKWaitingProgressHUD alloc] initWithFrame:view.bounds];
    
    
    HUD.selfView = window;
    HUD.text = text;
    
    [HUD addIndicator];
    [HUD addText];
    [HUD compositeElements];
    
    [HUD show:animated withDuration:0 completion:nil];
    
    return HUD;
}

+ (instancetype)popMessage:(NSString *)text inView:(UIView *)view duration:(NSTimeInterval)duration animated:(BOOL)animated {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    WKProgressHUD *HUD = [[WKMessageProgressHUD alloc] initWithFrame:view.bounds];
    HUD.selfView = window;
    HUD.text = text;
    
    [HUD addText];
    [HUD compositeElements];
    
    [HUD show:animated withDuration:duration completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [HUD dismiss:animated];
        });
    }];
    
    return HUD;
}

+ (void)dismissInView:(UIView *)view animated:(BOOL)animated {
    for (WKProgressHUD *HUD in HUDs) {
        if ([HUD.selfView isEqual:view]) {
            [HUD dismiss:animated];
        }
    }
}

+ (void)dismissAll:(BOOL)animated {
    for (WKProgressHUD *HUD in HUDs) {
        [HUD dismiss:animated];
    }
}

- (void)dismiss:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.3 animations:^{
            for (UIView *view in self.subviews) {
                view.alpha = 0;
            }
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            [HUDs removeObject:self];
        }];
    }
    else {
        [self removeFromSuperview];
        [HUDs removeObject:self];
    }
}

- (void)show:(BOOL)animated withDuration:(NSTimeInterval)duration completion:(void (^)())completion {
    [self addSubview:self.backView];
    [HUDs addObject:self];
    
    if (animated) {
        self.alpha = 0;
        [self.selfView addSubview:self];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 1;
        } completion:^(BOOL finished) {
            if (completion != NULL) {
                completion();
            }
        }];
    }
    else {
        [self.selfView addSubview:self];
    }
}


#pragma mark -- 封装提示框
+ (void)PushAlertWithView:(UINavigationController *)selfViewControllerH andPushViewController:(UIViewController *)NextViewControllerH andMessage:(NSString *)message andHeader:(NSString *)HeaderMessage{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:HeaderMessage message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actiongengxin = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [alert dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
    UIAlertAction *actionquxiao = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        [selfViewControllerH.navigationController pushViewController:NextViewControllerH animated:YES];
        
    }];
    
    
    [alert addAction:actiongengxin];
    [alert addAction:actionquxiao];
    
    [selfViewControllerH presentViewController:alert animated:YES completion:nil];
    
}


+ (void)presenAlertWithView:(UIViewController *)selfViewControllerH andPushViewController:(UIViewController *)NextViewControllerH andMessage:(NSString *)message andHeader:(NSString *)HeaderMessage andBlock:(MyBlock)presenblock{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:HeaderMessage message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actiongengxin = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [alert dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
    UIAlertAction *actionquxiao = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        [selfViewControllerH presentViewController:NextViewControllerH animated:YES completion:presenblock];
        
    }];
    
    
    [alert addAction:actiongengxin];
    [alert addAction:actionquxiao];
    
    [selfViewControllerH presentViewController:alert animated:YES completion:nil];
    
}
//登陆取消
+ (void)presenDismissAlertWithView:(UIViewController *)selfViewControllerH andPushViewController:(UIViewController *)NextViewControllerH andMessage:(NSString *)message andHeader:(NSString *)HeaderMessage andBlock:(MyBlock)presenblock{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:HeaderMessage message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actiongengxin = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [alert dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
    UIAlertAction *actionquxiao = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        [selfViewControllerH dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
    
    [alert addAction:actiongengxin];
    [alert addAction:actionquxiao];
    
    [selfViewControllerH presentViewController:alert animated:YES completion:nil];
    
}

+ (void)DismissAlertWithView:(UIViewController *)selfViewControllerH andPushViewController:(UIViewController *)NextViewControllerH andMessage:(NSString *)message andHeader:(NSString *)HeaderMessage andBlock:(MyBlock)presenblock{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:HeaderMessage message:message preferredStyle:UIAlertControllerStyleAlert];
    
//    UIAlertAction *actiongengxin = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        
//        [alert dismissViewControllerAnimated:YES completion:nil];
//        
//    }];
    
    UIAlertAction *actionquxiao = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        [selfViewControllerH dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
    
//    [alert addAction:actiongengxin];
    [alert addAction:actionquxiao];
    
    [selfViewControllerH presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - 跳转appStore
+ (void)presenAppStoreAlertWithView:(UIViewController *)selfViewControllerH andPushViewController:(UIViewController *)NextViewControllerH andMessage:(NSString *)message andHeader:(NSString *)HeaderMessage andBlock:(MyBlock)presenblock{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:HeaderMessage message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actiongengxin = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [alert dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
    UIAlertAction *actionquxiao = [UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/cn/app/jie-zou-da-shi/id1141795354?mt=8"]];
        
    }];
    
    
    [alert addAction:actiongengxin];
    [alert addAction:actionquxiao];
    
    [selfViewControllerH presentViewController:alert animated:YES completion:nil];
    
    
}

+ (NSString*)deviceVersion
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",deviceString);
    
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6S";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6SPlus";
    if ([deviceString isEqualToString:@"iPhone8,3"])    return @"iPhoneSE";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhoneSE";
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone7Plus";
    
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    //CLog(@"NOTE: Unknown device type: %@", deviceString);
    
    return deviceString;
}

+ (NSString *)timeForBeiJingTimeStamp:(NSString *)timeStamp andsetDateFormat:(NSString *)dateFormat{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:dateFormat];
    //转格式
    
    // 北京时间戳1500000000（可以把北京时间戳转成北京时间、格林尼治时间）
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:[timeStamp intValue]];
    
    
    return [formatter stringFromDate:date1];
    
    
}


+ (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}

+ (NSString *)timeFormatted:(NSInteger)totalSeconds
{
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
}


@end
