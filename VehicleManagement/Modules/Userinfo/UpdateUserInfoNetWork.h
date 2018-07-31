//
//  UpdateUserInfoNetWork.h
//  Camper
//
//  Created by liu on 2016/9/25.
//  Copyright © 2016年 ning. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,UpdateUserInfoNetWorkType) {
    UpdateUserInfoNetWorkType_NickName = 0,
    UpdateUserInfoNetWorkType_Sex,
    UpdateUserInfoNetWorkType_Phone,
};

@interface UpdateUserInfoNetWork : NSObject
+(void)UpdateUserinfoWithType:(UpdateUserInfoNetWorkType)type Extend:(id)extend Success:(void (^)(id response))SuccessLogin Faliure:(void (^)(NSString * error))FaliureLogin;
@end
