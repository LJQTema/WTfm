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
#import "BoFangListView.h"      //播放列表

#import "WTContentsVC.h"
#import "WTContentsDetailVC.h"  //各种详情页

#import "WTAlbumVC.h"           //专辑页
#import "WTReportVC.h"          //举报页
#import "WTDownLoadVC.h"        //下载页

@interface WTPlayerVC ()<RollViewDelegate,  SnailSheetViewConfigDelegate, SnailSheetViewDelegate, BoFangListViewDelegate>{
    
    NSMutableArray *dataBFArray;
    
    UIView  *blackView;
    WTMoreView  *MoreView;  //更多
    
    BoFangListView *boFangList; //播放列表
}


@property (weak, nonatomic) IBOutlet UIImageView *BackgroupImgV;


@property (nonatomic, strong) RollView *rollView;

//@property (nonatomic, strong) UIImageView   *BackgroundImgV;    //背景图
@property (nonatomic, strong) UIImageView   *HeaderImgV;        //转图


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
    
    self.navigationController.navigationBar.hidden = YES;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(JQNext:) name:BDCloudMediaPlayerPlaybackDidFinishNotification object:nil];
    
    
    [self creatPicRollView];
    [self loadData];            //网络请求
    [self creatContentView];    //搭建部分UI
}

- (void)creatContentView{
    
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
    
    NSArray *arr = @[@{@"imageH":@"timg-10",@"labelUP":@"第一个",@"labelDown":@"我站在桥上看风景"},
                     @{@"imageH":@"timg-9",@"labelUP":@"第二个",@"labelDown":@"我站在桥上看风景"},
                     @{@"imageH":@"timg-8",@"labelUP":@"第三个",@"labelDown":@"我站在桥上看风景"}
                     
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
    
    //时间
    NSString *ContentTimes = playingMusic.ContentTimes;
    NSTimeInterval time=[ContentTimes doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time/1000.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mm:ss"];
    NSString *currentStr = [dateFormatter stringFromDate: detaildate];
    
 
    self.NowLab.text = @"00:00";
    self.TotalLab.text = currentStr;
    self.wtSlider.value = 0;
    [self.wtSlider addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.wtSlider addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    
}


#pragma mark - 创建一个播放器
-(void)playMusic{
    
    if (self.musicsArr.count == 0) {
        
    }else{
        //初始化一个 "播放器"
        [[JQMusicTool sharedJQMusicTool] prepareToPlayWithMusic:self.musicsArr[self.musicIndex]];
        
        //更改 “播放器工具条” 的数据
        self.playingMusic = self.musicsArr[self.musicIndex];
        

    }
    
    
}
#pragma mark - 播放完毕-自动播放下一首
- (void)JQNext:(NSNotification*)notification{
    
    NSNumber* reasonNumber = notification.userInfo[BDCloudMediaPlayerPlaybackDidFinishReasonUserInfoKey];
    BDCloudMediaPlayerFinishReason reason = (BDCloudMediaPlayerFinishReason)reasonNumber.integerValue;
    switch (reason) {
        case BDCloudMediaPlayerFinishReasonEnd:         //正常结束
            NSLog(@"player finish with reason: play to end time");
            
            [self Next:nil];
            break;
        case BDCloudMediaPlayerFinishReasonError:       //出现错误
            NSLog(@"player finished with reason: error");
            break;
        case BDCloudMediaPlayerFinishReasonUser:        //关于用户, 暂时用不到
            NSLog(@"player finished with reason: stopped by user");
            break;
        default:
            break;
    }
}

#pragma mark - 播放/暂停按钮
- (IBAction)BoFangPlayBtnClick:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    
    if (btn.selected) {//播放
        
        [[JQMusicTool sharedJQMusicTool] pause];
        [self stopTimer];
        btn.selected = NO;
    }else{//暂停
        
        [[JQMusicTool sharedJQMusicTool] play];
        [self startTimer];
        btn.selected = YES;
    }
}

#pragma mark - 下一首
- (IBAction)Next:(id)sender {
    
    [self stopTimer];
    if (self.musicIndex == self.musicsArr.count - 1) {//最后条
        self.musicIndex = 0;
    }else{
        self.musicIndex ++;
    }
    
    _PlayBtn.selected = YES;

    [[JQMusicTool sharedJQMusicTool] ToChangeMusic:self.musicsArr[self.musicIndex]];
    
    [self startTimer];

}

#pragma mark - 上一首
- (IBAction)Before:(id)sender {
    
    [self stopTimer];
    if (self.musicIndex == 0) {//第一首
        self.musicIndex = self.musicsArr.count - 1;
    }else{
        self.musicIndex --;
    }
    
    _PlayBtn.selected = YES;
    
    [[JQMusicTool sharedJQMusicTool] ToChangeMusic:self.musicsArr[self.musicIndex]];
    
    [self startTimer];

}

#pragma mark -- progress事件
//当手指弹起的时候触发
-(void)touchUp:(UISlider *)slider{
    
    [self startTimer];

    [[JQMusicTool sharedJQMusicTool] play];
    _PlayBtn.selected = YES;
    
}
//当值发生变化一直触发
-(void)valueChange:(UISlider *)slider{
    
    [self stopTimer];
    [[JQMusicTool sharedJQMusicTool] pause];
    
    self.NowLab.text = [self formatTimeInterval:[JQMusicTool sharedJQMusicTool].BDplayer.currentPlaybackTime];
    
    //seekToTime 跳到指定的播放时间
    [[JQMusicTool sharedJQMusicTool].BDplayer seek:[JQMusicTool sharedJQMusicTool].BDplayer.duration *slider.value];

    _PlayBtn.selected = NO;

}

#pragma mark - 开启定时器
- (void)startTimer{
    
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                      target:self
                                                    selector:@selector(turnPicture)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}
#pragma mark - 停止定时器
- (void)stopTimer{
    
    if (self.timer.isValid) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

#pragma mark - 内容变化
- (void)turnPicture{
    
    self.wtSlider.value = [JQMusicTool sharedJQMusicTool].BDplayer.currentPlaybackTime/[JQMusicTool sharedJQMusicTool].BDplayer.duration;
    self.NowLab.text = [self formatTimeInterval:[JQMusicTool sharedJQMusicTool].BDplayer.currentPlaybackTime];
    self.TotalLab.text = [self formatTimeInterval:[JQMusicTool sharedJQMusicTool].BDplayer.duration];
}


#pragma mark - 更多列表点击
- (IBAction)MoreBtnClick:(id)sender {

    CGRect rect = CGRectMake(100, 100, K_Screen_Width - 20, 260);
    SnailSheetView *sheet = [[SnailSheetView alloc] initWithFrame:rect configDelegate:self];
    sheet.layer.masksToBounds = YES;
    sheet.layer.cornerRadius = 10;
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
    
    return [SnailSheetViewLayout layoutWithItemSize:CGSizeMake(54, 76)
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
        }else if (index == 3){
            
            WTDownLoadVC *wtdown = [[WTDownLoadVC alloc] init];
            [self.navigationController pushViewController:wtdown animated:YES];
            [self.sl_popupController dismiss];
        }
    }else if (section == 0){
        
        if (index == 3) {   //举报
            
            WTReportVC  *wtReportVC = [[WTReportVC alloc] init];
            
            [self.navigationController pushViewController:wtReportVC animated:YES];
            [self.sl_popupController dismiss];
        }else if (index == 1) { //专辑
            
            WTAlbumVC *wtalbumVC = [[WTAlbumVC alloc] init];
            
            [self.navigationController pushViewController:wtalbumVC animated:YES];
            [self.sl_popupController dismiss];
        }
        
    }
    
}

#pragma mark - 发现页点击
- (IBAction)FoundBtnClick:(id)sender {
    
    
//    [self presentViewController:
//     
//     [[UINavigationController alloc]initWithRootViewController:
//      
//      [[WTContentsVC alloc] init]]
//                       
//                       animated:YES completion:nil];
    
}

#pragma mark - 退出播放器点击
- (IBAction)MainBtnClick:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];

}


