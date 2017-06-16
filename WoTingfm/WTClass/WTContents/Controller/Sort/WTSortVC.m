//
//  WTSortVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/8.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTSortVC.h"
#import "fenleiCollectionCell.h"
@interface WTSortVC ()<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>{
    NSMutableDictionary *_imageNameAndURLDDDict;
    NSMutableArray *_dataArray;
    
    
}

@end

@implementation WTSortVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _imageNameAndURLDDDict = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"imageNameAndURLDD" ofType:@"plist"]];
    
    _dataArray = [NSMutableArray arrayWithObjects:
  
                  @[
                    @"音乐",
                    @"小说故事",
                    @"新闻",
                    @"相声小品",
                    
                    @"脱口秀",
                    @"两性",
                    @"亲子",
                    @"综艺娱乐",
                    
                    @"搞笑",
                    @"电视电影",
                    @"戏曲艺术",
                    @"电台丛林",
                    ],
                  @[
                    @"学习",
                    @"外语进阶",
                    @"公开课堂",
                    @"名牌大家",
                    
                    @"地理",
                    @"艺术人文",
                    @"戏曲评书",
                    @"广播剧院",
                    
                    @"商业财经",
                    @"科技动态",
                    @"汽车天下",
                    @"体育",
                    
                    @"旅行",
                    @"女性时尚",
                    @"生活百科",
                    @"健康养生",
                    
                    @"星座运势",
                    @"游戏动漫",
                    @"方言播报",
                    @"亚文化区",
                    
                    @"军事",
                    @"实事法政",
                    @"宗教",
                    @"心理推理",
                    
                    ]
                  
                  
                  , nil];
    
    
    //---->--->-->->伦理分割线----<---<--<-<//
    self.collerViewH.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.view.backgroundColor = [UIColor yellowColor];
    self.collerViewH.delegate = self;
    self.collerViewH.dataSource = self;
     
    
    
    
    
    
    
    //---->--->-->->伦理分割线----<---<--<-<//
    
    [self registerCell];
    
    
    
    
    
    
}

//注册自定制网格视图
-(void)registerCell
{
    UINib *nib=[UINib nibWithNibName:@"fenleiCollectionCell" bundle:nil];
    [self.collerViewH registerNib:nib forCellWithReuseIdentifier:@"fenleiCollectionCell"];
    
    
    
    
    
    //注册headerView Nib的view需要继承UICollectionReusableView
    //        [self.cllViewUp registerNib:[UINib nibWithNibName:@"OneHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"OneHeaderView"];
    
    //[self.self.collerViewH registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"OneHeaderView"];
    [self.collerViewH registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderID"];
    // 如果有class来注册这个头部或尾部视图时一定要用代码的方式去设置下这个头部或尾部的尺寸
}



//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _dataArray.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        
        NSArray *arrayOne = _dataArray[0];
        NSArray *arrayTwo = _dataArray[1];
    
    if (section) {
        
        return arrayTwo.count;
        
    }else{
        
        return arrayOne.count;
        
    }
        
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
//    NSLog(@"%@",kind);
//    
//    
//    NSArray *ArrayGroup = _dataArray[indexPath.section];
//    
//    OneHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"OneHeaderView" forIndexPath:indexPath];
//    
//    
//    
//    headerView.backgroundColor = [UIColor colorWithRed:237/255.0 green:238/255.0 blue:239/255.0 alpha:1];
//    
//    headerView.userInteractionEnabled = YES;
//    
//    _labelheader = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
//    
//    
//    
//    _labelheader.backgroundColor = headerView.backgroundColor;
//    
//    _labelheader.text = [ArrayGroup lastObject];
//    
//    [headerView addSubview:_labelheader];
    
    // 如果当前想要的是头部视图
    // UICollectionElementKindSectionHeader是一个const修饰的字符串常量,所以可以直接使用==比较
//    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderID" forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, WWWWW ,40)];
    if (indexPath.section) {
        
        label.text = @"其他分类";
        
    }else{
        
        label.text = @"常用分类";
        
    }
    
    label.font = [UIFont systemFontOfSize:14];
    
    [headerView addSubview:label];
    
        return headerView;
    
    
    
    
    
    
    
    
    
}


