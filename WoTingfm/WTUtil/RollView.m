//
//  RollView.m
//  WoTingfm
//
//  Created by hyc on 2017/6/7.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "RollView.h"

@interface RollView ()<UIScrollViewDelegate>{
    
    BOOL ZHUanYESorNO;
    
    NSMutableArray *_dataImageArray;
    
}

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *rollDataArr;   // 图片数据

@property (nonatomic, assign) float halfGap;   // 图片间距的一半

@property (nonatomic,assign)float labelHight;

@property (nonatomic,assign)float angle;

@property (nonatomic,strong)UIImageView *linshiImageView;//转动的imageView

@property (nonatomic,assign)NSInteger dangqiancurIndex;



@end



@implementation RollView

- (instancetype)initWithFrame:(CGRect)frame withDistanceForScroll:(float)distance withGap:(float)gap withLabelHight:(float)LabelHight
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _angle = 0;
        ZHUanYESorNO = NO;
        _dangqiancurIndex = 0;
        _dataImageArray = [NSMutableArray arrayWithCapacity:0];
        self.labelHight = LabelHight;
        self.halfGap = gap / 2;
        
        /** 设置 UIScrollView */
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(distance, 0, self.frame.size.width - 2 * distance, self.frame.size.height)];
        //self.scrollView.backgroundColor = [UIColor redColor];
        [self addSubview:self.scrollView];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        
        self.scrollView.clipsToBounds = NO;
        
        /** 添加手势 */
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [self.scrollView addGestureRecognizer:tap];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        
        /** 数据初始化 */
        self.rollDataArr = [NSArray array];
        
    }
    
    
    return self;
}

