//
//  BoFangListCell.h
//  WoTingfm
//
//  Created by jq on 2017/7/17.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoFangListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *ContentLab;

@property (weak, nonatomic) IBOutlet UILabel *AlbumLab;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UIButton *DeleteBtn;

@end
