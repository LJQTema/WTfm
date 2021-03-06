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

@interface WTPersonInforVC ()<UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    

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


        
    }
    
}




- (void)PostHeaderImageView{
    
    [UIApplication sharedApplication].keyWindow.tintColor = [UIColor blackColor];
    
    if (IOS8) {
        
        [WKProgressHUD HYC__shangtiAlertWithController:self WithtitleArray:@[@"拍照",@"从相册选择"] WithBlock:^(UIAlertAction *AlertAction) {
           
            if ([AlertAction.title isEqualToString:@"拍照"]) {
                
                //相机
                UIImagePickerController *imagePickerC = [[UIImagePickerController alloc] init];
                imagePickerC.delegate = self;
                imagePickerC.allowsEditing = YES;
                imagePickerC.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:imagePickerC animated:YES completion:^{
                    
                }];
            }else if ([AlertAction.title isEqualToString:@"从相册选择"]){
                
                //相册
                UIImagePickerController *iamgePickerC = [[UIImagePickerController alloc] init];
                iamgePickerC.delegate = self;
                iamgePickerC.allowsEditing = YES;
                iamgePickerC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:iamgePickerC animated:YES completion:^{
                    
                }];
            }
         
        }];
        
    }
    
}

//选择照片完成之后的代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    //info是所选择照片的信息
    
    //    UIImagePickerControllerEditedImage//编辑过的图片
    //    UIImagePickerControllerOriginalImage//原图
    
    
    NSLog(@"%@",info);
    //刚才已经看了info中的键值对，可以从info中取出一个UIImage对象，将取出的对象赋给按钮的image
    //@"UIImagePickerControllerReferenceURL" : @"assets-library://asset/asset.JPG?id=106E99A1-4F6A-45A2-B320-B0AD4A8E8473&ext=JPG"
    UIImage *resultImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    
    
    // imageData = UIImageJPEGRepresentation(resultImage, 0.5);
    
    //上传头像

    
    //使用模态返回到软件界面
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
