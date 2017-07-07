//
//  WKProgressHUD.h
//  WKProgressHUD
//
//  Created by Welkin Xie on 3/8/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MyBlock)(void);

@interface WKProgressHUD : UIView
@property (nonatomic, weak) UIView *selfView;

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, copy) NSString *text;

// 等待中
+ (instancetype)showInView:(UIView *)view withText:(NSString *)text animated:(BOOL)animated;

// 提示消息
+ (instancetype)popMessage:(NSString *)text inView:(UIView *)view duration:(NSTimeInterval)duration animated:(BOOL)animated;

// 取消view中的HUD
+ (void)dismissInView:(UIView *)view animated:(BOOL)animated;

// 取消所有HUD
+ (void)dismissAll:(BOOL)animated;

// 取消
- (void)dismiss:(BOOL)animated;

//判断手机型号
+ (NSString*)deviceVersion;

//时间戳
+ (NSString *)timeForBeiJingTimeStamp:(NSString *)timeStamp andsetDateFormat:(NSString *)dateFormat;

//汉子转拼音首字母
+ (NSString *)firstCharactor:(NSString *)aString;

+ (NSString *)timeFormatted:(NSInteger)totalSeconds;

+ (void)PushAlertWithView:(UINavigationController *)selfViewControllerH andPushViewController:(UIViewController *)NextViewControllerH andMessage:(NSString *)message andHeader:(NSString *)HeaderMessage;

+ (void)presenAlertWithView:(UIViewController *)selfViewControllerH andPushViewController:(UIViewController *)NextViewControllerH andMessage:(NSString *)message andHeader:(NSString *)HeaderMessage andBlock:(MyBlock)presenblock;


+ (void)presenDismissAlertWithView:(UIViewController *)selfViewControllerH andPushViewController:(UIViewController *)NextViewControllerH andMessage:(NSString *)message andHeader:(NSString *)HeaderMessage andBlock:(MyBlock)presenblock;

+ (void)presenAppStoreAlertWithView:(UIViewController *)selfViewControllerH andPushViewController:(UIViewController *)NextViewControllerH andMessage:(NSString *)message andHeader:(NSString *)HeaderMessage andBlock:(MyBlock)presenblock;

+ (void)DismissAlertWithView:(UIViewController *)selfViewControllerH andPushViewController:(UIViewController *)NextViewControllerH andMessage:(NSString *)message andHeader:(NSString *)HeaderMessage andBlock:(MyBlock)presenblock;

@end

@protocol WKProgressHUDComponent <NSObject>

@optional
- (void)addIndicator;
- (void)addText;
- (void)compositeElements;

@end