#pragma mark - 播放列表点击
- (IBAction)BoFangListBtnClick:(id)sender {
    
    
//    [_rollView zhuanhuozhebuzhuan];
    
    blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_Screen_Width, K_Screen_Height)];
    blackView.userInteractionEnabled = YES;
    UITapGestureRecognizer  *blackTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(WTBoFangListViewESCClick)];
    [blackView addGestureRecognizer:blackTap];
    blackView.backgroundColor = HYC__COLOR_HEX_A(0x000000, 0.55);
    [self.view addSubview:blackView];
    
    boFangList = [[BoFangListView alloc] initWithFrame:CGRectMake(0, K_Screen_Height, K_Screen_Width, 500)];
    boFangList.delegate = self;
    [self.view addSubview:boFangList];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        boFangList.frame = CGRectMake(0, K_Screen_Height - 500, K_Screen_Width, 500);
    }];
   

}
#pragma mark - 播放列表取消
- (void)WTBoFangListViewESCClick{
    
    [blackView removeFromSuperview];
    [UIView animateWithDuration:0.3 animations:^{
        
        boFangList.frame = CGRectMake(0, K_Screen_Height, K_Screen_Width, 500);
        
    } completion:^(BOOL finished) {
        
        [boFangList removeFromSuperview];
    }];

}


#define titleKey @"title"
#define imgNameKey @"imageName"

- (NSArray *)sheetModels {
    
    NSArray *arr1 = @[@{titleKey   : @"专辑",
                        imgNameKey : @"icon_view-album_n"},
                      
                      @{titleKey   : @"主播",
                        imgNameKey : @"icon_view-archer_n"},
                      
                      @{titleKey   : @"意见反馈",
                        imgNameKey : @"icon_report_n"},];
    
    NSArray *arr2 = @[@{titleKey   : @"微信好友",
                        imgNameKey : @"icon_wechat_n"},
                      
                      @{titleKey   : @"朋友圈",
                        imgNameKey : @"icon_friends_n"},
                      
                      @{titleKey   : @"微博",
                        imgNameKey : @"icon_vebo_n"},
                      
                      @{titleKey   : @"QQ",
                        imgNameKey : @"icon_qq_n"},];
    
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

#pragma mark - 播放时长变化
- (NSString*)formatTimeInterval:(NSTimeInterval)interval {
    NSUInteger totalMinutes = (NSUInteger)interval / 60;
    NSUInteger leftSeconds = (NSUInteger)interval % 60;
    
    NSUInteger totalHours = totalMinutes / 60;
    NSUInteger leftMinutes = totalMinutes % 60;
    
    NSMutableString* string = [NSMutableString string];
    if (totalHours != 0) {
        [string appendFormat:@"%lu:", (unsigned long)totalHours];
    }
    
    if (totalMinutes != 0) {
        [string appendFormat:@"%02lu:", (unsigned long)leftMinutes];
    } else {
        [string appendString:@"00:"];
    }
    
    [string appendFormat:@"%02lu", (unsigned long)leftSeconds];
    
    return string;
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
