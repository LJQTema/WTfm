//
//  Stotage.m
//  AXM_Demo
//
//  Created by hyc on 16/1/19.
//  Copyright (c) 2016年 hyc. All rights reserved.
//

#import "Stotage.h"
#define GUIDANCE_KEY @"ZHUANSHUJIAOYIPINGTAI_HYC_GUIDANCE_KEY"
#define LOGIN_KEY @"ZHUANSHUJIAOYIPINGTAI_HYC_LOGIN_KEY"
@implementation Stotage
#pragma mark - 设置 引导标记
+ (BOOL)setGuidanceKey:(BOOL)value{
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setBool:value forKey:GUIDANCE_KEY];
    return [userDef synchronize];
}
#pragma mark -
+ (BOOL)getGuidanceValue{
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    return [userDef boolForKey:GUIDANCE_KEY];
}

+ (BOOL)getLoginValue{
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    return [userDef boolForKey:LOGIN_KEY];
    
}

+ (BOOL)setLoginKey:(BOOL)value{
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setBool:value forKey:LOGIN_KEY];
    return [userDef synchronize];
}
@end
