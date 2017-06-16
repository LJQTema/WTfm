//
//  fenleiCollectionCell.h
//  WoTingfm
//
//  Created by hyc on 2017/6/14.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fenleiCollectionCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imageViewH;

@property (weak, nonatomic) IBOutlet UILabel *labelName;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewcontHight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageUPCon;



@end