//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    //    CGSize zeroSize = {0,0};
    
    
    //前面是宽度后面是高度
    CGSize size={WWWWW,40};
    
    //    if (section == 0) {
    //        return zeroSize;
    //    }else{
    return size;
    
    //    }
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    fenleiCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"fenleiCollectionCell" forIndexPath:indexPath];
    
    
    
    //网络获取cellImage
    //[cell.imageVIewH sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"517.png"]];
    
    
    
    cell.labelName.text = _dataArray[indexPath.section][indexPath.row];
    
    cell.labelName.font = [UIFont systemFontOfSize:12];
    [cell.imageViewH setImage:[UIImage imageNamed:
                              
                              _imageNameAndURLDDDict
                              
                              [_dataArray[indexPath.section][indexPath.row]
                
                               ]]];
    
    
    //cell加边框
//    cell.layer.borderColor=[UIColor groupTableViewBackgroundColor].CGColor;
//    cell.layer.borderWidth=0.3;
    
    return cell;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return CGSizeMake(WWWWW/4.0 , WWWWW/4.0 );
    
    
    
    
    
    
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *classNameStr;
//    
//    if (indexPath.section == 0) {
//        
//        if (indexPath.row == 0) {
//            
//            classNameStr = @"OnedingdanfahuoVC";
//            
//        }else if (indexPath.row == 1){
//            
//            classNameStr = @"xiaoshouzhongxinShangpinVC";
//            
//        }else if (indexPath.row == 2){
//            
//            classNameStr = @"OneJingxiaoshangVC";
//            
//        }else if (indexPath.row == 3){
//            
//            classNameStr = @"OneShoukuanVC";
//            
//        }else if (indexPath.row == 4){
//            
//            classNameStr = @"OneJingxiaoshangXiaoshouShujuVC";
//            
//        }else if (indexPath.row == 5){
//            
//            classNameStr = @"xinxihuizongVC";
//            
//        }
//        
//    }else if (indexPath.section == 1) {
//        
//        if (indexPath.row == 0) {
//            
//            classNameStr = @"caigouzhongxinDingdanVC";
//            
//        }else if (indexPath.row == 1) {
//            
//            classNameStr = @"caigouzhongxinWuliaoVC";
//            
//        }else if (indexPath.row == 2) {
//            
//            classNameStr = @"caigouzhongxinGongyingshangVC";
//            
//        }else if (indexPath.row == 3) {
//            
//            xinxihuizongVC *xinxihuizong = [[xinxihuizongVC alloc]initWithSuperViewName:@"采购中心"];
//            
//            xinxihuizong.hidesBottomBarWhenPushed = YES;
//            
//            [self.navigationController pushViewController:xinxihuizong animated:YES];
//            
//        }
//        
//    }
//    Class c = NSClassFromString(classNameStr);
//    
//    UIViewController *classNameVC = [[c alloc]init];
//    
//    classNameVC.hidesBottomBarWhenPushed = YES;
//    
//    [self.navigationController pushViewController:classNameVC animated:YES];
//    
//    
    
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
    
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    
//    NSString *reuseIdentifier;
//    if ([kind isEqualToString: UICollectionElementKindSectionFooter ]){
//        
//    }else{
//        reuseIdentifier = @"heaerCollectionReusableView";
//    }
//    
//    UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
//    
//    UILabel *label = (UILabel *)[view viewWithTag:1];
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
//        label.text = [NSString stringWithFormat:@"这是header:%ld",(long)indexPath.section];
//    }
//    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
//        view.backgroundColor = [UIColor lightGrayColor];
//        label.text = [NSString stringWithFormat:@"这是footer:%ld",(long)indexPath.section];
//    }
//    return view;
//}


////返回头headerView的大小
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    
//    CGSize zeroSize = {0,0};
//    
//    
//    //前面是宽度后面是高度
//    CGSize size={10,10};
//    
//    if (section == 0) {
//        return zeroSize;
//    }else{
//        return size;
//
//    }
//}
//
//每个section中不同的行之间的行间距


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
