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

#import "MessageHeadView.h"//首页头试图
#import "MessageCityChooseView.h"//首页城市输入选择框
@interface MainBuildingController ()<UITableViewDataSource , UITableViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate,UIScrollViewDelegate>

@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) UITableView *tableView;

@property(nonatomic,strong)MessageHeadView *headView;
@property(nonatomic,strong)MessageCityChooseView*chooseView;

@end

@implementation MainBuildingController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
//    [self LNLeftNavItemWithImage:LNImageFromeName(@"LeftPeople") Action:@selector(leftAction)];
//    //    [self LNRightNavItemWithView:self.rightMessageCountView Action:@selector(rightAction)];
//    self.view.backgroundColor = [UIColor whiteColor];
    self.headView.backgroundColor = [UIColor clearColor];
    [_headView.leftBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    //设置城市输入框的属性配置
    [self setRightViewWithTextField:self.headView.cityText imageName:@"zc01"];
    _headView.cityText.delegate = self;
    //    _headVi.delegate = self;
    
//    self.dataArray = [@[@"我的粉丝",@"我的关注",@"订单信息",@"我的收藏",@"向导中心",@"设置",@"意见反馈"] mutableCopy];
     self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CONVER_VALUE(80), kScreenWidth, kScreenHeight-CONVER_VALUE(80)) style:UITableViewStyleGrouped];
    
    self.tableView.dataSource = self;
    self.tableView.delegate  = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:_headView];
    [self.view addSubview:self.tableView];
    

    
    
//    [self setUpForDismissKeyboard];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent   *)event {
    
[self.view endEditing:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset=scrollView.contentOffset.y;
    if (offset<=0) {
        self.navigationController.navigationBar.hidden = YES;
    }
    else {
        self.navigationController.navigationBar.hidden = YES;
    }
[self.view endEditing:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    LNDLogline
    [self updateUserInfo];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.view endEditing:YES];
    self.navigationController.navigationBar.hidden = NO;
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
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
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
//输入框
-(void)setRightViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName{
    
    UIImageView *rightView = [[UIImageView alloc]init];
    rightView.image = [UIImage imageNamed:imageName];
    
    CGRect re = rightView.frame;
    re.size = CGSizeMake(CONVER_VALUE(10), CONVER_VALUE(10));
    rightView.frame = re;
    
    rightView.contentMode = UIViewContentModeCenter;
    textField.rightView = rightView;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
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
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //判断是城市输入框还是搜索输入框
    if (textField ==_headView.cityText) {
        
        NSLog(@"%@",string);
        if ([string isEqualToString:@"h"]) {
            _chooseView.arrMDataSource = @[@"海1",@"海2",@"海13",@"海14",@"海15",@"海16",@"海17",@"海18",@"海19",];
        }
        if ([string isEqualToString:@"的"]) {
            _chooseView.arrMDataSource = @[@"的1",@"的2",@"的13",@"的海14",@"的海15",@"的海16",@"的海17",@"的海18",@"的海19",];
        }
        if ([string isEqualToString:@"呃呃"]) {
            _chooseView.arrMDataSource = @[@"呃呃海1",@"呃呃海2",@"呃呃海13",@"呃呃海14",@"呃呃海15",@"呃呃海16",@"呃呃海17",@"呃呃海18",@"呃呃海19",];
        }
        
        [_chooseView.tableView reloadData];
    }else{
        
        //搜索输入框
    }
    
    
    
    
    return YES;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    //   MessageCityChooseView *choo =  [[MessageCityChooseView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, 200)];
    //    self.chooseView = choo;
    if (self.chooseView.isHidden) {
        self.chooseView.hidden = NO;
    }else{
        self.chooseView.hidden = YES;
    }
    
    //    choo.backgroundColor = [UIColor redColor];
    //    choo.cusFont = [UIFont systemFontOfSize:CONVER_VALUE(12)];
    //    choo.arrMDataSource = @[@"海口",@"北京",@"上海"];
    //    choo.tabColor = [UIColor redColor];
    //
    //    [choo setDidSelectedCallback:^(NSInteger index, NSString *content) {
    //        //回调中要实现的功能.
    //    }];
    return YES;
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    if (!self.chooseView.isHidden) {
        self.chooseView.hidden = YES;
    }
    return YES;
}
////收起键盘
//- (void)setUpForDismissKeyboard {
//
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reKeyBoard)];
//    [self.view addGestureRecognizer:tap];
//}
//-(void)reKeyBoard{
//
//}
-(MessageCityChooseView *)chooseView{
    if (!_chooseView) {
        _chooseView = [[MessageCityChooseView alloc] initWithFrame:CGRectMake(CONVER_VALUE(60), 50, CONVER_VALUE(60), CONVER_VALUE(60))];
        _chooseView.backgroundColor = [UIColor blackColor];
        _chooseView.cusFont = [UIFont systemFontOfSize:CONVER_VALUE(12)];
        _chooseView.arrMDataSource = @[@"海口",@"北京",@"上海"];
        //        _chooseView.tabColor = [UIColor redColor];
        _chooseView.hidden = YES;
        __weak typeof(self) weakSelf = self;
        [_chooseView setDidSelectedCallback:^(NSInteger index, NSString *content) {
            //回调中要实现的功能.
            weakSelf.headView.cityText.text = content;
        }];
        [self.view addSubview:_chooseView];
    }
    return _chooseView;
}

-(UIView *)headView{
    if (!_headView) {
        _headView = [[MessageHeadView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CONVER_VALUE(80))];
    }
    return _headView;
}
@end
