//
//  RollView.h
//  WoTingfm
//
//  Created by hyc on 2017/6/7.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

/** 设置代理 */
@protocol RollViewDelegate <NSObject>

-(void)didSelectPicWithIndexPath:(NSInteger)index;
@end


@interface RollView : UIView

@property (nonatomic, assign) id<RollViewDelegate> delegate;

/**
 初始化
 
 @param frame 设置View大小
 @param distance 设置Scroll距离View两侧距离
 @param gap 设置Scroll内部 图片间距
 @return 初始化返回值
 */
- (instancetype)initWithFrame:(CGRect)frame withDistanceForScroll:(float)distance withGap:(float)gap withLabelHight:(float)LabelHight;

/** 滚动视图数据 */
-(void)rollView:(NSArray *)dataArr;




@property (nonatomic, strong) void (^mohuImageBlock)(UIImage *mohuImage);



//图片转动
- (void)zhuanhuozhebuzhuan;
@end
