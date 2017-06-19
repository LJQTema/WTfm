//
//  WTRadioVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/8.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTRadioVC.h"

#import "WTFoundCellView.h" //headerView样式

#import "WTFoundListCell.h" //cell
#import "WTRadioHeaCell.h"  //本地, 国家, 电台

//轮播
//#import "CarouselSubview.h"


@interface WTRadioVC ()<UITableViewDataSource, UITableViewDelegate, SDCycleScrollViewDelegate>{
    
    UIView  *HeaderView;    //轮播背景
}
@property (strong,nonatomic) SDCycleScrollView *topPhotoBoworr;

@end

@implementation WTRadioVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _RadioTableV.delegate = self;
    _RadioTableV.dataSource = self;
    _RadioTableV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _RadioTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self CreatLunBo];  //轮播
    [self registerRadioContentCell];
}

- (void)CreatLunBo{
    
    HeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_Screen_Width, 126)];
    HeaderView.backgroundColor = [UIColor whiteColor];
    _RadioTableV.tableHeaderView = HeaderView;
    
    _topPhotoBoworr = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 6, K_Screen_Width, 120) delegate:self placeholderImage:nil];
    _topPhotoBoworr.boworrWidth = K_Screen_Width - 30;
    _topPhotoBoworr.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _topPhotoBoworr.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    _topPhotoBoworr.currentPageDotImage = [UIImage imageNamed:@"pageControlDot.png"];
    _topPhotoBoworr.pageDotImage = [UIImage imageNamed:@"pageControlCurrentDot.png"];
    
    _topPhotoBoworr.cellSpace = 2;
    _topPhotoBoworr.autoScrollTimeInterval = 3;
    _topPhotoBoworr.imageURLStringsGroup = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493210044049&di=ac402c2ce8259c98e5e4ea1b7aac4cac&imgtype=0&src=http%3A%2F%2Fimg2.3lian.com%2F2014%2Ff4%2F209%2Fd%2F97.jpg",@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1493199772&di=66346cd79eed9c8cb4ec03c3734d0b31&src=http://img15.3lian.com/2015/f2/128/d/123.jpg",@"http://wmtp.net/wp-content/uploads/2017/04/0420_sweet945_1.jpeg",@"http://wmtp.net/wp-content/uploads/2017/04/0407_shouhui_1.jpeg"];
    [HeaderView addSubview:_topPhotoBoworr];
}

- (void)registerRadioContentCell{
    
    UINib *ListNib = [UINib nibWithNibName:@"WTFoundListCell" bundle:nil];
    [_RadioTableV registerNib:ListNib forCellReuseIdentifier:@"CellRadioID"];
    
    UINib *ConNib = [UINib nibWithNibName:@"WTRadioHeaCell" bundle:nil];
    [_RadioTableV registerNib:ConNib forCellReuseIdentifier:@"CellRaHeID"];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return nil;
    }else{
    
        WTFoundCellView *FoundHeaderView = [[WTFoundCellView alloc] initWithFrame:CGRectMake(0, 0, K_Screen_Width, 45)];
        FoundHeaderView.TuBiaoImgV.hidden = YES;
        FoundHeaderView.ContentLab.text = @"热门电台";
        FoundHeaderView.delegate = self;
        return FoundHeaderView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 0;
        
    }else{
    
        return 45;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.0000000001;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 1;
    }else{
    
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return 117;
    }else{
        
        return 84;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        static NSString *cellID = @"CellRaHeID";
        
        WTRadioHeaCell *cell = (WTRadioHeaCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            
            cell = [[WTRadioHeaCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        cell.delegate = self;
        
        return cell;
        
    }else{
    
        static NSString *cellID = @"CellRadioID";
        
        WTFoundListCell *cell = (WTFoundListCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            
            cell = [[WTFoundListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }

        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
