//
//  LoginBuilding.m
//  Camper
//
//  Created by liu on 2016/9/25.
//  Copyright © 2016年 ning. All rights reserved.
//

#import "LoginBuilding.h"
#import "MainBuildingContainer.h"
#import "LoginNetWork.h"

@interface LoginBuilding ()

@property (weak, nonatomic) IBOutlet UIImageView *HeadImage;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *phoneFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordFiled;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIButton *commitButton;

@end

@implementation LoginBuilding

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.view.backgroundColor = GaryBackColor;
    [self.containerView LNBorderWithWidth:1 Color:LineColor];
    [self.containerView LNCornerRadius:8];
    self.line.backgroundColor = LineColor;
    self.commitButton.backgroundColor = MainColor;
    [self.commitButton LNCornerRadius:8];
    [self.commitButton LNControlStateNormalTitleColor:WhiteColor];
    
//    if (LNDEBUG) {
//        self.phoneFiled.text = @"";
//        self.passwordFiled.text = @"";
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)commitAction:(id)sender {
    if ([Cooly LNIsEmpty:self.phoneFiled.text]) {
        [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"请输入电话号码" INView:self.view];
        return;
    }
    if ([Cooly LNIsEmpty:self.passwordFiled.text]) {
        [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"请输入账号密码" INView:self.view];
        return;
    }
    [LNMBProgressHUDSkill LNMBProgressHUDINView:self.view];
    [LoginNetWork loginWithPhone:self.phoneFiled.text Password:self.passwordFiled.text Success:^(id response) {
        [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
        [self goMain];
    } Faliure:^(NSString *error) {
        [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
        [LNMBProgressHUDSkill LNMBProgressHUDShowWord:error?:@"登录失败，请稍后再试" INView:self.view];
    }];
}

-(void)goMain {
    MainBuildingContainer *vc = [MainBuildingContainer new];
    LNApplicationWindows.rootViewController = vc;
}

-(void)lnNavBackAction {
    exit(0);
}

@end
