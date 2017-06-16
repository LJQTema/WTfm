//
//  GuidanceViewController.m
//  AXM_Demo
//
//  Created by hyc on 16/1/19.
//  Copyright (c) 2016年 hyc. All rights reserved.
//

#import "GuidanceViewController.h"
#import "Stotage.h"
@interface GuidanceViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)NSMutableArray *imageArr;
@property (nonatomic,copy)MyBlock block;
//显示结束回调
@end

@implementation GuidanceViewController

- (instancetype)initWithImagesArr:(NSArray *)imagesArr andBlock:(MyBlock)block{
    if (self = [super init]) {
        //接收 从外面传进来的图片 然后block
        //block 闭包  记录一个代码片段
        _imageArr = [NSMutableArray arrayWithArray:imagesArr];
        _block = block;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createScrollView];
    // Do any additional setup after loading the view.
}
#pragma mark - createScrollView
- (void)createScrollView{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WWWWW, HHHHH)];
    
    for (int i = 0; i < _imageArr.count; i++) {
        NSString *imageName = _imageArr[i];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(WWWWW * i, 0, WWWWW, HHHHH);
        [_scrollView addSubview:imageView];
    }
    //确定滚动的范围
    _scrollView.contentSize = CGSizeMake(WWWWW * _imageArr.count, HHHHH);
    //弹簧
    _scrollView.bounces = NO;
    //隐藏横屏滑动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    //开启翻页模式
    _scrollView.pagingEnabled = YES;
    
    _scrollView.delegate = self;
    
    [self.view addSubview:_scrollView];
    //添加Button 开始
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(WWWWW * _imageArr.count - WWWWW,0, WWWWW, HHHHH)];
   // [btn setImage:[UIImage imageNamed:@"yindaoyeBtn.png"] forState:UIControlStateNormal];
   // btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(enterApp:) forControlEvents:UIControlEventTouchUpInside];
    
    [_scrollView addSubview:btn];
}
#pragma mark - ButtonClick
- (void)enterApp:(UIButton *)button{
        [Stotage setGuidanceKey:YES];
    
//       BOOL hyc = [Stotage setGuidanceKey:YES];
//    NSLog(@"%d",hyc);
    //回调bloc
    self.block();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
