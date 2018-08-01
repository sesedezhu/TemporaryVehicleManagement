//
//  MessageCityChooseView.m
//  VehicleManagement
//
//  Created by 谭晓强 on 2018/7/26.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import "MessageCityChooseView.h"
@interface MessageCityChooseView ()<UITableViewDataSource, UITableViewDelegate>

@end
@implementation MessageCityChooseView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

//-(instancetype)init{
//    if (self = [super init]) {
//        [self initUI];
//    }
//    return self;
//}
//
//-(void)setTabColor:(UIColor *)tabColor{
//    _tabColor = tabColor;
//    self.tableView.backgroundColor = tabColor;
//}
//
//-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    if (self = [super initWithCoder:aDecoder]) {
//        [self initUI];
//    }
//    return self;
//}
-(void)initUI{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CONVER_VALUE(80), CONVER_VALUE(60))];
//    tableView.showsVerticalScrollIndicator = NO;
//    tableView.frame = self.bounds;
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    _tableView.backgroundColor = [UIColor redColor];
//    tableView.rowHeight = 30;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"fmenualert"];
    [self addSubview:_tableView];

    NSLog(@"%@",_tableView);
}

//-(void)setArrMDataSource:(NSArray *)arrMDataSource{
//
//
//    _arrMDataSource = arrMDataSource;
//    [_tableView reloadData];
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.didSelectedCallback) {
        self.didSelectedCallback(indexPath.row, _arrMDataSource[indexPath.row]);
        self.hidden = YES;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"%lu",(unsigned long)_arrMDataSource.count);
    return _arrMDataSource.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"fmenualert" forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = _arrMDataSource[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.textColor = _txtColor ? _txtColor : [UIColor blackColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = self.tabColor;
    cell.textLabel.backgroundColor = self.tabColor;
//    cell.textLabel.font = _cusFont ? _cusFont : KFONT(15);
    return cell;
}
// 以下适配iOS11+
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

@end
