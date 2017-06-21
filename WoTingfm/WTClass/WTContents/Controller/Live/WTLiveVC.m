//
//  WTLiveVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/8.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTLiveVC.h"

#import "WTLiveCollVCell.h"         //左cell
#import "WTLiveCollVRightCell.h"    //右cell


@interface WTLiveVC ()<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout, SDCycleScrollViewDelegate>

@property (strong,nonatomic) SDCycleScrollView *topPhotoBoworr;

@property (weak, nonatomic) IBOutlet UICollectionView *LiveCollectionView;

@end

@implementation WTLiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _LiveCollectionView.delegate = self;
    _LiveCollectionView.dataSource = self;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(K_Screen_Width/2 , 178 + ((K_Screen_Width - 12*3)/2 - 142))];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    [_LiveCollectionView setCollectionViewLayout:flowLayout];

    [self registerLiveContentCell];
}

- (void)registerLiveContentCell{
    
    UINib *ListNib = [UINib nibWithNibName:@"WTLiveCollVCell" bundle:nil];
    [_LiveCollectionView registerNib:ListNib forCellWithReuseIdentifier:@"CellLiveID"];
    
    UINib *ListRightNib = [UINib nibWithNibName:@"WTLiveCollVRightCell" bundle:nil];
    [_LiveCollectionView registerNib:ListRightNib forCellWithReuseIdentifier:@"CellLiveRightID"];
    
    [_LiveCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderID"];
    
}

//这个方法是返回 Header的大小 size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    //前面是宽度后面是高度
    CGSize size={K_Screen_Width, 126 + 55};

    return size;
}

//这个也是最重要的方法 获取Header的 方法。
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderID" forIndexPath:indexPath];
    headerView.backgroundColor = [UIColor whiteColor];
    
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
    [headerView addSubview:_topPhotoBoworr];
    
    UILabel *TitleLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 25 + 126, 100, 15)];
    TitleLab.text = @"小编推荐";
    TitleLab.font = [UIFont systemFontOfSize:14];
    [headerView addSubview:TitleLab];
    
    return headerView;
}


//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 6;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        
        WTLiveCollVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellLiveID" forIndexPath:indexPath];
        
        return cell;
    }else if (indexPath.row % 2 == 0){  //偶数列
        
        WTLiveCollVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellLiveID" forIndexPath:indexPath];
        
        return cell;
        
    }else{  //奇数列
        
        WTLiveCollVRightCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellLiveRightID" forIndexPath:indexPath];
        
        return cell;
        
    }
    
    
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
