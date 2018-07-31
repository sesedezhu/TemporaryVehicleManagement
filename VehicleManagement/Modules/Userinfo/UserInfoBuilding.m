//
//  UserInfoBuilding.m
//  Camper
//
//  Created by liu on 16/9/17.
//  Copyright © 2016年 ning. All rights reserved.
//

#import "UserInfoBuilding.h"
#import "LNBuildingAlertController.h"
#import "SimpleEnterBuilding.h"
#import "UpdateUserInfoNetWork.h"

@interface UserInfoBuilding ()

@end

@implementation UserInfoBuilding

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
    [WorldNotifyManager addUpdateUserInfoNotify:self Selector:@selector(updateUserfoAction:) object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)updateUserfoAction:(NSNotification *)notify {
    NSDictionary *objc = notify.object;
    NSString *notifytype = objc[LNUpdateUserInfoNotifyType];
    if ([notifytype isEqualToString:LNUpdateUserInfoNotifyNickName]) {
        LNInfoBuildingSimpleInfoModuel  *module = [[self.LNInfoDataArray objectAtIndex:1] objectAtIndex:0];
        module.content = [UserInfoSkills getUserInfo:UserInfoSkillsType_RealName];
        [self LNInfoBuildingReload];
    }
    if ([notifytype isEqualToString:LNUpdateUserInfoNotifyHead]) {
        LNInfoBuildingHeadModule *module = [[self.LNInfoDataArray objectAtIndex:0] objectAtIndex:0];
        NSString *head = [UserInfoSkills getUserInfo:UserInfoSkillsType_HeadPortrait];
        module.head = head;
    }
    if ([notifytype isEqualToString:LNUpdateUserInfoNotifySex]) {
        LNInfoBuildingSimpleInfoModuel *module = [[self.LNInfoDataArray objectAtIndex:1] objectAtIndex:1];
        module.content = [[UserInfoSkills getUserInfo:UserInfoSkillsType_Sex] boolValue]?@"男":@"女";
        [self LNInfoBuildingReload];
    }
    if ([notifytype isEqualToString:LNUpdateUserInfoNotifyPhone]) {
        LNInfoBuildingSimpleInfoModuel *module = [[self.LNInfoDataArray objectAtIndex:1] objectAtIndex:2];
        module.content = [UserInfoSkills getUserInfo:UserInfoSkillsType_Phone];
        [self LNInfoBuildingReload];
    }
}

-(void)lnNavBackAction {
    [WorldNotifyManager deleteUpdateUserInfoNotify:self object:nil];//移除用户更新的通知
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark setter getter
-(NSMutableArray *)LNInfoDataArray {
    NSMutableArray *temp = [NSMutableArray new];
    
    NSString *head = [UserInfoSkills getUserInfo:UserInfoSkillsType_HeadPortrait];
    NSString *nickName = [UserInfoSkills getUserInfo:UserInfoSkillsType_RealName];
    NSString *phone = [UserInfoSkills getUserInfo:UserInfoSkillsType_Phone];
    
    LNInfoBuildingHeadModule *headModule = [LNInfoBuildingHeadModule new];
    headModule.title  = @"头像";
//    headModule.rightArrow = YES;
    headModule.rightArrow = NO;
    headModule.head = head;
    [temp addObject:@[headModule]];
    
    NSArray *arr = @[@"姓名",@"手机"];
    NSArray *contentarr = @[nickName,phone];
    NSMutableArray *tesarray = [NSMutableArray new];
    for (int i = 0; i < arr.count; i++) {
        [tesarray addObject:[LNInfoBuildingSimpleInfoModuel initWith:arr[i] Content:contentarr[i] Arrow:NO]];
//        if (i != 1) {
//            [tesarray addObject:[LNInfoBuildingSimpleInfoModuel initWith:arr[i] Content:contentarr[i] Arrow:YES]];
//        } else { //手机 隐藏 右边的箭头
//            [tesarray addObject:[LNInfoBuildingSimpleInfoModuel initWith:arr[i] Content:contentarr[i] Arrow:NO]];
//        }
    }
    [temp addObject:tesarray];
    
    LNInfoBuildingEXit *exitModule = [LNInfoBuildingEXit new];
    [temp addObject:@[exitModule]];
    
    return temp;
}

-(void)LNInfoBuildingHeadAction:(UIGestureRecognizer *)headGes {
    
    LNDLog(@"头像点击事件已注释");
    
//    [self LNOpenImageChoiceController:^(UIImage *image, NSString *imageName) {
//        UIImageView *headimageview = (UIImageView *) headGes.view;
//        headimageview.image = image;
//        PostManNormalWithRootParematers *postman = [PostManNormalWithRootParematers new];
//        postman.params = @{@"type":@"driver"};
//        postman.path = UserUpdateUserOrDriver;
//        postman.fileName  = imageName;
//        postman.files = @[image];
//        [LNMBProgressHUDSkill LNMBProgressHUDINView:self.view];
//        [postman UPLOAD:^(CGFloat progress) {
//
//        } Success:^(id response) {
//            [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
//            [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"更新成功" INView:self.view];
//            [UserInfoSkills updateUserInfo:response[@"headPortrait"] Type:UserInfoSkillsType_HeadPortrait];
//            [WorldNotifyManager postUpdateUserInfoNotify:@{LNUpdateUserInfoNotifyType:LNUpdateUserInfoNotifyHead} UserInfo:nil];
//        } Faliure:^(NSString *errorStr) {
//            [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
//            [LNMBProgressHUDSkill LNMBProgressHUDShowWord:errorStr?:@"更新失败，请重试" INView:self.view];
//        }];
//    }];
}

-(void)LNInfoBuildingSelectRow:(UITableView *)tableview Indexpath:(NSIndexPath *)indexPath Module:(LNInfoBuildingBaseModule *)module{
//    if ([module.title isEqualToString:@"姓名"]) {
//        SimpleEnterBuilding *vc = [[SimpleEnterBuilding alloc] initWithStyle:SimpleEnterBuildingStyle_NickName AndText:[(LNInfoBuildingSimpleInfoModuel *)module content]];
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//    if ([module.title isEqualToString:@"性别"]) {
//        [LNBuildingAlertController showOnBuilding:self Titles:@[@"男",@"女"] Done:^(NSString *done) {
//            if ([[(LNInfoBuildingSimpleInfoModuel *)module content] isEqualToString:done]) {
//                return;
//            }
//            [LNMBProgressHUDSkill LNMBProgressHUDINView:self.view];
//            [UpdateUserInfoNetWork UpdateUserinfoWithType:UpdateUserInfoNetWorkType_Sex Extend:done Success:^(id response) {
//
//                NSString *sex = @"0";
//                if ([done isEqualToString:@"男"]) {
//                    sex = @"1";
//                }
//                [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
//                [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"更新成功" INView:self.view];
//                [UserInfoSkills updateUserInfo:sex Type:UserInfoSkillsType_Sex];
//                [WorldNotifyManager postUpdateUserInfoNotify:@{LNUpdateUserInfoNotifyType:LNUpdateUserInfoNotifySex} UserInfo:nil];
//            } Faliure:^(NSString *error) {
//                [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
//                [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"更新失败，请重试" INView:self.view];
//            }];
//
//        }];
//    }
}

-(void)exitAction:(UIButton *)btn {
    [UserInfoSkills clearUserInfo];
    UINavigationController *nav = LNLoadBuildingFormMainBundleStoryBord(@"Login", @"LoginNavBuilding");
    LNApplicationWindows.rootViewController = nav;
}

@end
