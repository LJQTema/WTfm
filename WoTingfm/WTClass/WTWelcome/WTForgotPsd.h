//
//  WTForgotPsd.h
//  WoTingfm
//
//  Created by jq on 2017/6/6.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTForgotPsd : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *phoneNumImageView;
@property (weak, nonatomic) IBOutlet UIImageView *yanZhengMaIamgeView;
@property (weak, nonatomic) IBOutlet UIImageView *PsdNumImageView;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumTF;
@property (weak, nonatomic) IBOutlet UITextField *YanZhengMaTF;
@property (weak, nonatomic) IBOutlet UITextField *PsdNumTF;

@property (weak, nonatomic) IBOutlet UIButton *YanZMBtn;
@property (weak, nonatomic) IBOutlet UIButton *SureBtn;
- (IBAction)SureBtnClick:(id)sender;
- (IBAction)getYanZhengMa:(id)sender;

//- (IBAction)PsdNumChangeClick:(id)sender;
- (IBAction)backBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *ContentLab;


/**
 Type = 0: 注册   Type = 1:忘记密码
 */
@property (nonatomic, assign) NSInteger Type;



@end
