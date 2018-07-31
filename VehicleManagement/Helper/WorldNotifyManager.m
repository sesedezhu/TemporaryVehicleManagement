//
//  WorldNotifyManager.m
//  Camper
//
//  Created by liu on 2016/9/25.
//  Copyright © 2016年 ning. All rights reserved.
//

#import "WorldNotifyManager.h"

#define UpdateUserInfoNotify          @"UpdateUserInfoNotify"
#define UserChangeStatusNotify        @"UserChangeStatusNotify"
#define UpdateMessageCountNotify      @"UpdateMessageCountNotify"
#define UpdateDriverLocationNotify    @"UpdateDriverLocationNotify"
#define UserComitOrderNotify          @"UserComitOrderNotify"
#define DriverAndUserOneByOneNotify   @"DriverAndUserOneByOneNotify"
#define UserCancleOrderNotify         @"UserCancleOrderNotify"
#define DriverDonwOrderNotify         @"DriverDonwOrderNotify"
#define DriverLoginNotify             @"DriverLoginNotify"

@implementation WorldNotifyManager

+(void)addNotify:(id)observer Selector:(SEL)selector  object:(id)object Name:(NSString *)name{
    LNAddNotifyToDefaultCenter(observer, selector, name, object);
}

+(void)deleteNotify:(id)observe Name:(NSString *)name object:(id)object {
    LNRemoveNotifyFromeDefautCenter(observe, name, object);
}

+(void)postLoginIntoNotifyName:(NSString *)name object:(id)object UserInfo:(id)userInfo {
    LNPostNotifyFromeDefautCenter(name, object, userInfo);
}

#pragma mark 用户信息修改以后相关的通知
+(void)addUpdateUserInfoNotify:(id)observer Selector:(SEL)selector  object:(id)object {
    [self addNotify:observer Selector:selector object:object Name:UpdateUserInfoNotify];
}

+(void)deleteUpdateUserInfoNotify:(id)observe object:(id)object {
    [self deleteNotify:observe Name:UpdateUserInfoNotify object:object];
}

+(void)postUpdateUserInfoNotify:(id)object UserInfo:(id)userInfo {
    [self postLoginIntoNotifyName:UpdateUserInfoNotify object:object UserInfo:userInfo];
}

#pragma mark 用户状态改变的通知
+(void)addUserChangeStatusNotify:(id)observer Selector:(SEL)selector object:(id)object {
    [self addNotify:observer Selector:selector object:object Name:UserChangeStatusNotify];
}

+(void)deleteUserChangeStatusNotify:(id)observe object:(id)object {
    [self deleteNotify:observe Name:UserChangeStatusNotify object:object];
}

+(void)postUserChangeStatusNotify:(id)object UserInfo:(id)userInfo {
    [self postLoginIntoNotifyName:UserChangeStatusNotify object:object UserInfo:userInfo];
}

#pragma mark 更新消息的数量
+(void)addUpdateMessageCountNotify:(id)observer Selector:(SEL)selector object:(id)object {
    [self addNotify:observer Selector:selector object:object Name:UpdateMessageCountNotify];
}

+(void)deleteUpdateMessageCountNotify:(id)observe object:(id)object {
    [self deleteNotify:observe Name:UpdateMessageCountNotify object:object];
}

+(void)postUpdateMessageCountNotify:(id)object UserInfo:(id)userInfo {
   [self postLoginIntoNotifyName:UpdateMessageCountNotify object:object UserInfo:userInfo];
}

#pragma mark 司机的位置信息的通知
+(void)addUpdateDriverLocationNotify:(id)observer Selector:(SEL)selector object:(id)object {
    [self addNotify:observer Selector:selector object:object Name:UpdateDriverLocationNotify];
}

+(void)deleteUpdateDriverLocationNotify:(id)observe object:(id)object {
    [self deleteNotify:observe Name:UpdateDriverLocationNotify object:object];
}

+(void)postUpdateDriverLocationNotify:(id)object UserInfo:(id)userInfo {
    [self postLoginIntoNotifyName:UpdateDriverLocationNotify object:object UserInfo:userInfo];
}

#pragma mark 用户提交订单的通知
+(void)addUserComitOrderNotify:(id)observer Selector:(SEL)selector object:(id)object {
    [self addNotify:observer Selector:selector object:object Name:UserComitOrderNotify];
}

+(void)deleteUserComitOrderNotify:(id)observe object:(id)object {
    [self deleteNotify:observe Name:UserComitOrderNotify object:object];
}

+(void)postUserComitOrderNotify:(id)object UserInfo:(id)userInfo {
    [self postLoginIntoNotifyName:UserComitOrderNotify object:object UserInfo:userInfo];
}

#pragma mark 司机抢单后一对一的通知
+(void)addDriverAndUserOneByOneNotify:(id)observer Selector:(SEL)selector object:(id)object {
    [self addNotify:observer Selector:selector object:object Name:DriverAndUserOneByOneNotify];
}

+(void)deleteDriverAndUserOneByOneNotify:(id)observe object:(id)object {
    [self deleteNotify:observe Name:DriverAndUserOneByOneNotify object:object];
}

+(void)postDriverAndUserOneByOneNotify:(id)object UserInfo:(id)userInfo {
    [self postLoginIntoNotifyName:DriverAndUserOneByOneNotify object:object UserInfo:userInfo];
}

#pragma mark 用户取消订单的通知
+(void)addUserCancleOrderNotify:(id)observer Selector:(SEL)selector object:(id)object {
    [self addNotify:observer Selector:selector object:object Name:UserCancleOrderNotify];
}

+(void)deleteUserCancleOrderNotify:(id)observe object:(id)object {
    [self deleteNotify:observe Name:UserCancleOrderNotify object:object];
}

+(void)postUserCancleOrderNotify:(id)object UserInfo:(id)userInfo {
    [self postLoginIntoNotifyName:UserCancleOrderNotify object:object UserInfo:userInfo];
}

#pragma mark 司机结束订单的通知
+(void)addDriverDonwOrderNotify:(id)observer Selector:(SEL)selector object:(id)object {
    [self addNotify:observer Selector:selector object:object Name:DriverDonwOrderNotify];
}

+(void)deleteDriverDonwOrderNotify:(id)observe object:(id)object {
    [self deleteNotify:observe Name:DriverDonwOrderNotify object:object];
}

+(void)postDriverDonwOrderNotify:(id)object UserInfo:(id)userInfo {
    [self postLoginIntoNotifyName:DriverDonwOrderNotify object:object UserInfo:userInfo];
}

#pragma mark 重新登录的通知
+(void)addDriverLoginNotify:(id)observer Selector:(SEL)selector object:(id)object {
    [self addNotify:observer Selector:selector object:object Name:DriverLoginNotify];
}

+(void)deleteDriverLoginNotify:(id)observe object:(id)object {
    [self deleteNotify:observe Name:DriverLoginNotify object:object];
}

+(void)postDriverLoginNotify:(id)object UserInfo:(id)userInfo {
    [self postLoginIntoNotifyName:DriverLoginNotify object:object UserInfo:userInfo];
}

@end
