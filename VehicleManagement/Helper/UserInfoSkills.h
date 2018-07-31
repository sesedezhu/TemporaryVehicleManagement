//
//  UserInfoSkills.h
//  Camper
//
//  Created by liu on 2016/9/25.
//  Copyright © 2016年 ning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger ,UserInfoSkillsType) {
    UserInfoSkillsType_Token = 0,
    UserInfoSkillsType_Password,
    UserInfoSkillsType_Phone,
    UserInfoSkillsType_RongYunToken,
    UserInfoSkillsType_BaseId,
    UserInfoSkillsType_Userid,
    UserInfoSkillsType_HeadPortrait,
    UserInfoSkillsType_RealName,
    UserInfoSkillsType_Sex,
    UserInfoSkillsType_City, //所处的城市，定位得到
    UserInfoSkillsType_MessageCount,
    UserInfoSkillsType_Level,
    UserInfoSkillsType_Status,
    UserInfoSkillsType_CarNumberPlate,
    UserInfoSkillsType_BDMyChannelId //百度 ChannelId
};

@interface UserInfoSkills : NSObject

+(NSDictionary *)userinfoDic;
+(id)getUserInfo:(UserInfoSkillsType)type;
+(void)updateUserInfo:(NSString *)info Type:(UserInfoSkillsType)type;
+(void)clearUserInfo;

//用于使用保存车辆的类型 公司车 租车 私家车
+(NSString*)getUserInfoWithCarkinds;
+(void)updateUserInfoWithCarkinds:(NSString *)carkinds;
+(void)clearUserInfoWithCarkinds;

///判断用户是否已经登录
+(BOOL)isLogin;

///设置用户的登录状态
+(void)userLoginStatus:(BOOL)logined;


@end
