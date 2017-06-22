//
//  WTReportVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/21.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTReportVC.h"

#import "WTReportCell.h"    //举报cell
#import "WTReportTextCell.h"    //输入文字cell

@interface WTReportVC ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *ReportTableV;


@property (nonatomic, strong) NSMutableArray    *dataReportArr;

@property (nonatomic, assign) NSInteger     typeNum;    //选中标识

@end

@implementation WTReportVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataReportArr = [NSMutableArray arrayWithCapacity:0];
    _typeNum = 0;
    
    _ReportTableV.dataSource = self;
    _ReportTableV.delegate = self;
    _ReportTableV.backgroundColor = HYC__COLOR_HEX(0xF7F7F7);
    _ReportTableV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _ReportTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self registerReportCell];
    
    NSArray *arr = @[@"广告",@"色情低俗",@"谣言、欺诈",@"政治敏感",@"侵权"];
    [_dataReportArr addObjectsFromArray:arr];
}

- (void)registerReportCell{
    
    UINib *ContentNib = [UINib nibWithNibName:@"WTReportCell" bundle:nil];
    [_ReportTableV registerNib:ContentNib forCellReuseIdentifier:@"CellReportID"];
    
    UINib *TextNib = [UINib nibWithNibName:@"WTReportTextCell" bundle:nil];
    [_ReportTableV registerNib:TextNib forCellReuseIdentifier:@"CellTextID"];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        UIView  *View = [[UIView alloc] initWithFrame:CGRectZero];
        View.backgroundColor = HYC__COLOR_HEX(0xF7F7F7);
        UILabel *titleLab  = [[UILabel alloc] init];
        titleLab.text = @"请选择举报原因";
        titleLab.textColor = HYC__COLOR_HEX(0x959698);
        titleLab.font = [UIFont systemFontOfSize:14];
        [View addSubview:titleLab];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(13);
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(14);
        }];
        
        return View;
    }else{
        
        UIView  *View = [[UIView alloc] initWithFrame:CGRectZero];
        View.backgroundColor = HYC__COLOR_HEX(0xF7F7F7);
        
        return View;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 40;
    }else{
        
        return 8;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.0000001;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return _dataReportArr.count;
    }else{
        
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        
        static NSString *cellID = @"CellReportID";
        
        WTReportCell *cell = (WTReportCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTReportCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        cell.ContentLab.text = _dataReportArr[indexPath.row];
        
        //传值
        NSNumber *Num = [NSNumber numberWithInteger:indexPath.row];
        objc_setAssociatedObject(cell.XuanBtn, @"Num", Num, OBJC_ASSOCIATION_RETAIN_NONATOMIC);//实际上就是KVC
        [cell.XuanBtn addTarget:self action:@selector(JuBaobackBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (_typeNum == (long)indexPath.row) {
            
            cell.XuanBtn.selected = YES;
        }else{
            
            cell.XuanBtn.selected = NO;
        }
        
        return cell;
        
    }else{
    
        static NSString *cellID = @"CellTextID";
        
        WTReportTextCell *cell = (WTReportTextCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[WTReportTextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        return cell;
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    _typeNum = indexPath.row;
    [_ReportTableV reloadData];
}

- (void)JuBaobackBtnClick:(UIButton *)btn{
    
    NSNumber *Num = objc_getAssociatedObject(btn, @"Num");
    _typeNum = [Num integerValue];
    [_ReportTableV reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回
- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

//提交
- (IBAction)commitBtnClick:(id)sender {
    
    
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
