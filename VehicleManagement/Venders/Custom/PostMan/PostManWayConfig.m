//
//  PostManWayConfig.m
//  FragrantTown
//
//  Created by JobNewMac1 on 16/8/23.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "PostManWayConfig.h"
static PostManWayConfig *_config;
@implementation PostManWayConfig
+(instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _config = [PostManWayConfig new];
        _config.timeoutInterval = 30;
        _config.configPath = RequestPrefix
        _config.rootParameters = [UserInfoSkills getUserInfo:UserInfoSkillsType_Token];
        _config.accessType = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html", nil];
    });
    return _config;
}
@end
