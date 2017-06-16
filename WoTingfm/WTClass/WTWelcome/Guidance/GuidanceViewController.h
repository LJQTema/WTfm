//
//  GuidanceViewController.h
//  AXM_Demo
//
//  Created by hyc on 16/1/19.
//  Copyright (c) 2016年 hyc. All rights reserved.
//
//实现引导页
#import <UIKit/UIKit.h>
typedef void(^MyBlock)(void);
@interface GuidanceViewController : UIViewController

//- (instancetype)initWithImagesArr:(NSArray *)imagesArr andBlock:(void(^)(void))block;

- (instancetype)initWithImagesArr:(NSArray *)imagesArr andBlock:(MyBlock)block;
//imagesArr 是引导页的图片名  block 是最后一张引导页显示结束 到AppDelegate 修改根控制器用的

@end
