//
//  WTMoreView.m
//  WoTingfm
//
//  Created by jq on 2017/6/13.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTMoreView.h"

#import "SKMainScrollView.h"

@interface WTMoreView()

@property (nonatomic, strong) SKMainScrollView  *topScroView; //上半部分
@property (nonatomic, strong) SKMainScrollView  *bottomScroView; //下半部分

@end

@implementation WTMoreView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self ContentView];
    }
    return self;
}

- (void)ContentView{
    
    //上Scroller
    
    _topScroView = [[SKMainScrollView alloc] initWithFrame:CGRectMake(0, 0, K_Screen_Width, 216/2)];
    
    if (K_Screen_Width > 330) {
        
        
        _topScroView.contentSize = CGSizeMake(K_Screen_Width + 30, 0);
    }else{
        
        _topScroView.contentSize = CGSizeMake(K_Screen_Width , 0);
    }
    _topScroView.pagingEnabled = YES;
    _topScroView.bounces = NO;
    _topScroView.contentOffset = CGPointMake(0, 0);
    [self addSubview:_topScroView];
    
    NSArray *titleTopArr = [NSArray arrayWithObjects:@"喜欢",@"下载",@"专辑",@"主播",@"举报", nil];
    for (int i =0; i < 5; i++) {
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*55 + 15, 20, 55, 55)];
        btn.tag = 100 + i;
        [btn setImage:[UIImage imageNamed:titleTopArr[i]] forState:UIControlStateNormal];
        [_topScroView addSubview:btn];
        
        UILabel *title = [[UILabel alloc] init];
        title.text = titleTopArr[i];
        [_topScroView addSubview:title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(20);
            make.top.mas_equalTo(6);
            make.centerX.equalTo(btn.mas_centerX);
        }];
        
    }
    
    
}



@end
