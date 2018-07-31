//
//  MessageListNetWork.h
//  Camper
//
//  Created by JobNewMac1 on 16/9/30.
//  Copyright © 2016年 ning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageListNetWork : NSObject
+(void)messageListParams:(NSDictionary *)params Success:(void (^)(id response))Success Faliure:(void (^)(NSString * error))Faliure;
@end
