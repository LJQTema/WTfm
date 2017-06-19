//
//  WTPlayerVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/5.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTPlayerVC.h"
#import "JQMusicTool.h"
#import "RollView.h"
#import "SnailPopupController.h"
#import "SnailSheetView.h"
#import "WTMoreView.h"
#import "WTModel.h"

#import "WTContentsVC.h"
#import "WTContentsDetailVC.h"  //各种详情页


@interface WTPlayerVC ()<RollViewDelegate,  SnailSheetViewConfigDelegate, SnailSheetViewDelegate>{
    
    NSMutableArray *dataBFArray;
    
    UIView  *blackView;
    WTMoreView  *MoreView;  //更多
}


@property (weak, nonatomic) IBOutlet UIImageView *BackgroupImgV;


@property (nonatomic, strong) RollView *rollView;

//@property (nonatomic, strong) UIImageView   *BackgroundImgV;    //背景图
@property (nonatomic, strong) UIImageView   *HeaderImgV;        //转图
@property (nonatomic, strong) UIButton      *BoFangBtn;        //播放,暂停

@property(assign, nonatomic)NSInteger musicIndex;//当前播放音乐索引
@property(strong,nonatomic) NSMutableArray *musicsArr;//音乐数据

//定时器
@property(strong,nonatomic) NSTimer *timer;

@end

@implementation WTPlayerVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];//白色
    
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];//黑色
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _musicIndex = 0;
    dataBFArray = [NSMutableArray arrayWithCapacity:0];
    _musicsArr = [NSMutableArray arrayWithCapacity:0];
    _bofangliebiaoBtnName.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.navigationController.navigationBar.hidden = YES;
    
    
//    [self creatPicRollView];
    [self loadData];            //网络请求
    [self creatContentView];    //搭建部分UI
}

- (void)creatContentView{
    
    [self.wtSlider addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.wtSlider addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
//    [self.wtSlider setThumbImage:[UIImage imageNamed:@"Oval.png"] forState:UIControlStateNormal];
//    [self.wtSlider setThumbImage:[UIImage imageNamed:@"Oval.png"] forState:UIControlStateHighlighted];
    
}

- (void)loadData{
    
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:@"CCEEA4E534B44FA78FC48034961908E9",@"IMEI", @"414.000000*736.000000",@"ScreenSize",@"1",@"PCDType", @"Simulator", @"MobileClass",@"0",@"GPS-longitude", @"0",@"GPS-latitude",@"0",@"PageType",@"10",@"PageSize",  nil];
    
    NSString *login_Str = WoTing_MainPage;
    
    [ZCBNetworking postWithUrl:login_Str refreshCache:YES params:parameters success:^(id response) {
        
        NSDictionary *resultDict = (NSDictionary *)response;
        
        NSString  *ReturnType = [resultDict objectForKey:@"ReturnType"];
        if ([ReturnType isEqualToString:@"1001"]) {
            
            NSDictionary *ResultList = resultDict[@"ResultList"];
            
            
            [dataBFArray removeAllObjects];
            
            
            for (NSDictionary *dict in ResultList[@"List"]) {
                
                if (![dict isKindOfClass:[NSNull class]]) {
                    
                    [dataBFArray addObject:dict];
                }

                WTModel *model = [WTModel yy_modelWithJSON:dict];
                if (model) {
                    
                    [_musicsArr addObject:model];
                }
            }

            [self playMusic];
            [self creatPicRollView];
            
        }else if ([ReturnType isEqualToString:@"T"]){
            
            [self creatPicRollView];
        }else{
            
            [self creatPicRollView];
        }
        
    } fail:^(NSError *error) {
        
        NSLog(@"%@", error);
        
    }];
    
}


