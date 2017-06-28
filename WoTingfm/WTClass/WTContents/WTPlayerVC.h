//
//  WTPlayerVC.h
//  WoTingfm
//
//  Created by jq on 2017/6/5.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTPlayerVC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *bofangliebiaoBtnName;

@property (weak, nonatomic) IBOutlet UIView *scrViewH;

@property (weak, nonatomic) IBOutlet UIButton *NextBtn;
@property (weak, nonatomic) IBOutlet UIButton *PlayBtn; //播放,暂停
@property (weak, nonatomic) IBOutlet UIButton *beforeBtn;

@property (weak, nonatomic) IBOutlet UISlider *wtSlider;

@property (weak, nonatomic) IBOutlet UILabel *NowLab;
@property (weak, nonatomic) IBOutlet UILabel *TotalLab;



@end
