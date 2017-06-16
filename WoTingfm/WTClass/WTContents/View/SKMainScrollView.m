//
//  SKMainScrollView.m
//  Nowdo
//
//  Created by jq on 16/5/22.
//  Copyright © 2016年 jq. All rights reserved.
//

#import "SKMainScrollView.h"

@implementation SKMainScrollView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.backgroundColor = [UIColor clearColor];
        self.bounces = NO;
        self.pagingEnabled = YES;
    }
    
    return self;
}

/** 处理手势冲突，外部手势与ScrollView手势有冲突时候在这里面处理ScrollView的手势操作情况 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    CGPoint velocity = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self];
    CGPoint location = [gestureRecognizer locationInView:self];
    
    if ((velocity.x > 0.0f&&(int)location.x%(int)[UIScreen mainScreen].bounds.size.width<60))
    {
        return NO;
    }
    return YES;
}

@end
