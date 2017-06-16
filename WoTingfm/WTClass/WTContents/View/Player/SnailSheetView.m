//
//  SnailSheetView.m
//  SnailPopupControllerDemo
//
//  Created by zhanghao on 2017/4/3.
//  Copyright © 2017年 zhanghao. All rights reserved.
//

#import "SnailSheetView.h"
#import "SnailSheetCell.h"

@interface SnailSheetView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SnailSheetViewLayout *sl_layout;
@property (nonatomic, weak, nullable) id <SnailSheetViewConfigDelegate> config;

@end

@implementation SnailSheetView

- (SnailSheetViewLayout *)sl_layout {
    if (!_sl_layout) {
        SnailSheetViewLayout *layout = [[SnailSheetViewLayout alloc] init];
        if ([self.config respondsToSelector:@selector(layoutOfItemInSheetView:)]) {
             layout = [self.config layoutOfItemInSheetView:self];
        }
        _sl_layout = layout;
    }
    return _sl_layout;
}

- (instancetype)initWithFrame:(CGRect)frame configDelegate:(id<SnailSheetViewConfigDelegate>)configDelegate {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.config = configDelegate;
        
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.delaysContentTouches = NO;
        _tableView.bounces = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
        
        
        _footerLabel = [self labelWithSize:CGSizeMake(frame.size.width, SHEETVIEW_FOOTER_HEIGHT)
                                      text:@"取消"
                                 textColor:[UIColor blackColor]
                                      font:[UIFont systemFontOfSize:16]
                                    action:@selector(footerClicked)];
        _footerLabel.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = _footerLabel;
    }
    return self;
}

- (UILabel *)labelWithSize:(CGSize)size text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font action:(nullable SEL)action {
    UILabel *label = [[UILabel alloc] init];
    label.size = size;
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = NSTextAlignmentCenter;
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:action]];
    return label;
}

- (void)headerClicked {
    if (nil != self.didClickHeader) {
        self.didClickHeader(self);
    }
}

- (void)footerClicked {
    if (nil != self.didClickFooter) {
        self.didClickFooter(self);
    }
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.sectionHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SnailSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sl_sheetCell"];
    if (!cell) {
        SnailSheetViewAppearance *sl_appearance = [[SnailSheetViewAppearance alloc] init];
        if ([self.config respondsToSelector:@selector(appearanceOfItemInSheetView:)]) {
            sl_appearance = [self.config appearanceOfItemInSheetView:self];
        }
        cell = [[SnailSheetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sl_sheetCell" layout:self.sl_layout appearance:sl_appearance];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    id object = [_models objectAtIndex:indexPath.row];
    if ([object isKindOfClass:[NSArray class]]) {
        cell.arrays = (NSArray *)object;
    }
    cell.itemClicked = ^(NSInteger index , UIButton *Button) {
        
//        if (indexPath.row == 0 && index == 0) {
//            
//            Button.selected ^= 1;
//        }
        
        if ([_delegate respondsToSelector:@selector(sheetView:didSelectItemAtSection:index:andBtn:)]) {
            [_delegate sheetView:self didSelectItemAtSection:indexPath.row index:index andBtn:Button];
        }
        
    };
    
    if (indexPath.row == 1) {
        
        UIImageView *IMGV = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.sectionHeight - 0.5, K_Screen_Width, 0.5)];
        IMGV.backgroundColor = HYC__COLOR_HEX(0xCCCCCD);
        [cell addSubview:IMGV];
    }
    
    return cell;
}

- (void)setModels:(NSArray *)models {
    _models = models;
    [_tableView reloadData];
}

- (CGFloat)sectionHeight {
    return self.sl_layout.itemEdgeInset.top + self.sl_layout.itemEdgeInset.bottom + self.sl_layout.itemSize.height;
}

- (void)autoresizingFlexibleHeight {
    CGFloat height = self.sectionHeight * _models.count;
    if (!CGRectEqualToRect(_headerLabel.frame, CGRectZero)) {
        height += SHEETVIEW_HEADER_HEIGHT;
    }
    if (!CGRectEqualToRect(CGRectZero, _footerLabel.frame)) {
        height += SHEETVIEW_FOOTER_HEIGHT;
    }
    self.height = _tableView.height = height;
}

@end
