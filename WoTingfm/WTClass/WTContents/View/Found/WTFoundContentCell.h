//
//  WTFoundContentCell.h
//  WoTingfm
//
//  Created by jq on 2017/6/9.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    
    leftType,           //点击左边
    centerType,         //点击中间
    rightType           //点击右边
    
}ImgandLabType;

@protocol WTFoundContetDelegate <NSObject>

- (void)ImgandLabClick:(ImgandLabType)ImgType;

@end

@interface WTFoundContentCell : UITableViewCell

@property(nonatomic,weak)id<WTFoundContetDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *leftImgV;
@property (weak, nonatomic) IBOutlet UIImageView *CenterImgV;
@property (weak, nonatomic) IBOutlet UIImageView *rightImgV;

@property (weak, nonatomic) IBOutlet UILabel *leftLab;
@property (weak, nonatomic) IBOutlet UILabel *centerLab;
@property (weak, nonatomic) IBOutlet UILabel *rightLab;

@end
