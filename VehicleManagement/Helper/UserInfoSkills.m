//
//  UserInfoSkills.m
//  Camper
//
//  Created by liu on 2016/9/25.
//  Copyright © 2016年 ning. All rights reserved.
//

#import "UserInfoSkills.h"
#import "WorldNotifyManager.h"

#define UserInfoDic             @"UserInfoDic"
#define UserInfoPhone           @"UserInfoPhone"
#define UserInfoPassword        @"UserInfoPassword"
#define UserInfoToken           @"UserInfoToken"
#define UserInfoRongYunToken    @"UserInfoRongYunToken"
#define UserInfoBaseId          @"UserInfoBaseId"
#define UserInfoUserId          @"UserInfoUserId"
#define UserInfoHeadPortrait    @"UserInfoHeadPortrait"
#define UserInfoRealName        @"UserInfoRealName"
#define UserInfoSex             @"UserInfoSex"
#define UserInfoCity            @"UserInfoCity"
#define UserInfoMessageCount    @"UserInfoMessageCount"
#define UserInfoLevel           @"UserInfoLevel"
#define UserInfoStatus          @"UserInfoStatus"
#define UserInfoCarNumberPlate  @"UserInfoCarNumberPlate"
#define UserInfoBDMyChannelId   @"UserInfoBDMyChannelId"
#define UserInfoCarkinds   @"UserInfoCarkinds"

@implementation UserInfoSkills


+(NSDictionary *)userinfoDic {
    NSDictionary *userinfo = [LNUserdefauts objectForKey:UserInfoDic];
    return userinfo;
}

+(id)getUserInfo:(UserInfoSkillsType)type {
    NSDictionary *userinfo = [self userinfoDic];
    switch (type) {
        case UserInfoSkillsType_Phone:
            return userinfo[UserInfoPhone];
            break;
        case UserInfoSkillsType_Password:
            return userinfo[UserInfoPassword];
            break;
        case UserInfoSkillsType_Token:
            return userinfo[UserInfoToken];
            break;
        case UserInfoSkillsType_RongYunToken:
            return userinfo[UserInfoRongYunToken];
            break;
        case UserInfoSkillsType_BaseId:
            return userinfo[UserInfoBaseId];
            break;
        case UserInfoSkillsType_Userid:
            return userinfo[UserInfoUserId];
            break;
        case UserInfoSkillsType_HeadPortrait:
            return userinfo[UserInfoHeadPortrait];
            break;
        case UserInfoSkillsType_RealName:
            return userinfo[UserInfoRealName];
            break;
        case UserInfoSkillsType_Sex:
            return userinfo[UserInfoSex];
            break;
        case UserInfoSkillsType_City:
            return userinfo[UserInfoCity];
            break;
        case UserInfoSkillsType_MessageCount:
            return userinfo[UserInfoMessageCount];
            break;
        case UserInfoSkillsType_Level:
            return userinfo[UserInfoLevel];
            break;
        case UserInfoSkillsType_Status:
            return userinfo[UserInfoStatus];
            break;
        case UserInfoSkillsType_CarNumberPlate:
            if (userinfo[UserInfoCarNumberPlate] &&
                ![userinfo[UserInfoCarNumberPlate] isEqualToString:@""]) {
                return userinfo[UserInfoCarNumberPlate];
            }
            return userinfo[UserInfoRealName];
            break;
        case UserInfoSkillsType_BDMyChannelId:
            
            NSLog(@"获取 本地 信息 %@ UserInfoSkillsType_BDMyChannelId",userinfo[UserInfoBDMyChannelId]);
            return userinfo[UserInfoBDMyChannelId];
        default:
            break;
    }
    return nil;
}

+(void)updateUserInfo:(NSString *)info Type:(UserInfoSkillsType)type{
    NSDictionary *tempdic = [self userinfoDic];
    NSMutableDictionary *dic = nil;
    if (!tempdic) {
        dic = [NSMutableDictionary new];
    } else {
        dic = [[NSMutableDictionary alloc] initWithDictionary:tempdic];
    }
    
    NSLog(@"更新本地 信息 %@ ",info);
    
    switch (type) {
        case UserInfoSkillsType_Phone:
            [dic setObject:info?:@"" forKey:UserInfoPhone];
            break;
        case UserInfoSkillsType_Password:
            [dic setObject:info?:@"" forKey:UserInfoPassword];
            break;
        case UserInfoSkillsType_Token:
            [dic setObject:info?:@"" forKey:UserInfoToken];
            break;
        case UserInfoSkillsType_RongYunToken:
            [dic setObject:info?:@"" forKey:UserInfoRongYunToken];
            break;
        case UserInfoSkillsType_BaseId:
            [dic setObject:info?:@"" forKey:UserInfoBaseId];
            break;
        case UserInfoSkillsType_Userid:
            [dic setObject:info?:@"" forKey:UserInfoUserId];
            break;
        case UserInfoSkillsType_HeadPortrait:
            [dic setObject:info?:@"" forKey:UserInfoHeadPortrait];
            break;
        case UserInfoSkillsType_RealName:
            [dic setObject:info?:@"" forKey:UserInfoRealName];
            break;
        case UserInfoSkillsType_Sex:
            [dic setObject:info?:@"" forKey:UserInfoSex];
            break;
        case UserInfoSkillsType_City:
            [dic setObject:info?:@"" forKey:UserInfoCity];
            break;
        case UserInfoSkillsType_MessageCount:
            [dic setObject:info?:@"0" forKey:UserInfoMessageCount];
            break;
        case UserInfoSkillsType_Level:
            [dic setObject:info?:@"0" forKey:UserInfoLevel];
            break;
        case UserInfoSkillsType_Status:
        {
            if (![info isEqualToString:tempdic[UserInfoStatus]]) {
                [dic setObject:info?:@"returned" forKey:UserInfoStatus];
            }
        }
            break;
        case UserInfoSkillsType_CarNumberPlate:
        {
            [dic setObject:info?:@"" forKey:UserInfoCarNumberPlate];
        }
            break;
        case UserInfoSkillsType_BDMyChannelId:
            [dic setObject:info forKey:UserInfoBDMyChannelId];
            break;
        default:
            break;
    }
    
    [LNUserdefauts setObject:dic forKey:UserInfoDic];
    
    if (type == UserInfoSkillsType_Status) {
        if (![info isEqualToString:tempdic[UserInfoStatus]]) {
            [WorldNotifyManager postUserChangeStatusNotify:nil UserInfo:nil];
        }
    }
}

+(void)clearUserInfo {
    [LNUserdefauts removeObjectForKey:UserInfoDic];
    [self userLoginStatus:NO];
}


+(void)updateUserInfoWithCarkinds:(NSString *)carkinds{
    [LNUserdefauts setObject:carkinds forKey:UserInfoCarkinds];
}
+(NSString*)getUserInfoWithCarkinds{
   return [LNUserdefauts objectForKey:UserInfoCarkinds];
}
+(void)clearUserInfoWithCarkinds{
    [LNUserdefauts removeObjectForKey:UserInfoCarkinds];
}

//登录状态
+(BOOL)isLogin {
    return [LNUserdefauts boolForKey:@"ISLOGIN"];
}

+(void)userLoginStatus:(BOOL)logined {
    [LNUserdefauts setBool:logined forKey:@"ISLOGIN"];
}

@end
