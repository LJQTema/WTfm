//
//  BoFangListView.h
//  WoTingfm
//
//  Created by jq on 2017/7/17.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BoFangListViewDelegate <NSObject>

-(void)WTBoFangListViewESCClick;

@end

@interface BoFangListView : UIView

@property (nonatomic, weak) id <BoFangListViewDelegate> delegate;

@end
