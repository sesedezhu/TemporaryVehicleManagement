//
//  AppDelegate+PostManSkill.h
//  FragrantTown
//
//  Created by JobNewMac1 on 16/8/23.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "AppDelegate.h"

typedef NS_ENUM(NSInteger,PostManType) {
    ///测试环境
    PostManType_Test = 0,
    ///开发环境
    PostManType_Dev,
    ///正式环境
    PostManType_Release
};

@interface AppDelegate (PostManSkill)
/**
 * 初始化网络请求相关操作
 */
-(void)configurePostManWithType:(PostManType)type;
@end
