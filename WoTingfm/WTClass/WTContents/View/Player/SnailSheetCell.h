//
//  SnailSheetCell.h
//  SnailPopupControllerDemo
//
//  Created by zhanghao on 2017/4/3.
//  Copyright © 2017年 zhanghao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SnailSheetViewLayout, SnailSheetViewAppearance, SnailSheetItemModel;

@interface SnailSheetCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                       layout:(SnailSheetViewLayout *)layout
                   appearance:(SnailSheetViewAppearance *)appearance;

@property (nonatomic, copy) void (^itemClicked)(NSInteger index, UIButton *Button);

@property (nonatomic, strong) NSArray *arrays;

@end

@interface SnailSheetCollectionCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UIButton *imageView;
@property (nonatomic, strong, readonly) UILabel *textLabel;

//设置图片
- (void)setLayout:(SnailSheetViewLayout *)layout appearance:(SnailSheetViewAppearance *)appearance model:(SnailSheetItemModel *)model;

//自己加的, 设置选中图片
- (void)setLayoutSelected:(SnailSheetViewLayout *)layout appearance:(SnailSheetViewAppearance *)appearance model:(SnailSheetItemModel *)model intger:(NSInteger )index;
@end
