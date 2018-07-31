//
//  PostManWithChainedConnect.h
//  FragrantTown
//
//  Created by JobNewMac1 on 16/9/23.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostManWithChainedConnect : NSObject
/**
 * postman的数组,会按照数组顺序依次请求
 */
@property (nonatomic ,strong) NSArray *groups;

/**
 * 发起链式 post请求
 */
-(void)chainedPost:(void (^)(NSDictionary *results))Done;

/**
 * 发起链式 Get请求
 */
-(void)chainedGet:(void (^)(NSDictionary *results))Done;
@end
