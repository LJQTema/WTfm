//
//  WTRadioHeaCell.h
//  WoTingfm
//
//  Created by jq on 2017/6/16.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTRadioHeaCell : UITableViewCell

@property (nonatomic, strong) UIButton *BenDiBtn;
@property (nonatomic, strong) UIButton *GuoJiaBtn;
@property (nonatomic, strong) UIButton *ShengShiBtn;

@property (nonatomic, strong) UILabel *BenDiLab;
@property (nonatomic, strong) UILabel *GuoJiaLab;
@property (nonatomic, strong) UILabel *ShengShiLab;

@property (nonatomic, weak) UIViewController    *delegate;

@property (weak, nonatomic) IBOutlet UIView *RadioView;


@end
