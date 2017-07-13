//
//  WTPersonInforVC.m
//  WoTingfm
//
//  Created by jq on 2017/7/11.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTPersonInforVC.h"

#import "WTPersonHeaderCell.h"
#import "WTPersonSignCell.h"
#import "WTPersonCell.h"

#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)

@interface WTPersonInforVC ()<UITableViewDelegate, UITableViewDataSource>{
    
    UIView              *blackView;     //黑背景

}

@property (weak, nonatomic) IBOutlet UITableView *PerSonTabV;

@end

@implementation WTPersonInforVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _PerSonTabV.delegate = self;
    _PerSonTabV.dataSource = self;
    _PerSonTabV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _PerSonTabV.separatorStyle = UITableViewCellSeparatorStyleNone;
    _PerSonTabV.backgroundColor = HYC__COLOR_HEX(0xEFEFEF);
    
    [self reageterPresonCell]; //注册
}

- (void)reageterPresonCell{
    
    UINib *PHeaderCellNib = [UINib nibWithNibName:@"WTPersonHeaderCell" bundle:nil];
    [_PerSonTabV registerNib:PHeaderCellNib forCellReuseIdentifier:@"PHeaderID"];
    
    UINib *PersonCellNib = [UINib nibWithNibName:@"WTPersonCell" bundle:nil];
    [_PerSonTabV registerNib:PersonCellNib forCellReuseIdentifier:@"PersonID"];
    
    UINib *PersonSignCellNib = [UINib nibWithNibName:@"WTPersonSignCell" bundle:nil];
    [_PerSonTabV registerNib:PersonSignCellNib forCellReuseIdentifier:@"PersonSignID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 96;
    }else if (indexPath.row == 6){
        
        return 74;
    }else{
        
        return 50;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        static NSString *cellID = @"PHeaderID";
        
        WTPersonHeaderCell *cell = (WTPersonHeaderCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTPersonHeaderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }

        cell.contentImgV.image = [UIImage imageNamed:@"timg-8"];
        cell.contentImgV.userInteractionEnabled = YES;
        UITapGestureRecognizer *imgTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PostHeaderImageView)];
        [cell.contentImgV addGestureRecognizer:imgTap];
        
        
        return cell;
    }else if (indexPath.row == 6){
        
        static NSString *cellID = @"PersonID";
        
        WTPersonCell *cell = (WTPersonCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTPersonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        
        
        return cell;
    }else{
        
        static NSString *cellID = @"PersonSignID";
        
        WTPersonSignCell *cell = (WTPersonSignCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTPersonSignCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        if (indexPath.row == 1) {
            
            cell.contentLab.text = @"昵称";
            
        }else if (indexPath.row == 2){
            
            cell.contentLab.text = @"听号";
            
        }else if (indexPath.row == 3){
            
            cell.contentLab.text = @"性别";
            
        }else if (indexPath.row == 4){
            
            cell.contentLab.text = @"年龄";
            
        }else{
            
            cell.contentLab.text = @"地区";
            
        }
        
        
        return cell;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 3) {
        
        [self CreatYuYinView];  //创建语音搜索View

        
    }
    
}

#pragma mark - 创建语音搜索View
- (void)CreatYuYinView{
    
    blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_Screen_Width, K_Screen_Height)];
    blackView.backgroundColor = [UIColor clearColor];
    blackView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapBlack = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(DeleteYuYinView)];
    [blackView addGestureRecognizer:tapBlack];
    [self.view addSubview:blackView];
    
    
//    
//    
//    YuyinView = [[WTSearchView alloc] initWithFrame:CGRectMake(0, K_Screen_Height, K_Screen_Width, 240)];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Viewtap)];
//    [YuyinView addGestureRecognizer:tap];
//    [blackView addSubview:YuyinView];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        
        blackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//        YuyinView.frame = CGRectMake(0, K_Screen_Height - 240, K_Screen_Width, 240);
        
    }];
}
- (void)Viewtap{
}

#pragma mark - 销毁语音搜索View
- (void)DeleteYuYinView{
    
    [UIView animateWithDuration:0.3 animations:^{
        
//        YuyinView.frame = CGRectMake(0, K_Screen_Height, K_Screen_Width, 240);
        
        blackView.backgroundColor = [UIColor clearColor];
        
        
    }];
    
    [self performSelector:@selector(removeView) withObject:nil afterDelay:0.3];
}

- (void)removeView{
    
    [blackView removeFromSuperview];
}



- (void)PostHeaderImageView{
    
    [UIApplication sharedApplication].keyWindow.tintColor = [UIColor blackColor];
    
    if (IOS8) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //相机
                UIImagePickerController *imagePickerC = [[UIImagePickerController alloc] init];
                imagePickerC.delegate = self;
                imagePickerC.allowsEditing = YES;
                imagePickerC.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:imagePickerC animated:YES completion:^{
                    
                }];
            }];
            
            [alertController addAction:defaultAction];
        }
        
        UIAlertAction *defaultAction1 = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            //相册
            UIImagePickerController *iamgePickerC = [[UIImagePickerController alloc] init];
            iamgePickerC.delegate = self;
            iamgePickerC.allowsEditing = YES;
            iamgePickerC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:iamgePickerC animated:YES completion:^{
                
            }];
            
        }];
        
        UIAlertAction *cancelA = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertController addAction:cancelA];
        [alertController addAction:defaultAction1];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
