//
//  LoginNetWork.m
//  Camper
//
//  Created by liu on 2016/9/25.
//  Copyright © 2016年 ning. All rights reserved.
//

#import "LoginNetWork.h"

@implementation LoginNetWork
+(void)loginWithPhone:(NSString *)phone Password:(NSString *)password Success:(void (^)(id response))SuccessLogin Faliure:(void (^)(NSString * error))FaliureLogin {
    
    PostManNormalWithNORootParematers *postman = [PostManNormalWithNORootParematers new];
    postman.path = DriverLogin_Path;
    
    NSString *bdChannelId = [UserInfoSkills getUserInfo:UserInfoSkillsType_BDMyChannelId];
    
    if (bdChannelId && ![bdChannelId isEqualToString:@""]) {
        postman.params = @{@"username":phone,@"password":password,@"channelId":bdChannelId?:@""};
    }else{
        postman.params = @{@"username":phone,@"password":password};
    }
    
    [postman POST:^(id response) {
        
        [UserInfoSkills clearUserInfo];
        
        PostManWayConfig *config = [PostManWayConfig sharedInstance];
        config.rootParameters = response[@"token"];
        
 //       [UserInfoSkills updateUserInfo:phone Type:UserInfoSkillsType_Phone];
        [UserInfoSkills updateUserInfo:password Type:UserInfoSkillsType_Password];
        
        [UserInfoSkills updateUserInfo:response[@"userId"]?:@"" Type:UserInfoSkillsType_Userid];
        [UserInfoSkills updateUserInfo:response[@"baseId"]?:@"" Type:UserInfoSkillsType_BaseId];
        [UserInfoSkills updateUserInfo:response[@"token"]?:@"" Type:UserInfoSkillsType_Token];
        [UserInfoSkills updateUserInfo:response[@"rongyunToken"]?:@"" Type:UserInfoSkillsType_RongYunToken];

        
        PostManNormalWithRootParematers *postman = [PostManNormalWithRootParematers new];
        postman.path = UserGetUserOrDriverInfo_Path;
        postman.params = @{@"type":@"driver"};
        [postman POST:^(id response) {
            
            [UserInfoSkills updateUserInfo:response[@"phone"]?:@"" Type:UserInfoSkillsType_Phone];
            [UserInfoSkills updateUserInfo:response[@"headPortrait"]?:@"" Type:UserInfoSkillsType_HeadPortrait];
            [UserInfoSkills updateUserInfo:response[@"realName"]?:@"" Type:UserInfoSkillsType_RealName];
            [UserInfoSkills updateUserInfo:response[@"sex"]?:@"0" Type:UserInfoSkillsType_Sex];
            [UserInfoSkills updateUserInfo:response[@"level"]?:@"0" Type:UserInfoSkillsType_Level];
            
            
            [UserInfoSkills userLoginStatus:YES];
            
            SuccessLogin(response);
            
        } Faliure:^(NSString *errorStr) {
            FaliureLogin(errorStr);
        }];
        
    } Faliure:^(NSString *errorStr) {
        FaliureLogin(errorStr);
    }];

}

+(void)getDriverStatusSuccess:(void (^)(id response))Success Faliure:(void (^)(NSString * error))Faliure {
    PostManNormalWithRootParematers *postman = [PostManNormalWithRootParematers new];
    postman.path = DriverOrderDriverStatus;
    NSString *token = [UserInfoSkills getUserInfo:(UserInfoSkillsType_Token)];
    
    postman.params = @{@"token":token};
    [postman POST:^(id response) {
        Success(response);
        [UserInfoSkills updateUserInfo:response[@"status"] Type:UserInfoSkillsType_Status];
    } Faliure:^(NSString *errorStr) {
        Faliure(errorStr);
    }];
}

@end
