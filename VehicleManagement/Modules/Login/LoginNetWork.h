//
//  LoginNetWork.h
//  Camper
//
//  Created by liu on 2016/9/25.
//  Copyright © 2016年 ning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginNetWork : NSObject
///登录 并且 刷新用户信息
+(void)loginWithPhone:(NSString *)phone Password:(NSString *)password Success:(void (^)(id response))SuccessLogin Faliure:(void (^)(NSString * error))FaliureLogin;


///获取司机的状态
+(void)getDriverStatusSuccess:(void (^)(id response))Success Faliure:(void (^)(NSString * error))Faliure;

@end
