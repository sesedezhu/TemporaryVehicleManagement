//
//  PostManWayConfig.h
//  FragrantTown
//
//  Created by JobNewMac1 on 16/8/23.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostManWayConfig : NSObject
+(instancetype)sharedInstance;
/**
 * 配置网络请求的默认地址
 */
@property (nonatomic ,strong) NSString *configPath;

/**
 * 配置网络请求的固定的根参数
 * eg. /user/collectionShopByTypeId/{token} 中的token
 */
@property (nonatomic ,strong) NSString *rootParameters;

/**
 * 配置网络请求的默认超时时间
 */
@property (nonatomic ,assign) NSTimeInterval timeoutInterval;

/**
 * 配置网络请求的响应的类型
 */
@property (nonatomic ,strong) NSSet *accessType;


@end
