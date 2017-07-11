//
//  UIButton+Timer.h
//  BtTime_runtime
//
//  Created by 魏唯隆 on 2017/6/5.
//  Copyright © 2017年 魏唯隆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Timer)
@property (nonatomic, copy) NSString *time;

@property (nonatomic, retain) UIColor *color;

- (void)startTime;
- (void)stopTime;

@end
