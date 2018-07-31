//
//  PostManNormal.h
//  FragrantTown
//
//  Created by JobNewMac1 on 16/8/23.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , POSTMANUPLOADMIMETYPE) {
    POSTMANUPLOADMIMETYPE_IMAGE = 0,
};

@interface PostManNormal : NSObject

/**
 * 是否具有根参数
 * YES or NO
 */
@property (nonatomic ,assign) BOOL haveRootParameters;

/**
 * 根参数 不重写将使用 configure中配置的根参数
 */
@property (nonatomic ,strong) NSString *rootParameters;

/**
 * 请求的路径
 * eg. /user/collectionShopByTypeId
 */
@property (nonatomic ,strong) NSString *path;

/**
 * 请求的参数
 */
@property (nonatomic ,strong) NSDictionary *params;

/**
 * 请求的可选参数
 */
@property (nonatomic ,strong) NSDictionary *choiceParams;

/**
 * 是否将token作为一个可选参数加
 * Yes 表示将token插入到可选参数中 No 不传入token
 */
@property (nonatomic ,assign) BOOL tokenParma;

/**
 * 上传的文件的数组
 * 没有文件可不传
 */
@property (nonatomic ,strong) NSArray *files;

/**
 * 上传的文件的类型
 * 与files配套使用
 */
@property (nonatomic ,assign) POSTMANUPLOADMIMETYPE mimeType;

/**
 * 上传的文件的名称
 * 与files配套使用
 */
@property (nonatomic ,strong) NSString *fileName;

/**
 * 请求参数需要的的Key
 * 如果不填写,将直接使用params传入的参数
 **/
@property (nonatomic ,strong) NSArray *paramKeys;

/**
 * 配置网络请求的超时时间
 * 不传将使用config中设置的超时时间
 */
@property (nonatomic ,assign) NSTimeInterval timeoutInterval;

/**
 * 配置网络请求的响应的类型
 * 不传将使用config中设置的类型
 */
@property (nonatomic ,strong) NSSet *accessType;

/**
 * 发起 GET 请求
 */
-(void)GET:(void (^)(id response))Success
   Faliure:(void (^)(NSString *errorStr))Faliure;

/**
 * 发起 POST 请求
 */
-(void)POST:(void (^)(id response))Success
    Faliure:(void (^)(NSString *errorStr))Faliure;
-(void)POST2:(void (^)(id response))Success
    Faliure:(void (^)(NSString *errorStr))Faliure;

/**
 * 上传文件
 */
-(void)UPLOAD:(void (^)(CGFloat progress))progress
      Success:(void (^)(id response))Success
          Faliure:(void (^)(NSString *errorStr))Faliure;
@end