-(void)creatPicRollView{
    
    NSInteger viewHight = 0;                //
    NSInteger Distance = 50;                //
    NSInteger labelHight = 0;               //label的下移距离
    
    
    if (WWWWW == 414) {
        
        viewHight = 44;
        Distance = 44;
        labelHight = 10;
        //iphone 7P
        
        NSLog(@"7P");
    }else if (WWWWW == 375){
        
        viewHight = 30;
        Distance = 40;
        labelHight = 0;
       // NSLog(@"7");
        
        
    }else{
        viewHight = 0;
        Distance = 35;
        labelHight = -10;
     //   NSLog(@"5");
        
        
    }
    
    //图片直径
    float imagezhijing = HHHHH -79-217-49.0 - viewHight * 2;
    
    
    
    //NSLog(@"%f",imagezhijing);
    
    self.rollView = [[RollView alloc] initWithFrame:CGRectMake(0, viewHight, WWWWW, imagezhijing ) withDistanceForScroll:
                     //(WWWWW - imagezhijing)/2.0000
                     Distance
                     
                                            withGap:
                     //20.f
                     //100.0f
                     
                     WWWWW - imagezhijing - Distance * 2
                     //0
                      withLabelHight:labelHight];
    
    /**全屏宽滑动 视图之间间隙,  将 Distance 设置为 -12.0f*/
    // self.rollView = [[RollView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 150) withDistanceForScroll: -12.0f withGap:8.0f];
    // self.rollView.backgroundColor = [UIColor blackColor];
    
    self.rollView.delegate = self;
    
    [self.scrViewH addSubview:self.rollView];
    
    NSArray *arr = @[@{@"imageH":@"timg-10",@"labelUP":@"第一个",@"labelDown":@"超超哥哥"},
                     @{@"imageH":@"timg-9",@"labelUP":@"第二个",@"labelDown":@"还是超超哥哥"},
                     @{@"imageH":@"timg-8",@"labelUP":@"第三个",@"labelDown":@"居然还是超超哥哥"}
                     
                     ];

    
    [self.rollView rollView:arr];

    
    //背景
    
    _BackgroupImgV.image = [UIImage imageNamed:arr[0][@"imageH"]];
    //高斯模糊
    __weak __typeof(self)weakSelf = self;
    [self.rollView setMohuImageBlock:^(UIImage *mohuImage) {
        
        weakSelf.BackgroupImgV.image = mohuImage;
        
    }];
    
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    
    toolbar.barStyle = UIBarStyleBlack;
    
    [_BackgroupImgV addSubview:toolbar];
    
    
    [toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];
    
}


#pragma mark - 滚动视图协议
-(void)didSelectPicWithIndexPath:(NSInteger)index{
    
    
    
    
    
    if (index != -1) {
        
        NSLog(@"%ld", (long)index);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - set方法填充更新页面播放器逻辑
-(void)setPlayingMusic:(WTModel *)playingMusic{
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(JQNext) name:BDCloudMediaPlayerPlaybackStateDidChangeNotification object:nil];
    
}

#pragma mark - 创建一个播放器
-(void)playMusic{
    
    if (self.musicsArr.count == 0) {
        
    }else{
        //初始化一个 "播放器"
        [[JQMusicTool sharedJQMusicTool] prepareToPlayWithMusic:self.musicsArr[self.musicIndex]];
        
        //更改 “播放器工具条” 的数据
        self.playingMusic = self.musicsArr[self.musicIndex];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(JQNext) name:BDCloudMediaPlayerPlaybackDidFinishNotification object:nil];
    }
    
    
}
- (void)JQNext{
    
    [self Next:nil];
}

#pragma mark - 播放/暂停按钮
- (IBAction)BoFangPlayBtnClick:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    
    if (btn.selected) {//播放
        
        [[JQMusicTool sharedJQMusicTool] pause];
        btn.selected = NO;
    }else{//暂停
        
        [[JQMusicTool sharedJQMusicTool] play];
        btn.selected = YES;
    }
}

#pragma mark - 下一首
- (IBAction)Next:(id)sender {
    
    if (self.musicIndex == self.musicsArr.count - 1) {//最后条
        self.musicIndex = 0;
    }else{
        self.musicIndex ++;
    }
    
    [self playMusic];
    [[JQMusicTool sharedJQMusicTool] play];
}

#pragma mark - 上一首
- (IBAction)Before:(id)sender {
    
    if (self.musicIndex == 0) {//第一首
        self.musicIndex = self.musicsArr.count - 1;
    }else{
        self.musicIndex --;
    }
    
    [self playMusic];
    [[JQMusicTool sharedJQMusicTool] play];
}

#pragma mark -- progress事件
//当手指弹起的时候触发
-(void)touchUp:(UISlider *)slider{

    [[JQMusicTool sharedJQMusicTool] play];
    _PlayBtn.selected = YES;
    
}
//当值发生变化一直触发
-(void)valueChange:(UISlider *)slider{
    [[JQMusicTool sharedJQMusicTool] pause];
    
    
    //    self.player.currentItem.currentTime.value
    NSTimeInterval currentTime = slider.value;
    
    //seekToTime 跳到指定的播放时间
    [[JQMusicTool sharedJQMusicTool].BDplayer seek:currentTime];

    _PlayBtn.selected = YES;

}

#pragma mark - 开启定时器
- (void)startTimer{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(turnPicture) userInfo:nil repeats:YES];
}
#pragma mark - 停止定时器
- (void)stopTimer{
    
    [_timer invalidate];
    
    _timer = nil;
}

