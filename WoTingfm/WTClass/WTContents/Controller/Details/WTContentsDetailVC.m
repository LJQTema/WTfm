//
//  WTContentsDetailVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/15.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTContentsDetailVC.h"

#import "WTFoundListCell.h" //cell

#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

#define GaoDe_APPKEY @"bcf03ca94c8896b82c2559f5cc99f42f"

@interface WTContentsDetailVC ()<UITableViewDataSource, UITableViewDelegate, AMapLocationManagerDelegate>

@property (nonatomic, strong) AMapLocationManager *locationManager;
@property (nonatomic, copy) NSString    *cityStr;

@end

@implementation WTContentsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _ContentLab.text = _LabText;
    _cityStr = @"未获取定位信息";
    
    _ContentTableV.delegate = self;
    _ContentTableV.dataSource = self;
    _ContentTableV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _ContentTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (_ContetType == 1) {
        
        [self GetlocationManager];  //获取定位
    }

    
    [self registerContentCell];
}

- (void)GetlocationManager{
    
    [AMapServices sharedServices].apiKey = GaoDe_APPKEY;        //高德地图
    
    self.locationManager = [[AMapLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    // 带逆地理信息的一次定位（返回坐标和地址信息）
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    //   定位超时时间，最低2s，此处设置为2s
    self.locationManager.locationTimeout =2;
    //   逆地理请求超时时间，最低2s，此处设置为2s
    self.locationManager.reGeocodeTimeout = 2;
    
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
        if (error)
        {
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            
            if (error.code == AMapLocationErrorLocateFailed)
            {
                return;
            }
        }
        
        NSLog(@"location:%@", location);
        
        if (regeocode)
        {
            NSLog(@"reGeocode:%@", regeocode.city);
            _cityStr = regeocode.city;
            [_ContentTableV reloadData];
        }
    }];
    
}

- (void)registerContentCell{
    
    UINib *ListNib = [UINib nibWithNibName:@"WTFoundListCell" bundle:nil];
    [_ContentTableV registerNib:ListNib forCellReuseIdentifier:@"CellID"];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (_ContetType == 1) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
        view.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imgvbottom = [[UIImageView alloc] initWithFrame:CGRectMake(0, 43.5, K_Screen_Width, 0.5)];
        imgvbottom.backgroundColor = HYC__COLOR_HEX(0xEFEFEF);
        [view addSubview:imgvbottom];
        
        UIButton *btnImgV = [[UIButton alloc] initWithFrame:CGRectMake(12, 10, 24, 24)];
        [btnImgV setImage:[UIImage imageNamed:@"Station_icon_local_small.png"] forState:UIControlStateNormal];
        [view addSubview:btnImgV];
        
        UILabel  *cityLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 14, 100, 16)];
        cityLab.font = [UIFont systemFontOfSize:16];
        cityLab.textColor = HYC__COLOR_HEX(0xfd8548);
        cityLab.text = _cityStr;
        [view addSubview:cityLab];

        return view;
    }else{
        
        
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (_ContetType == 1) {
        
        return 44;
    }else{
        
        return 0;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    return 84;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *cellID = @"CellID";
    
    WTFoundListCell *cell = (WTFoundListCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        
        cell = [[WTFoundListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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

- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
