//
//  WTLiveVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/8.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTLiveVC.h"



@interface WTLiveVC ()<UITableViewDataSource, UITableViewDelegate, SDCycleScrollViewDelegate>{
    
    UIView  *HeaderView;    //轮播背景
}

@property (strong,nonatomic) SDCycleScrollView *topPhotoBoworr;

@property (weak, nonatomic) IBOutlet UITableView *LiveTableV;

@end

@implementation WTLiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _LiveTableV.delegate = self;
    _LiveTableV.dataSource = self;
    _LiveTableV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _LiveTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self CreatLiveLunBo];  //轮播
    [self registerLiveContentCell];
}

- (void)CreatLiveLunBo{
    
    HeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_Screen_Width, 126)];
    HeaderView.backgroundColor = [UIColor whiteColor];
    _LiveTableV.tableHeaderView = HeaderView;
    
    _topPhotoBoworr = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 6, K_Screen_Width, 120) delegate:self placeholderImage:nil];
    _topPhotoBoworr.boworrWidth = K_Screen_Width - 30;
    _topPhotoBoworr.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _topPhotoBoworr.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    _topPhotoBoworr.currentPageDotImage = [UIImage imageNamed:@"pageControlDot.png"];
    _topPhotoBoworr.pageDotImage = [UIImage imageNamed:@"pageControlCurrentDot.png"];
    
    _topPhotoBoworr.cellSpace = 2;
    _topPhotoBoworr.autoScrollTimeInterval = 3;
    _topPhotoBoworr.imageURLStringsGroup = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493210044049&di=ac402c2ce8259c98e5e4ea1b7aac4cac&imgtype=0&src=http%3A%2F%2Fimg2.3lian.com%2F2014%2Ff4%2F209%2Fd%2F97.jpg",@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1493199772&di=66346cd79eed9c8cb4ec03c3734d0b31&src=http://img15.3lian.com/2015/f2/128/d/123.jpg"];
    //,@"http://wmtp.net/wp-content/uploads/2017/04/0420_sweet945_1.jpeg",@"http://wmtp.net/wp-content/uploads/2017/04/0407_shouhui_1.jpeg"
    [HeaderView addSubview:_topPhotoBoworr];
}

- (void)registerLiveContentCell{
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 轮播 - Delegate && DateSource
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    NSLog(@"%lu",index);
}


@end