#pragma mark - 视图数据
-(void)rollView:(NSArray *)dataArr{
    float imagezhijing = self.frame.size.height;
    self.rollDataArr = dataArr;
    [_dataImageArray removeAllObjects];
    
    //循环创建添加轮播图片, 前后各添加一张
    for (int i = 0; i < self.rollDataArr.count + 2; i++) {
        
        for (UIView *underView in self.scrollView.subviews) {
            
            if (underView.tag == 400 + i) {
                [underView removeFromSuperview];
            }
        }
        
        UIImageView *picImageView = [[UIImageView alloc] init];
        picImageView.userInteractionEnabled = YES;
        picImageView.tag = 400 + i ;
        
        /**  说明
         *   1. 设置完 ScrollView的width, 那么分页的宽也为 width.
         *   2. 图片宽为a 间距为 gap, 那么 图片应该在ScrollView上居中, 距离ScrollView左右间距为halfGap.
         *   与 ScrollView的width关系为 width = halfGap + a + halfGap.
         *   3. distance : Scroll距离 底层视图View两侧距离.  
         *   假设 要露出上下页内容大小为 m ,   distance = m + halfGap
         *
         *  图片位置对应关系 :
         *  0 ->  2 * halfGap ;                         20+
         *  1 ->  3 * halfGap + a ;
         *  2 ->  5 * halfGap + 2 * a ;
         .
         .
         *  i   -> (2 * i +1) *  halfGap + 2 *(width - 2 * halfGap )
         */
        
        
        picImageView.frame = CGRectMake
        (
         (2 * i + 1) * self.halfGap + i * (self.scrollView.frame.size.width - 2 * self.halfGap),
         //(self.frame.size.width - imagezhijing )/2.00,
         0, 
                                        
                                        //(self.scrollView.frame.size.width - 2 * self.halfGap),
                                        imagezhijing,
                                        
                                        imagezhijing);
        
        //设置图片
        if (i == 0) {
            
            
            
            picImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.rollDataArr[self.rollDataArr.count - 1][@"imageH"]]];
            
            picImageView.layer.cornerRadius = picImageView.frame.size.height/2.000;
            picImageView.layer.masksToBounds = YES;
            picImageView.layer.borderWidth = 1;
            picImageView.layer.borderColor = [UIColor colorWithRed:103/255.0 green:90/255.0 blue:242/255.0 alpha:1].CGColor;
            
            [_dataImageArray addObject:picImageView];
            
            //  _________________________________________________________________________________________________HYC_________________________________________________________________________________ 
            //名字标题
            //设置歌词
            
            UILabel *geciLabel = [[UILabel alloc]initWithFrame:CGRectMake(picImageView.frame.origin.x, picImageView.frame.origin.y + imagezhijing + 20 + _labelHight, picImageView.frame.size.width, 30)];
            
            geciLabel.text = self.rollDataArr[self.rollDataArr.count - 1][@"labelUP"];
            
            geciLabel.backgroundColor = [UIColor clearColor];
            
            [self.scrollView addSubview:geciLabel];
            
            UILabel *yanchangLabel = [[UILabel alloc]initWithFrame:CGRectMake(picImageView.frame.origin.x, picImageView.frame.origin.y + imagezhijing + 60 + _labelHight, picImageView.frame.size.width, 30)];
            
            yanchangLabel.backgroundColor = [UIColor clearColor];
            
            yanchangLabel.text = self.rollDataArr[self.rollDataArr.count - 1][@"labelDown"];
            
            geciLabel.textColor = [UIColor whiteColor];
            yanchangLabel.textColor = [UIColor whiteColor];
            geciLabel.textAlignment = NSTextAlignmentCenter;
            yanchangLabel.textAlignment = NSTextAlignmentCenter;
            geciLabel.font = [UIFont systemFontOfSize:17];
            yanchangLabel.font = [UIFont systemFontOfSize:13];
            
            [self.scrollView addSubview:yanchangLabel];
            
        }else if (i == self.rollDataArr.count+1) {
            
            picImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.rollDataArr[0][@"imageH"]]];
            
            picImageView.layer.cornerRadius = picImageView.frame.size.height/2.000;
            picImageView.layer.masksToBounds = YES;
            picImageView.layer.borderWidth = 1;
            picImageView.layer.borderColor = [UIColor colorWithRed:103/255.0 green:90/255.0 blue:242/255.0 alpha:1].CGColor;
            
            [_dataImageArray addObject:picImageView];
            
            
            
            //  _________________________________________________________________________________________________HYC_________________________________________________________________________________ 
            //名字标题
            //设置歌词
            
            UILabel *geciLabel = [[UILabel alloc]initWithFrame:CGRectMake(picImageView.frame.origin.x, picImageView.frame.origin.y + imagezhijing + 20 + _labelHight, picImageView.frame.size.width, 30)];
            
            geciLabel.text = self.rollDataArr[0][@"labelUP"];
            
            geciLabel.backgroundColor = [UIColor clearColor];
            
            [self.scrollView addSubview:geciLabel];
            
            UILabel *yanchangLabel = [[UILabel alloc]initWithFrame:CGRectMake(picImageView.frame.origin.x, picImageView.frame.origin.y + imagezhijing + 60 + _labelHight, picImageView.frame.size.width, 30)];
            
            yanchangLabel.backgroundColor = [UIColor clearColor];
            
            yanchangLabel.text = self.rollDataArr[0][@"labelDown"];
            
            geciLabel.textColor = [UIColor whiteColor];
            yanchangLabel.textColor = [UIColor whiteColor];
            geciLabel.textAlignment = NSTextAlignmentCenter;
            yanchangLabel.textAlignment = NSTextAlignmentCenter;
            geciLabel.font = [UIFont systemFontOfSize:17];
            yanchangLabel.font = [UIFont systemFontOfSize:13];
            
            [self.scrollView addSubview:yanchangLabel];
            
            
        }else {
            
            picImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.rollDataArr[i - 1][@"imageH"]]];
            
            picImageView.layer.cornerRadius = picImageView.frame.size.height/2.000;
            picImageView.layer.masksToBounds = YES;
            picImageView.layer.borderWidth = 1;
            picImageView.layer.borderColor = [UIColor colorWithRed:103/255.0 green:90/255.0 blue:242/255.0 alpha:1].CGColor;
            
            [_dataImageArray addObject:picImageView];
            
            
            //  _________________________________________________________________________________________________HYC_________________________________________________________________________________ 
            //名字标题
            //设置歌词
            
            UILabel *geciLabel = [[UILabel alloc]initWithFrame:CGRectMake(picImageView.frame.origin.x, picImageView.frame.origin.y + imagezhijing + 20 + _labelHight, picImageView.frame.size.width, 30)];
            
            geciLabel.text = self.rollDataArr[i - 1][@"labelUP"];
            
            geciLabel.backgroundColor = [UIColor clearColor];
            
            [self.scrollView addSubview:geciLabel];
            
            UILabel *yanchangLabel = [[UILabel alloc]initWithFrame:CGRectMake(picImageView.frame.origin.x, picImageView.frame.origin.y + imagezhijing + 60 + _labelHight, picImageView.frame.size.width, 30)];
            
            yanchangLabel.backgroundColor = [UIColor clearColor];
            
            yanchangLabel.text = self.rollDataArr[i - 1][@"labelDown"];
            
            geciLabel.textColor = [UIColor whiteColor];
            yanchangLabel.textColor = [UIColor whiteColor];
            geciLabel.textAlignment = NSTextAlignmentCenter;
            yanchangLabel.textAlignment = NSTextAlignmentCenter;
            geciLabel.font = [UIFont systemFontOfSize:17];
            yanchangLabel.font = [UIFont systemFontOfSize:13];
            
            [self.scrollView addSubview:yanchangLabel];
            
        }
        
        [self.scrollView addSubview:picImageView];
        
        
        
        
        
        
        
        
        
    }
    //设置轮播图当前的显示区域
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * (self.rollDataArr.count + 2), 0);
    
    
    
    
    
}

