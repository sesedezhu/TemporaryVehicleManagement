//
//  MainBuildingController.m
//  VehicleManagement
//
//  Created by ZQWFMac on 2018/7/25.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import "MainBuildingController.h"
#import "MainBuildingContainer.h"
#import "HouseOrderInfoController.h"

#import "CarArrangeCell.h"
@interface MainBuildingController ()<UITableViewDataSource , UITableViewDelegate>

@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) UITableView *tableView;


@end

@implementation MainBuildingController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self LNLeftNavItemWithImage:LNImageFromeName(@"LeftPeople") Action:@selector(leftAction)];
    //    [self LNRightNavItemWithView:self.rightMessageCountView Action:@selector(rightAction)];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.dataArray = [@[@"我的粉丝",@"我的关注",@"订单信息",@"我的收藏",@"向导中心",@"设置",@"意见反馈"] mutableCopy];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    self.tableView.dataSource = self;
    self.tableView.delegate  = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    LNDLogline
    [self updateUserInfo];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *caCell = @"caCell";
    CarArrangeCell *cell = [tableView dequeueReusableCellWithIdentifier:caCell];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CarArrangeCell" owner:nil options:nil] lastObject];
    }
    NSInteger wx = indexPath.row;
    cell.lookTimeStr = [NSString stringWithFormat:@"2018/07/27 10:%ld",(long)wx];
    cell.lookTypeStr = @"顾客看房";
    cell.departmentAndTelephoneTitleStr = @"技术部/13700000001";
    cell.departurePlaceStr = @"海口金霖花园";
    cell.destinationStr = @"高铁东站附近";
    cell.peopleNumStr = [NSString stringWithFormat:@"%ld",wx + 2];
    cell.buildingStr = [NSString stringWithFormat:@"嘉林仙居%ld号",wx + 1];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 115;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HouseOrderInfoController *vc = [[HouseOrderInfoController alloc] initWithNibName:@"HouseOrderInfoController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

//让tableView可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //转调度
    UITableViewRowAction *dRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"转调度" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        NSLog(@"点击了 转调度");
    }];
    UITableViewRowAction *cRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"关闭" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        NSLog(@"点击了 关闭");
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    //关闭
    dRowAction.backgroundColor = [UIColor greenColor];
    
    return @[cRowAction,dRowAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

-(void)leftAction {
    MainBuildingContainer *vc = (MainBuildingContainer *)LNApplicationWindows.rootViewController;
    [vc showLeftSide];
}

-(void)rightAction {
//    MessageBuilding *vc = [MessageBuilding new];
//    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark Network
//进入界面加载一次 登录成功获取司机状态
-(void)updateUserInfo {
    
    
    if ([UserInfoSkills isLogin]) { ///用户已登录就不需要
        
        
    }else{
        
        //        if ([UserInfoSkills getUserInfo:UserInfoSkillsType_Token]) {
        //            NSString *phone = [UserInfoSkills getUserInfo:UserInfoSkillsType_Phone];
        //            NSString *password = [UserInfoSkills getUserInfo:UserInfoSkillsType_Password];
        //
        //            if ([Cooly LNIsEmpty:phone] || [Cooly LNIsEmpty:password]) {
        //                return;
        //            }
        //            [LNMBProgressHUDSkill LNMBProgressHUDINView:self.view];
        //            [LoginNetWork loginWithPhone:phone Password:password Success:^(id response) {
        //                [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
        //
        //                [MessageListNetWork  messageListParams:nil Success:^(id response) {
        //
        //                } Faliure:^(NSString *error) {
        //
        //                }];
        //
        //                [self getOrderListNetWork:0];
        //                [self getOrderStatusNetWork];
        //
        //            } Faliure:^(NSString *error) {
        //                [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
        //                [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"登录失效" INView:nil];
        //                [UserInfoSkills clearUserInfo];
        //                dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.6 * NSEC_PER_SEC));
        //                dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        //                    UINavigationController *nav = LNLoadBuildingFormMainBundleStoryBord(@"Login", @"LoginNavBuilding");
        //                    LNApplicationWindows.rootViewController = nav;
        //                });
        //            }];
        //        }
    }
}
@end
