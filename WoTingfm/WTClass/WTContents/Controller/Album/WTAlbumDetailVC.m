//
//  WTAlbumDetailVC.m
//  WoTingfm
//
//  Created by jq on 2017/6/28.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "WTAlbumDetailVC.h"

#import "WTAlbumContentCell.h"      //内容详情cell

@interface WTAlbumDetailVC ()<UITableViewDelegate, UITableViewDataSource>{
    
    CGFloat  previewH;
}


@property (weak, nonatomic) IBOutlet UITableView *AlbumDetailTableV;

@end

@implementation WTAlbumDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _AlbumDetailTableV.delegate = self;
    _AlbumDetailTableV.dataSource = self;
    _AlbumDetailTableV.backgroundColor = HYC__COLOR_HEX(0xF7F7F7);
    _AlbumDetailTableV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _AlbumDetailTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self registerRAlbumCell];
}

- (void)registerRAlbumCell{
    
    UINib *ContentNib = [UINib nibWithNibName:@"WTAlbumContentCell" bundle:nil];
    [_AlbumDetailTableV registerNib:ContentNib forCellReuseIdentifier:@"CellContentID"];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        
    static NSString *cellID = @"CellContentID";
    
    WTAlbumContentCell *cell = (WTAlbumContentCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[WTAlbumContentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.contentLab.text = @"balabalabalabalabalabalabalabalabalabalabalabaabalbalabalaalbalabalalabalabalababababa啦啦啦把卡版本卡巴卡巴";
    previewH = [cell.contentLab.text boundingRectWithSize:CGSizeMake(cell.contentLab.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    cell.contentLabHeight.constant = previewH;

    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (previewH > 21) {
        
        return 87 + previewH -21;
    }else{
        
        return 87 + previewH -21;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
