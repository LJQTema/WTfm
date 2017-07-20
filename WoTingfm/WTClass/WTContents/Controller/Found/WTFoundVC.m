//
//  WTFoundVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/8.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTFoundVC.h"

#import "WTFoundCellView.h" //headerView样式

#import "WTFoundContentCell.h"  //contentCell样式
#import "WTFoundListCell.h"     //list样式


@interface WTFoundVC ()<UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate, WTFoundContetDelegate>{
    
    NSMutableArray  *dataFoundListArr;
    UIView  *HeaderView;    //轮播背景
}

@property (weak, nonatomic) IBOutlet UITableView *FoundTableView;
@property (strong,nonatomic) SDCycleScrollView *topPhotoBoworr;

@end

@implementation WTFoundVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    dataFoundListArr = [NSMutableArray arrayWithCapacity:0];

    
    _FoundTableView.dataSource = self;
    _FoundTableView.delegate = self;
    _FoundTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _FoundTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self CreatFouLunBo];  //轮播
    [self registerCell];
    [self loadDataFound];
}

- (void)CreatFouLunBo{
    
    HeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_Screen_Width, 160)];
    HeaderView.backgroundColor = [UIColor whiteColor];
    _FoundTableView.tableHeaderView = HeaderView;

    _topPhotoBoworr = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, K_Screen_Width, 160) delegate:self placeholderImage:nil];
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

-(void)registerCell
{
    
    UINib *ContentNib = [UINib nibWithNibName:@"WTFoundContentCell" bundle:nil];
    [_FoundTableView registerNib:ContentNib forCellReuseIdentifier:@"CellContentID"];
    
    UINib *ListNib = [UINib nibWithNibName:@"WTFoundListCell" bundle:nil];
    [_FoundTableView registerNib:ListNib forCellReuseIdentifier:@"CellListID"];
    
}

- (void)loadDataFound{
    
    NSString *login_Str = WoTing_ListeningSelection;
    
    
    [ZCBNetworking getWithUrl:login_Str refreshCache:YES success:^(id response) {
        
        NSDictionary *resultDict = (NSDictionary *)response;
        
        NSInteger  ReturnType = [[resultDict objectForKey:@"ret"] integerValue];
        if (ReturnType == 0) {
            
            [dataFoundListArr addObjectsFromArray:[resultDict objectForKey:@"data"]];
            [_FoundTableView reloadData];
        }
    } fail:^(NSError *error) {
        
        NSLog(@"%@", error);
    }];
}

#pragma mark - TableViewDelegate and DataSource

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    WTFoundCellView *FoundHeaderView = [[WTFoundCellView alloc] initWithFrame:CGRectMake(0, 0, K_Screen_Width, 54)];
    FoundHeaderView.ContentLab.text = dataFoundListArr[section][@"title"];
    FoundHeaderView.delegate = self;
    return FoundHeaderView;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
        
    return 54;

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.0000000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 || indexPath.section == 1) {
        
        return 158 + ((K_Screen_Width - 12 * 2 - 10 * 2 )/3.000 - 92);
    }else if(indexPath.section == 2){
        
        return 104;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return dataFoundListArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0 || section == 1) {
        
        return 1;
    }else if(section == 2){
        
        NSArray *Arr = dataFoundListArr[section][@"data"];
        return Arr.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 || indexPath.section == 1) {
        
        static NSString *cellID = @"CellContentID";
        
        WTFoundContentCell *cell = (WTFoundContentCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTFoundContentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        NSArray *contentArr = dataFoundListArr[indexPath.section][@"data"];

        if (contentArr.count == 1) {
            
            NSDictionary *contentDict = contentArr[0];
            [cell.leftImgV sd_setImageWithURL:[NSURL URLWithString:[NSString NULLToString:contentDict[@"logo_url"]]]];
            cell.leftLab.text = [NSString NULLToString:contentDict[@"title"]];
        }else if (contentArr.count == 2){
            
            NSDictionary *leftDict = contentArr[0];
            [cell.leftImgV sd_setImageWithURL:[NSURL URLWithString:[NSString NULLToString:leftDict[@"logo_url"]]]];
            cell.leftLab.text = [NSString NULLToString:leftDict[@"title"]];
            
            NSDictionary *contentDict = contentArr[1];
            [cell.CenterImgV sd_setImageWithURL:[NSURL URLWithString:[NSString NULLToString:contentDict[@"logo_url"]]]];
            cell.centerLab.text = [NSString NULLToString:contentDict[@"title"]];
        }else{
            
            NSDictionary *leftDict = contentArr[0];
            [cell.leftImgV sd_setImageWithURL:[NSURL URLWithString:[NSString NULLToString:leftDict[@"logo_url"]]]];
            cell.leftLab.text = [NSString NULLToString:leftDict[@"title"]];
            
            NSDictionary *contentDict = contentArr[1];
            [cell.CenterImgV sd_setImageWithURL:[NSURL URLWithString:[NSString NULLToString:contentDict[@"logo_url"]]]];
            cell.centerLab.text = [NSString NULLToString:contentDict[@"title"]];
            
            NSDictionary *rightDict = contentArr[2];
            [cell.rightImgV sd_setImageWithURL:[NSURL URLWithString:[NSString NULLToString:rightDict[@"logo_url"]]]];
            cell.rightLab.text = [NSString NULLToString:rightDict[@"title"]];
        }
        
        cell.delegate = self;   //cell代理
        
        return cell;
    }else if(indexPath.section == 2){
        
        static NSString *cellID = @"CellListID";
        
        WTFoundListCell *cell = (WTFoundListCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTFoundListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
       
        NSArray *ListArr = dataFoundListArr[indexPath.section][@"data"];
        NSDictionary *ListDict = ListArr[indexPath.row];
        
        [cell.ContentImgV sd_setImageWithURL:[NSURL URLWithString:[NSString NULLToString:ListDict[@"logo_url"]]]];
        cell.ContentLab.text = [NSString NULLToString:ListDict[@"title"]];
        cell.ContentPlayLab.text = [NSString NULLToString:ListDict[@"lastest_news"]];
        cell.ContentNumLab.text = [NSString stringWithFormat:@"%@次播放", [NSString NULLToString:[ListDict[@"play_count"] stringValue]]];
        
        return cell;

    }

    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - cell代理
- (void)ImgandLabClick:(ImgandLabType)ImgType{
    
    switch (ImgType) {
        case leftType://左边
            
            NSLog(@"左");
            break;
        case centerType://中间
            
            NSLog(@"中");
            break;
        case rightType://右边
            
            NSLog(@"右");
            break;
    }
}

#pragma mark - 轮播 - Delegate && DateSource
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    NSLog(@"%lu",index);
}

@end