#pragma mark - 图片旋转
- (void)turnPicture{
    
    _HeaderImgV.transform = CGAffineTransformRotate(_HeaderImgV.transform,M_PI_4 * .01);
    
}


#pragma mark - 更多列表点击
- (IBAction)MoreBtnClick:(id)sender {

    CGRect rect = CGRectMake(100, 100, K_Screen_Width, 260);
    SnailSheetView *sheet = [[SnailSheetView alloc] initWithFrame:rect configDelegate:self];
    sheet.models = [self sheetModels];
    [sheet autoresizingFlexibleHeight];
    sheet.delegate = self;
    sheet.didClickFooter = ^(SnailSheetView * _Nonnull sheetView) {
        [self.sl_popupController dismiss];
    };
    
    self.sl_popupController = [SnailPopupController new];
    self.sl_popupController.layoutType = PopupLayoutTypeBottom;
    [self.sl_popupController presentContentView:sheet];

}
#pragma mark - 更多delegate
#pragma mark - SnailSheetViewConfig

- (SnailSheetViewLayout *)layoutOfItemInSheetView:(SnailSheetView *)sheetView {
    
    return [SnailSheetViewLayout layoutWithItemSize:CGSizeMake(80, 100)
                                      itemEdgeInset:UIEdgeInsetsMake(15, 20, 20, 20)
                                        itemSpacing:15
                                     imageViewWidth:80
                                         subSpacing:10];
}

#pragma mark - SnailSheetViewDelegate

- (void)sheetView:(SnailSheetView *)sheetView didSelectItemAtSection:(NSInteger)section index:(NSInteger)index andBtn:(nonnull UIButton *)button{
    
    SnailSheetItemModel *model = [self sheetModels][section][index];
    
    if (section == 0 && index == 0) {
        
        button.selected ^= 1;
    }else if (section == 1 ){
        
        if (index == 1 || index == 2) {
            
            WTContentsDetailVC  *wtConDVC = [[WTContentsDetailVC alloc] init];
            wtConDVC.LabText = model.text;
            [self.navigationController pushViewController:wtConDVC animated:YES];
            [self.sl_popupController dismiss];
        }
    }
    
}

#pragma mark - 发现页点击
- (IBAction)FoundBtnClick:(id)sender {
    
    
    [self presentViewController:
     
     [[UINavigationController alloc]initWithRootViewController:
      
      [[WTContentsVC alloc] init]]
                       
                       animated:YES completion:nil];
    
}

#pragma mark - 个人中心点击
- (IBAction)MainBtnClick:(id)sender {
}


#pragma mark - 播放列表点击
- (IBAction)BoFangListBtnClick:(id)sender {
    
    
    [_rollView zhuanhuozhebuzhuan];
        
}

#define titleKey @"title"
#define imgNameKey @"imageName"

- (NSArray *)sheetModels {
    
    NSArray *arr1 = @[@{titleKey   : @"喜欢",
                        imgNameKey : @"music_play_icon_like_n"},
                      
                      @{titleKey   : @"专辑",
                        imgNameKey : @"music_play_icon_albums"},
                      
                      @{titleKey   : @"主播",
                        imgNameKey : @"music_play_icon_anchor"},
                      
                      @{titleKey   : @"举报",
                        imgNameKey : @"music_play_icon_report"},];
    
    NSArray *arr2 = @[@{titleKey   : @"下载",
                        imgNameKey : @"music_play_icon_download"},
                      
                      @{titleKey   : @"播放历史",
                        imgNameKey : @"music_play_icon_ago"},
                      
                      @{titleKey   : @"我的订阅",
                        imgNameKey : @"music_play_icon_subscription"},
                      
                      @{titleKey   : @"本地音频",
                        imgNameKey : @"music_play_icon_local"},];
    
    NSMutableArray *array1 = [NSMutableArray array];
    for (NSDictionary *dict in arr1) {
        NSString *text = [dict objectForKey:titleKey];
        NSString *imgName = [dict objectForKey:imgNameKey];
        [array1 addObject:[SnailSheetItemModel modelWithText:text
                                                       image:[UIImage imageNamed:imgName]]];
    }
    
    NSMutableArray *array2 = [NSMutableArray array];
    for (NSDictionary *dict in arr2) {
        NSString *text = [dict objectForKey:titleKey];
        NSString *imgName = [dict objectForKey:imgNameKey];
        [array2 addObject:[SnailSheetItemModel modelWithText:text
                                                       image:[UIImage imageNamed:imgName]]];
    }
    
    return [NSMutableArray arrayWithObjects:array1, array2, nil];
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
