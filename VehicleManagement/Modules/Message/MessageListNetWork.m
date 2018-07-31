//
//  MessageListNetWork.m
//  Camper
//
//  Created by JobNewMac1 on 16/9/30.
//  Copyright © 2016年 ning. All rights reserved.
//

#import "MessageListNetWork.h"

@implementation MessageListNetWork
+(void)messageListParams:(NSDictionary *)params Success:(void (^)(id response))Success Faliure:(void (^)(NSString * error))Faliure {
    PostManNormalWithRootParematers *postman = [PostManNormalWithRootParematers new];
    postman.path = NoticeList;
    postman.params = @{@"type":@"driver"};
    if (params) {
        NSString *pageStr = params[@"page"];
        NSString *row = params[@"rows"];
        postman.choiceParams = @{@"page":pageStr,
                                 @"rows":row};
    }
    
    [postman POST:^(id response) {
        
        NSInteger i = 0;
        for (NSDictionary *dic in response[@"data"]) {
            if ([dic[@"readed"] boolValue] == NO) {
                i ++;
            }
        }
        [UserInfoSkills updateUserInfo:[NSString stringWithFormat:@"%ld",(long)i] Type:UserInfoSkillsType_MessageCount];
        [WorldNotifyManager postUpdateMessageCountNotify:nil UserInfo:nil];
        
        Success(response);
    } Faliure:^(NSString *errorStr) {
        Faliure(errorStr);
    }];
}


@end
