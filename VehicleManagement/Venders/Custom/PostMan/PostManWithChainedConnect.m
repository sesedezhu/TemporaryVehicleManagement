//
//  PostManWithChainedConnect.m
//  FragrantTown
//
//  Created by JobNewMac1 on 16/9/23.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "PostManWithChainedConnect.h"
#import "PostManNormal.h"

typedef NS_ENUM(NSInteger ,PostManWithChainedConnectType) {
    PostManWithChainedConnectType_Post = 0 ,
    PostManWithChainedConnectType_Get,
};

@interface PostManWithChainedConnect()
///当前请求的是第几个
@property (nonatomic ,assign) NSInteger connectIndex;
@property (nonatomic ,strong) NSMutableDictionary *responsesDic;
@property (nonatomic ,strong) NSMutableDictionary *errorsDic;
@property (nonatomic ,assign) PostManWithChainedConnectType type;
@property (nonatomic ,strong) void (^Done)(NSDictionary *results);
@end

@implementation PostManWithChainedConnect
-(void)chainedPost:(void (^)(NSDictionary *results))Done {
    if (self.groups.count <= 0) {
        NSLog(@"\n链式POST请求失败,请求的列表为空\n");
        return;
    }
    NSLog(@"\n发起链式请求\n");
#ifdef DEBUG
    int i = 0;
    for (PostManNormal *postman in self.groups) {
        NSLog(@"\n请求:%d 请求路径:%@\n",i,postman.path);
        i++;
    }
#else
    
#endif
    self.type = PostManWithChainedConnectType_Post;
    self.Done = Done;
    self.connectIndex = 0;
    [self.responsesDic removeAllObjects];
    [self.errorsDic removeAllObjects];
    [self startConnectChainer];
}

-(void)chainedGet:(void (^)(NSDictionary *results))Done; {
    if (self.groups.count <= 0) {
        NSLog(@"\n链式GET请求失败,请求的列表为空\n");
        return;
    }
    NSLog(@"\n发起链式请求\n");
#ifdef DEBUG
    int i = 0;
    for (PostManNormal *postman in self.groups) {
        NSLog(@"\n请求:%d 请求路径:%@\n",i,postman.path);
        i++;
    }
#else
    
#endif
    self.type = PostManWithChainedConnectType_Get;
    self.Done = Done;
    self.connectIndex = 0;
    [self.responsesDic removeAllObjects];
    [self.errorsDic removeAllObjects];
    [self startConnectChainer];
}

///开始请求
-(void)startConnectChainer {
    if (self.connectIndex >= self.groups.count) {
        self.Done(@{@"Success":self.responsesDic,@"Error":self.errorsDic});
        return;
    }
    PostManNormal *postman = self.groups[self.connectIndex];
    switch (self.type) {
        case PostManWithChainedConnectType_Post:
        {
            [postman POST:^(id response) {
                [self.responsesDic setObject:response forKey:[NSString stringWithFormat:@"%ld",(long)self.connectIndex]];
                [self changgePostIndex];
            } Faliure:^(NSString *errorStr) {
                [self.errorsDic setObject:errorStr forKey:[NSString stringWithFormat:@"%ld",(long)self.connectIndex]];
                [self changgePostIndex];
            }];

        }
            break;
        case PostManWithChainedConnectType_Get:
        {
            [postman GET:^(id response) {
                [self.responsesDic setObject:response forKey:[NSString stringWithFormat:@"%ld",(long)self.connectIndex]];
                [self changgePostIndex];

            } Faliure:^(NSString *errorStr) {
                [self.errorsDic setObject:errorStr forKey:[NSString stringWithFormat:@"%ld",(long)self.connectIndex]];
                [self changgePostIndex];
            }];
        }
            break;
        default:
            break;
    }
}

-(void)changgePostIndex {
    self.connectIndex += 1;
    [self startConnectChainer];
}

#pragma mark setter and getter
-(NSMutableDictionary *)responsesDic {
    if (!_responsesDic) {
        _responsesDic = [NSMutableDictionary new];
    }
    return _responsesDic;
}

-(NSMutableDictionary *)errorsDic {
    if (!_errorsDic) {
        _errorsDic = [NSMutableDictionary new];
    }
    return _errorsDic;
}

@end
