//
//  LNInfoBuilding.m
//  Camper
//
//  Created by liu on 16/9/17.
//  Copyright © 2016年 ning. All rights reserved.
//

#import "LNInfoBuilding.h"

@implementation LNInfoBuildingBaseModule

@end

@implementation LNInfoBuildingSimpleInfoModuel
+(LNInfoBuildingSimpleInfoModuel *)initWith:(NSString *)title Content:(NSString *)content Arrow:(BOOL)arrow {
    LNInfoBuildingSimpleInfoModuel *temp = [LNInfoBuildingSimpleInfoModuel new];
    temp.title = title;
    temp.content = content;
    temp.rightArrow = arrow;
    return temp;
}
@end

@implementation LNInfoBuildingHeadModule

@end

@implementation LNInfoBuildingEXit

@end

@interface LNInfoBuilding ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableview;
@property (nonatomic ,strong) NSMutableArray *dataArray;
@end

#define SimpleInfoCellIdentifer  @"SimpleInfoCellIdentifer"
#define HeadCellIdentifer  @"HeadCellIdentifer"
#define ExitCellIdentifer  @"ExitCellIdentifer"

@implementation LNInfoBuilding

-(instancetype)init {
    self = [super init];
    if (self) {
        self.view.backgroundColor = GaryBackColor;
        [self.view addSubview:self.tableview];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getdata];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

#pragma mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray[section] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LNInfoBuildingBaseModule *module = [self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
    if ([module isKindOfClass:[LNInfoBuildingSimpleInfoModuel class]]) {
        return 50;
    }
    if ([module isKindOfClass:[LNInfoBuildingEXit class]]) {
        return 60;
    }
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = ClearColor;
    
    UIView *line = [UIView new];
    line.backgroundColor = BlackGaryTipsWorldColor;
    [view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(view.mas_leading);
        make.trailing.equalTo(view.mas_trailing);
        make.bottom.equalTo(view.mas_bottom);
        make.height.equalTo(@1);
    }];
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return .1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     LNInfoBuildingBaseModule *module = [self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
    if ([module isKindOfClass:[LNInfoBuildingSimpleInfoModuel class]]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleInfoCellIdentifer];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SimpleInfoCellIdentifer];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
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
        cell.textLabel.text = module.title;
        cell.detailTextLabel.text = [(LNInfoBuildingSimpleInfoModuel *)module content]?:@"";
        if (module.rightArrow) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        return cell;
    }
    
    if ([module isKindOfClass:[LNInfoBuildingEXit class]]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExitCellIdentifer"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ExitCellIdentifer];
            
            UIButton *button = [UIButton new];
            [button LNCornerRadius:8];
            [button LNControlStateNormalTitle:@"退出登录"];
            button.backgroundColor = MainColor;
            [cell addSubview:button];
            [button addTarget:self action:@selector(exitAction:) forControlEvents:UIControlEventTouchUpInside];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(cell.mas_leading).with.offset(15);
                make.top.equalTo(cell.mas_top).with.offset(7.5);
                make.centerX.equalTo(cell.mas_centerX);
                make.centerY.equalTo(cell.mas_centerY);
            }];
            
        }
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HeadCellIdentifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:HeadCellIdentifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView *headImage = [[UIImageView alloc] init];
        headImage.tag = -1;
        [headImage LNAddTapAction:@selector(LNInfoBuildingHeadAction:) Target:self];
        [headImage LNCornerRadius:30.0];
        [cell addSubview:headImage];
        [headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.mas_centerY);
            make.trailing.equalTo(cell.mas_trailing).with.offset(-30);
            make.height.equalTo(@60);
            make.width.equalTo(@60);
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
    
    LNInfoBuildingHeadModule *headmodule = (LNInfoBuildingHeadModule *)module;
    cell.textLabel.text = headmodule.title;
    if (headmodule.rightArrow) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    UIImageView *imageview = [cell viewWithTag:-1];
    LNImageFromeUrl(imageview, headmodule.head);
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LNInfoBuildingBaseModule *module = [self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
    [self LNInfoBuildingSelectRow:tableView Indexpath:indexPath Module:module];
}

#pragma mark event response
-(void)getdata {
    self.dataArray = [self LNInfoDataArray];
}

-(void)LNInfoBuildingReload {
    [self getdata];
    [self.tableview reloadData];
}

-(void)LNReloadUIRow:(NSInteger)row Section:(NSInteger)section {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableview beginUpdates];
        [self.tableview reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:section]] withRowAnimation:UITableViewRowAnimationNone];
        [self.tableview endUpdates];
    });
}

#pragma mark setter getter
-(UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor = ClearColor;
    }
    return _tableview;
}

-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

@end
