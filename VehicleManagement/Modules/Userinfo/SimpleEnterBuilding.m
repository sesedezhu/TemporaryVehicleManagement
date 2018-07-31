//
//  SimpleEnterBuilding.m
//  Cycling
//
//  Created by JobNewMac1 on 16/9/7.
//  Copyright © 2016年 JobNew. All rights reserved.
//

#import "SimpleEnterBuilding.h"
#import "Masonry.h"
#import "LNColorDesinger.h"
#import "UIViewController+LNCustomSkills.h"
#import "ShortuctKeyForMethod.h"
#import "UpdateUserInfoNetWork.h"

@interface SimpleEnterBuilding ()
@property (nonatomic ,strong) UIView *backView;
@property (nonatomic ,strong) UITextField *filed;
///已经有的text 从外面传进来的
@property (nonatomic ,strong) NSString *haveText;
@end

@implementation SimpleEnterBuilding

-(instancetype)initWithStyle:(SimpleEnterBuildingStyle)style AndText:(NSString *)text{
    self = [super init];
    if (self) {
        self.style = style;
        self.haveText = text;
        
        self.filed.text = self.haveText?:@"";
        
        self.view.backgroundColor = GaryBackColor;
        [self.view addSubview:self.backView];
        [self.backView addSubview:self.filed];
        [self LNRightNavItemWithImage:LNImageFromeName(@"WhiteDone") Action:@selector(done)];
    }
    return self;
}

-(void)changeTitle {
    switch (self.style) {
        case SimpleEnterBuildingStyle_NickName:
        {
            self.title = @"编辑姓名";
            self.filed.placeholder = @"请输入您的姓名";
        }
            break;
        case SimpleEnterBuildingStyle_Phone:
        {
            self.title = @"编辑手机";
            self.filed.placeholder = @"请输入您的手机";
        }
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
        make.top.equalTo(self.view.mas_top).with.offset(79);
        make.height.equalTo(@51);
    }];
    [self.filed mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.backView.mas_leading).with.offset(15);
        make.trailing.equalTo(self.backView.mas_trailing).with.offset(-15);
        make.top.equalTo(self.backView.mas_top);
        make.bottom.equalTo(self.backView.mas_bottom);
    }];
}

-(void)done {
    NSLog(@"确定");

    if ([Cooly LNIsEmpty:self.filed.text]) {
        switch (self.style) {
            case SimpleEnterBuildingStyle_NickName:
                [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"请输入姓名" INView:self.view];
                break;
            case SimpleEnterBuildingStyle_Phone:
                [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"请输入手机号" INView:self.view];
                break;
            default:
                break;
        }
        return;
    }
    
    if ([self.filed.text isEqualToString:self.haveText]) {
        switch (self.style) {
            case SimpleEnterBuildingStyle_NickName:
                [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"请修改姓名" INView:self.view];
                break;
            case SimpleEnterBuildingStyle_Phone:
                [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"请修改手机号" INView:self.view];
                break;
            default:
                break;
        }
        return;
    }
    
    UpdateUserInfoNetWorkType updateType = UpdateUserInfoNetWorkType_NickName;
    switch (self.style) {
        case SimpleEnterBuildingStyle_NickName:
        {
            updateType = UpdateUserInfoNetWorkType_NickName;
        }
            break;
        case SimpleEnterBuildingStyle_Phone:
        {
            updateType = UpdateUserInfoNetWorkType_Phone;
        }
            break;
        
        default:
            break;
    }
    
    [LNMBProgressHUDSkill LNMBProgressHUDINView:self.view];
    [UpdateUserInfoNetWork UpdateUserinfoWithType:updateType Extend:self.filed.text Success:^(id response) {
        [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
        [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"更新成功" INView:self.view];
        switch (self.style) {
            case SimpleEnterBuildingStyle_NickName:
            {
                [UserInfoSkills updateUserInfo:self.filed.text Type:UserInfoSkillsType_RealName];
                [WorldNotifyManager postUpdateUserInfoNotify:@{LNUpdateUserInfoNotifyType:LNUpdateUserInfoNotifyNickName} UserInfo:nil];
                [self.navigationController popViewControllerAnimated:YES];
            }
                break;
            case SimpleEnterBuildingStyle_Phone:
            {
                [UserInfoSkills updateUserInfo:self.filed.text Type:UserInfoSkillsType_Phone];
                [WorldNotifyManager postUpdateUserInfoNotify:@{LNUpdateUserInfoNotifyType:LNUpdateUserInfoNotifyPhone} UserInfo:nil];
                [self.navigationController popViewControllerAnimated:YES];
            }
                break;
                
            default:
                break;
        }

    } Faliure:^(NSString *error) {
        [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
        [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"更新失败，请重试" INView:self.view];
    }];
}

-(void)setStyle:(SimpleEnterBuildingStyle)style {
    _style = style;
    [self changeTitle];
}

-(UIView *)backView {
    if (!_backView) {
        _backView = [UIView new];
        _backView.backgroundColor = WhiteColor;
    }
    return _backView;
}

-(UITextField *)filed {
    if (!_filed) {
        _filed = [UITextField new];
    }
    return _filed;
}

@end
