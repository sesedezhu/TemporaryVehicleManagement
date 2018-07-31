//
//  UpdateUserInfoNetWork.m
//  Camper
//
//  Created by liu on 2016/9/25.
//  Copyright © 2016年 ning. All rights reserved.
//

#import "UpdateUserInfoNetWork.h"

@implementation UpdateUserInfoNetWork
+(void)UpdateUserinfoWithType:(UpdateUserInfoNetWorkType)type Extend:(id)extend Success:(void (^)(id response))SuccessLogin Faliure:(void (^)(NSString * error))FaliureLogin{
    PostManNormalWithRootParematers *postman = [PostManNormalWithRootParematers new];
    postman.path = UserUpdateUserOrDriver;
    postman.params = @{@"type":@"driver"};
    switch (type) {
        case UpdateUserInfoNetWorkType_NickName:
            postman.choiceParams = @{@"realName":extend};
            break;
        case UpdateUserInfoNetWorkType_Sex:
        {
            NSString *temp = [(NSString *)extend isEqualToString:@"男"]?@"1":@"0";
            postman.choiceParams = @{@"sex":temp};
        }
            break;
        case UpdateUserInfoNetWorkType_Phone:
            postman.choiceParams = @{@"phone":extend};
            break;
        default:
            break;
    }
    [postman POST:^(id response) {
        SuccessLogin(response);
    } Faliure:^(NSString *errorStr) {
        FaliureLogin(errorStr);
    }];
}
@end
