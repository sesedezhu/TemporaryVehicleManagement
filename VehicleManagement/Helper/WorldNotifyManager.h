//
//  WorldNotifyManager.h
//  Camper
//
//  Created by liu on 2016/9/25.
//  Copyright © 2016年 ning. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LNUpdateUserInfoNotifyType      @"LNUpdateUserInfoNotifyType"
#define LNUpdateUserInfoNotifyNickName  @"LNUpdateUserInfoNotifyNickName"
#define LNUpdateUserInfoNotifyHead      @"LNUpdateUserInfoNotifyHead"
#define LNUpdateUserInfoNotifySex       @"LNUpdateUserInfoNotifySex"
#define LNUpdateUserInfoNotifyPhone     @"LNUpdateUserInfoNotifyPhone"

@interface WorldNotifyManager : NSObject

#pragma mark 用户信息修改以后相关的通知

/**
 * 添加 用户信息修改以后的通知
 */
+(void)addUpdateUserInfoNotify:(id)observer Selector:(SEL)selector object:(id)object;

/**
 * 移除 用户信息修改以后的通知
 */
+(void)deleteUpdateUserInfoNotify:(id)observe object:(id)object;

/**
 * 发送 用户信息修改以后的通知
 */
+(void)postUpdateUserInfoNotify:(id)object UserInfo:(id)userInfo;

#pragma mark 用户状态改变的通知
/**
 * 添加 用户状态改变的通知
 */
+(void)addUserChangeStatusNotify:(id)observer Selector:(SEL)selector object:(id)object;

/**
 * 移除 用户状态改变的通知
 */
+(void)deleteUserChangeStatusNotify:(id)observe object:(id)object;

/**
 * 发送 用户状态改变的通知
 */
+(void)postUserChangeStatusNotify:(id)object UserInfo:(id)userInfo;

#pragma mark 消息数量改变以后相关的通知
/**
 * 添加 更新消息数量的通知
 */
+(void)addUpdateMessageCountNotify:(id)observer Selector:(SEL)selector object:(id)object;

/**
 * 移除 更新消息数量的通知
 */
+(void)deleteUpdateMessageCountNotify:(id)observe object:(id)object;

/**
 * 发送 更新消息数量的通知
 */
+(void)postUpdateMessageCountNotify:(id)object UserInfo:(id)userInfo;

#pragma mark 司机的位置信息的通知
/**
 * 添加 更新司机位置信息的通知
 */
+(void)addUpdateDriverLocationNotify:(id)observer Selector:(SEL)selector object:(id)object;

/**
 * 移除 更新司机位置信息的通知
 */
+(void)deleteUpdateDriverLocationNotify:(id)observe object:(id)object;

/**
 * 发送 更新司机位置信息的通知
 */
+(void)postUpdateDriverLocationNotify:(id)object UserInfo:(id)userInfo;

#pragma mark 用户提交订单的通知
/**
 * 添加 用户提交订单的通知
 */
+(void)addUserComitOrderNotify:(id)observer Selector:(SEL)selector object:(id)object;

/**
 * 移除 用户提交订单的通知
 */
+(void)deleteUserComitOrderNotify:(id)observe object:(id)object;

/**
 * 发送 用户提交订单的通知
 */
+(void)postUserComitOrderNotify:(id)object UserInfo:(id)userInfo;

#pragma mark 司机抢单后一对一的通知
/**
 * 添加 司机抢单后一对一的通知
 */
+(void)addDriverAndUserOneByOneNotify:(id)observer Selector:(SEL)selector object:(id)object;

/**
 * 移除 司机抢单后一对一的通知
 */
+(void)deleteDriverAndUserOneByOneNotify:(id)observe object:(id)object;

/**
 * 发送 司机抢单后一对一的通知
 */
+(void)postDriverAndUserOneByOneNotify:(id)object UserInfo:(id)userInfo;

#pragma mark 用户取消订单的通知
/**
 * 添加 用户取消订单的通知
 */
+(void)addUserCancleOrderNotify:(id)observer Selector:(SEL)selector object:(id)object;

/**
 * 移除 用户取消订单的通知
 */
+(void)deleteUserCancleOrderNotify:(id)observe object:(id)object;

/**
 * 发送 用户取消订单的通知
 */
+(void)postUserCancleOrderNotify:(id)object UserInfo:(id)userInfo;

#pragma mark 司机结束订单的通知
/**
 * 添加 司机结束订单的通知
 */
+(void)addDriverDonwOrderNotify:(id)observer Selector:(SEL)selector object:(id)object;

/**
 * 移除 司机结束订单的通知
 */
+(void)deleteDriverDonwOrderNotify:(id)observe object:(id)object;

/**
 * 发送 司机结束订单的通知
 */
+(void)postDriverDonwOrderNotify:(id)object UserInfo:(id)userInfo;

/**
 * 发送 司机登录的通知
 */
+(void)addDriverLoginNotify:(id)observer Selector:(SEL)selector object:(id)object;
+(void)deleteDriverLoginNotify:(id)observe object:(id)object;
+(void)postDriverLoginNotify:(id)object UserInfo:(id)userInfo;

@end