#pragma mark - UIScrollViewDelegate 方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger curIndex = scrollView.contentOffset.x  / self.scrollView.frame.size.width;
    
    if (curIndex == self.rollDataArr.count + 1) {
        
        scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    }else if (curIndex == 0){
        
        scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width * self.rollDataArr.count, 0);
    }
    
    NSLog(@"滑动到了第%ld页",(long)curIndex);
    _angle = 0;
    _linshiImageView = _dataImageArray[curIndex];
    if (self.mohuImageBlock) {
        UIImageView *imageView = _dataImageArray[curIndex];
        self.mohuImageBlock(imageView.image);
        
    }
    
    
    
    NSLog(@"%@",_dataImageArray);
    
    
}

#pragma mark - 轻拍手势的方法
-(void)tapAction:(UITapGestureRecognizer *)tap{
    
    if ([self.rollDataArr isKindOfClass:[NSArray class]] && (self.rollDataArr.count > 0)) {
        
        [_delegate didSelectPicWithIndexPath:(self.scrollView.contentOffset.x / self.scrollView.frame.size.width)];
    }else{
        
        [_delegate didSelectPicWithIndexPath:-1];
    }
    
}




#pragma mark --转动图片

-(void) startAnimation
{  
    
    if (_linshiImageView  == nil) {
        
        _linshiImageView = _dataImageArray[1];
        
    }
    
    
    [UIView beginAnimations:nil context:nil];  
    [UIView setAnimationDuration:0.00001];  
    [UIView setAnimationDelegate:self];  
    [UIView setAnimationDidStopSelector:@selector(endAnimation)]; 
    
    
    _linshiImageView.transform = CGAffineTransformMakeRotation(_angle * (M_PI / 180.0f));
    //self.imageV.transform = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));  
    [UIView commitAnimations];
    
}  

-(void)endAnimation  
{  
    
    _angle += 1;
    
    if (_angle == 360) {
        
        _angle = 0;
        
    }
    
    
    
    
    if (ZHUanYESorNO) {
//        
        [self startAnimation];
//        
//        
//        
    }
    
    
}

- (void)zhuanhuozhebuzhuan{
    
    if (ZHUanYESorNO) {
        
        ZHUanYESorNO = NO;
        
    }else{
        
        ZHUanYESorNO = YES;
        
        
        
        [self startAnimation];
        
    }
    
}


@end
