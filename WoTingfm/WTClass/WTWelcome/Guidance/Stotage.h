//
//  Stotage.h
//  AXM_Demo
//
//  Created by hyc on 16/1/19.
//  Copyright (c) 2016年 hyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stotage : NSObject

//引导页的标记
+ (BOOL)setGuidanceKey:(BOOL)calue;

+ (BOOL)getGuidanceValue;

+ (BOOL)setLoginKey:(BOOL)value;

+ (BOOL)getLoginValue;

@end
