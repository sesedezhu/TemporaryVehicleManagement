//
//  AppDelegate+PostManSkill.m
//  FragrantTown
//
//  Created by JobNewMac1 on 16/8/23.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "AppDelegate+PostManSkill.h"
#import "PostManWayConfig.h"


#warning 测试、开发、环境 时需要修改 bundleID、证书、百度地图KEY、百度导航KEY、百度推送KEY、百度推送BPushMode

@implementation AppDelegate (PostManSkill)
-(void)configurePostManWithType:(PostManType)type {
    PostManWayConfig *config = [PostManWayConfig sharedInstance];
    switch (type) {
        case PostManType_Test:
            config.configPath = PostManTypeTest
            break;
        case PostManType_Dev:
            config.configPath = PostManTypeDev
            break;
        case PostManType_Release:
            config.configPath = PostManTypeReleaseNLW
            break;
        default:
            break;
    }
    config.timeoutInterval = 30;
    config.accessType = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html", nil];
}

#warning  *****************************  司机端  个人版发布  ****************************
/*
 一、
 1、App Store上架，即在哪里玩苹果开发者账号上传项目；
 2、App Store下载到用户使用；
 3、百度地图、百度推送、融云，APP应用(KEY)都在手机号(13518833380)中
 
 二、
 1、上传App Store前必须有所改动，百度推送、百度地图、融云(停用,无需改动)
 2、百度推送修改SDK KEY : AtjOeaMY0s5jFcslVGHgfoFc（车辆司机端）
 3、百度地图修改SDK KEY : 3lRY8qN3gegPPQuriD6M4dvXERo7rihx（车辆司机端）
 4、bundle id         : com.naliwan.www.CamperDriver
 5、APP名称            : 我房打车司机端
 6、测试或发布证书随之改变。
 */


#warning *****************************  司机端  企业版发布  ****************************
/*
 一、
 1、企业版上架，即在蒲公英上传项目；
 2、二维码或链接下载到用户使用；
 3、证书使用为 汇众 企业版开发账号；
 4、百度地图、百度推送、融云，APP应用(KEY)都在手机号(13518833380)中
 
 二、
 1、上传蒲公英前必须有所改动，百度推送、百度地图、融云(停用,无需改动)
 2、百度推送修改SDK KEY :
 3、百度地图修改SDK KEY : nrgIl4UTLFX2qGefWy6gOGdmzcFVG0Zp（车辆司机端iOS）
 4、bundle id         : com.naliwan.www.VehicleDriver
 5、APP名称            : 司机端
 6、测试或发布证书随之改变。
 
 三、
 蒲公英 下载地址链接地址：
 iOS打车司机端 https://www.pgyer.com/HPs6
 密码：naliwan12345
 */

@end
