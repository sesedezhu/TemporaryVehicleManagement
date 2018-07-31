//
//  MessageBuilding.m
//  Camper
//
//  Created by liu on 2016/9/27.
//  Copyright © 2016年 ning. All rights reserved.
//

#import "MessageBuilding.h"
#import "MessageListNetWork.h"
@interface MessageBuilding ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableview;
@property (nonatomic ,strong) NSMutableArray *dataArray;
@property (nonatomic ,strong) NSMutableArray *heightArray;
@property (nonatomic ,assign) NSInteger page;
@property (nonatomic ,assign) NSInteger totalPage;
@end

@implementation MessageBuilding

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"消息";
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
        make.bottom.equalTo(self.view.mas_bottom);
        make.top.equalTo(self.view.mas_top);
    }];
    
    [self.tableview.mj_header beginRefreshing];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *num = self.heightArray[indexPath.row];
    return num.floatValue;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView *logo = [[UIImageView alloc] init];
        logo.image = LNImageFromeName(@"MessageLogo");
        logo.tag = -1;
        [cell addSubview:logo];
        
        UIImageView *redpoint = [UIImageView new];
        redpoint.image = LNImageFromeName(@"MessageRedPoint");
        redpoint.tag = -2;
        [cell addSubview:redpoint];
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.font = LNFontFromeSize(@16);
        titleLabel.textColor = MainWorldColor;
        titleLabel.tag = -3;
        titleLabel.numberOfLines = 10;
        [cell addSubview:titleLabel];
        
        UILabel *contentLabel = [UILabel new];
        contentLabel.font = LNFontFromeSize(@14);
        contentLabel.textColor = MainWorldColor;
        contentLabel.tag = -4;
        contentLabel.numberOfLines = 10;
        [cell addSubview:contentLabel];
        
        UILabel *subLabel = [UILabel new];
        subLabel.font = LNFontFromeSize(@12);
        subLabel.textColor = [UIColor LNcolorWithHexString:@"888888"];
        subLabel.tag = -5;
        subLabel.numberOfLines = 10;
        [cell addSubview:subLabel];
        
        [logo mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(cell.mas_centerY);
            make.top.equalTo(cell.mas_top).with.offset(12.5);
            make.leading.equalTo(cell.mas_leading).with.offset(8);
            make.width.equalTo(@35);
            make.height.equalTo(@35);
        }];
        
        [redpoint mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(logo.mas_trailing).with.offset(-5);
            make.top.equalTo(logo.mas_top).with.offset(3);
            make.width.equalTo(@10);
            make.height.equalTo(@10);
        }];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(logo.mas_trailing).with.offset(8);
            make.width.equalTo(@80);
            make.top.equalTo(logo.mas_top);
            make.height.greaterThanOrEqualTo(@0);
        }];
        
        [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(titleLabel.mas_trailing).with.offset(8);
            make.trailing.equalTo(cell.mas_trailing).with.offset(-8);
            make.bottom.equalTo(titleLabel.mas_bottom);
            make.height.greaterThanOrEqualTo(@0);
        }];
        
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(logo.mas_trailing).with.offset(8);
            make.trailing.equalTo(cell.mas_trailing).with.offset(-8);
            make.top.equalTo(titleLabel.mas_bottom).with.offset(5);
            make.height.greaterThanOrEqualTo(@0);
        }];
        
        UIView *line = [UIView new];
        line.backgroundColor = BlackGaryTipsWorldColor;
        [cell addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(cell.mas_leading);
            make.trailing.equalTo(cell.mas_trailing);
            make.bottom.equalTo(cell.mas_bottom);
            make.height.equalTo(@1);
        }];
        
    }
    
    UIImageView *redpoint = [cell viewWithTag:-2];
    UILabel *title = [cell viewWithTag:-3];
    UILabel *content = [cell viewWithTag:-4];
    UILabel *createTime = [cell viewWithTag:-5];
    
    NSDictionary *dic = self.dataArray[indexPath.row];
    if ([dic[@"readed"] boolValue]) {
        redpoint.hidden = YES;
    } else {
        redpoint.hidden = NO;
    }
    
    title.text = dic[@"title"];
    content.text = dic[@"content"];
    createTime.text = dic[@"createTime"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     NSMutableDictionary *dic = self.dataArray[indexPath.row];
    if ([dic[@"readed"] boolValue]) {
        return;
    }
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIImageView *redpoint = [cell viewWithTag:-2];
    
    [LNMBProgressHUDSkill LNMBProgressHUDINView:self.view];
    
    PostManNormalWithRootParematers *postman = [PostManNormalWithRootParematers new];
    postman.path = NoticeReadNotice;
    postman.params = @{@"type":@"driver",
                       @"id":dic[@"id"]};
    [postman POST:^(id response) {
        [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
        redpoint.hidden = YES;
        [dic setObject:@"1" forKey:@"readed"];
        
        NSString *countStr = [UserInfoSkills getUserInfo:UserInfoSkillsType_MessageCount];
        NSInteger i = [countStr integerValue] - 1;
        if (i < 0) {
            i = 0;
        }
        [UserInfoSkills updateUserInfo:[NSString stringWithFormat:@"%ld",(long)i] Type:UserInfoSkillsType_MessageCount];
        [WorldNotifyManager postUpdateMessageCountNotify:nil UserInfo:nil];
        
        [tableView beginUpdates];
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [self.tableview deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
        
    } Faliure:^(NSString *errorStr) {
        [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
    }];
}

#pragma mark net
-(void)getList {
    
    NSString *pageStr = [@(self.page+1) stringValue];
    NSDictionary *param = @{@"page":pageStr,
                            @"rows":@"20"};
    [MessageListNetWork messageListParams:param Success:^(id response){
        self.page = [response[@"page"] integerValue];
        self.totalPage = [response[@"totalPage"] integerValue];
        for (NSDictionary *tempdic in response[@"data"]) {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:tempdic];
            if (!dic[@"title"]) {
                [dic setObject:@"系统消息" forKey:@"title"];
            }
            [self.dataArray addObject:dic];
        }
        if (self.dataArray.count <= 0) {
            [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"暂无数据" INView:self.view];
        }
        [self calHeight];
        [self.tableview reloadData];
        
        if (self.page > 1) {
            [self.tableview.mj_footer endRefreshing];
        } else {
            [self.tableview.mj_header endRefreshing];
        }
        
    } Faliure:^(NSString *error) {
        [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"暂无数据" INView:self.view];
        if (self.page > 1) {
            [self.tableview.mj_footer endRefreshing];
        } else {
            [self.tableview.mj_header endRefreshing];
        }
    }];
}


#pragma mark calHeight
-(void)calHeight {
    NSMutableArray *temps = [NSMutableArray new];
    
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, LNScreenWidth - 59, 0)];
    tempLabel.numberOfLines = 10;
    
    for (NSDictionary *dic in self.dataArray) {
        
        CGFloat f = 15;
        
        NSString * title = dic[@"title"];
        NSString * content = dic[@"content"];
        
        tempLabel.font = LNFontFromeSize(@16);
        tempLabel.text = title;
        [tempLabel sizeToFit];
        
        f += tempLabel.frame.size.height;
        
        tempLabel.frame = CGRectMake(0, 0, LNScreenWidth - 59, 0);
        tempLabel.font = LNFontFromeSize(@14);
        tempLabel.text = content;
        [tempLabel sizeToFit];
        
        f += tempLabel.frame.size.height;
        
        if (f < 60) {
            f = 60;
        }
        
        [temps addObject:@(f)];
    }
    
    self.heightArray = temps;
}

#pragma mark setter getetr
-(UITableView *)tableview {
    if (!_tableview) {
        _tableview = [UITableView new];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.tableview.mj_footer resetNoMoreData];
            self.page = 0;
            [self.dataArray removeAllObjects];
            [self getList];
        }];
        _tableview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            if (self.page + 1 > self.totalPage) {
                [self.tableview.mj_footer endRefreshingWithNoMoreData];
                return;
            }
            [self getList];
        }];
    }
    return _tableview;
}

-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

-(NSMutableArray *)heightArray {
    if (!_heightArray) {
        _heightArray = [NSMutableArray new];
    }
    return _heightArray;
}

@end
