//
//  PostManNormal.m
//  FragrantTown
//
//  Created by JobNewMac1 on 16/8/23.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "PostManNormal.h"
#import "PostManWayConfig.h"
#import "AFNetworking.h"
#import "Cooly.h"

@implementation PostManNormal

-(void)GET:(void (^)(id))Success Faliure:(void (^)(NSString *))Faliure {
    PostManWayConfig *config = [PostManWayConfig sharedInstance];
    
    NSString *baseUrl = config.configPath;
    
    NSString *url = nil;
    if (self.haveRootParameters) {
        NSString *rootparamars = self.rootParameters?:config.rootParameters;
        url = [NSString stringWithFormat:@"%@%@/%@?",baseUrl,self.path,rootparamars];
    } else {
        url = [NSString stringWithFormat:@"%@%@?",baseUrl,self.path];
    }
    
    NSArray *tempKeys = nil;
    if (self.paramKeys.count > 0) {
        tempKeys = self.paramKeys;
    } else {
        tempKeys = self.params.allKeys;
    }
    
    NSString *paramsStr = @"";
    int i = 0;
    for (NSString *tempKey in tempKeys) {
        if (i == 0) {
            paramsStr = [NSString stringWithFormat:@"%@=%@",tempKey,self.params[tempKey]];
        } else {
            paramsStr = [NSString stringWithFormat:@"%@&%@=%@",paramsStr,tempKey,self.params[tempKey]];
        }
        i++;
    }
    
    [self insertTokenToParam];
    
    i = 0;
    NSString *choiceParamsStr = @"";
    for (NSString *tempKey in self.choiceParams.allKeys) {
        if (i == 0) {
            choiceParamsStr = [NSString stringWithFormat:@"%@=%@",tempKey,self.choiceParams[tempKey]];
        } else {
            choiceParamsStr = [NSString stringWithFormat:@"%@&%@=%@",choiceParamsStr,tempKey,self.choiceParams[tempKey]];
        }
        i++;
    }
    
    if (![Cooly LNIsEmpty:choiceParamsStr]) {
        if (![Cooly LNIsEmpty:paramsStr]) {
            paramsStr = [NSString stringWithFormat:@"%@&%@",paramsStr,choiceParamsStr];
        } else {
            paramsStr = choiceParamsStr;
        }
    }
    
    url = [NSString stringWithFormat:@"%@%@",url,paramsStr];
    
    if (self.haveRootParameters) {
        NSLog(@"\nGET请求:\nBaseUrl:%@\nPath:%@\n参数:%@\n根参数:%@\nURL:%@\n",baseUrl,self.path,paramsStr,self.rootParameters?:config.rootParameters,url);
    } else {
        NSLog(@"\nGET请求:\nBaseUrl:%@\nPath:%@\n参数:%@\nURL:%@\n",baseUrl,self.path,paramsStr,url);
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeoutInterval>0?:config.timeoutInterval;
    manager.responseSerializer.acceptableContentTypes = self.accessType?:config.accessType;
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"\nGET请求:%@\n成功返回结果:%@\n",url,responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([responseObject[@"reCode"] integerValue] == 301) {
                Faliure(responseObject[@"codeTxt"]);
                NSLog(@"codeTxt:%@",responseObject[@"codeTxt"]);
            }
            else if (responseObject[@"data"]) {
                Success(responseObject[@"data"]);
                NSLog(@"data:%@",responseObject[@"data"]);
            }
        } else {
            Success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"\nGET请求:%@\n失败返回错误:%@\n错误描述:%@\n",url,error,[error.userInfo objectForKey:@"NSLocalizedDescription"]);
        
        Faliure([error.userInfo objectForKey:@"NSLocalizedDescription"]);
    }];
}

-(void)POST:(void (^)(id))Success Faliure:(void (^)(NSString *))Faliure {
    PostManWayConfig *config = [PostManWayConfig sharedInstance];
    
    NSString *baseUrl = config.configPath;
    NSString *url = nil;
    if (self.haveRootParameters) {
        NSString *rootparamars = self.rootParameters?:config.rootParameters;
        url = [NSString stringWithFormat:@"%@%@/%@?",baseUrl,self.path,rootparamars];
    } else {
        url = [NSString stringWithFormat:@"%@%@?",baseUrl,self.path];
    }
    
    NSMutableDictionary *tempParamsDic = nil;
    if (self.paramKeys.count > 0) {
        tempParamsDic = [NSMutableDictionary new];
        for (NSString *tempkey in self.paramKeys) {
            if (self.params[tempkey]) {
                [tempParamsDic setObject:self.params[tempkey] forKey:tempkey];
            } else {
                NSLog(@"\n手动参数不存在：%@\n",tempkey);
            }
        }
    } else {
        tempParamsDic = [NSMutableDictionary dictionaryWithDictionary:self.params];
    }
    
    [self insertTokenToParam];
    
    if (self.choiceParams.count > 0) {
        for (NSString *tempKey in self.choiceParams.allKeys) {
            [tempParamsDic setObject:self.choiceParams[tempKey] forKey:tempKey];
        }
    }
    
    if (self.haveRootParameters) {
        NSLog(@"\nPOST请求:\nBaseUrl:%@\nPath:%@\n参数:%@\n根参数:%@\nURL:%@\n",baseUrl,self.path,tempParamsDic,self.rootParameters?:config.rootParameters,url);
    } else {
        NSLog(@"\nPOST请求:\nBaseUrl:%@\nPath:%@\n参数:%@\nURL:%@\n",baseUrl,self.path,tempParamsDic,url);
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeoutInterval>0?:config.timeoutInterval;
    manager.responseSerializer.acceptableContentTypes = self.accessType?:config.accessType;
    [manager POST:url parameters:tempParamsDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"\nPOST请求:%@\n成功返回结果:%@\n",url,responseObject);
        NSLog(@"reCode:%@ codeTxt:%@",responseObject[@"reCode"],responseObject[@"codeTxt"]);
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([responseObject[@"reCode"] integerValue] == 301) {
                if ([responseObject[@"codeTxt"] isEqualToString:@"failure"]) {
                    Faliure(responseObject[@"data"]);
                }else{
                    Faliure(responseObject[@"codeTxt"]);
                }
            }
            else if ([responseObject[@"reCode"] integerValue] == 302) {
                [UserInfoSkills clearUserInfo];
                [WorldNotifyManager postDriverLoginNotify:self UserInfo:nil];
            }
            else if ([responseObject[@"reCode"] integerValue] == 303) {
                Success(responseObject);
            }
            else if ([responseObject[@"reCode"] integerValue] == 398) {
                Success(responseObject);
            }
            else if (responseObject[@"data"]) {
                Success(responseObject[@"data"]);
            }
        } else {
            Success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"\nPOST请求:%@\n失败返回错误:%@\n错误描述:%@\n",url,error,[error.userInfo objectForKey:@"NSLocalizedDescription"]);
        
        Faliure([error.userInfo objectForKey:@"NSLocalizedDescription"]);
    }];
}

-(void)POST2:(void (^)(id))Success Faliure:(void (^)(NSString *))Faliure {
    PostManWayConfig *config = [PostManWayConfig sharedInstance];
    
    NSString *baseUrl = config.configPath;
    NSString *url = nil;
    if (self.haveRootParameters) {
        NSString *rootparamars = self.rootParameters?:config.rootParameters;
        url = [NSString stringWithFormat:@"%@%@/%@?",baseUrl,self.path,rootparamars];
    } else {
        url = [NSString stringWithFormat:@"%@%@?",baseUrl,self.path];
    }
    
    NSMutableDictionary *tempParamsDic = nil;
    if (self.paramKeys.count > 0) {
        tempParamsDic = [NSMutableDictionary new];
        for (NSString *tempkey in self.paramKeys) {
            if (self.params[tempkey]) {
                [tempParamsDic setObject:self.params[tempkey] forKey:tempkey];
            } else {
                NSLog(@"\n手动参数不存在：%@\n",tempkey);
            }
        }
    } else {
        tempParamsDic = [NSMutableDictionary dictionaryWithDictionary:self.params];
    }
    
    [self insertTokenToParam];
    
    if (self.choiceParams.count > 0) {
        for (NSString *tempKey in self.choiceParams.allKeys) {
            [tempParamsDic setObject:self.choiceParams[tempKey] forKey:tempKey];
        }
    }
    
    if (self.haveRootParameters) {
        NSLog(@"\nPOST请求:\nBaseUrl:%@\nPath:%@\n参数:%@\n根参数:%@\nURL:%@\n",baseUrl,self.path,tempParamsDic,self.rootParameters?:config.rootParameters,url);
    } else {
        NSLog(@"\nPOST请求:\nBaseUrl:%@\nPath:%@\n参数:%@\nURL:%@\n",baseUrl,self.path,tempParamsDic,url);
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeoutInterval>0?:config.timeoutInterval;
    manager.responseSerializer.acceptableContentTypes = self.accessType?:config.accessType;
    [manager POST:url parameters:tempParamsDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"\nPOST请求:%@\n成功返回结果:%@\n",url,responseObject);
        NSLog(@"reCode:%@ codeTxt:%@",responseObject[@"reCode"],responseObject[@"codeTxt"]);
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            Success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"\nPOST请求:%@\n失败返回错误:%@\n错误描述:%@\n",url,error,[error.userInfo objectForKey:@"NSLocalizedDescription"]);
        
        Faliure([error.userInfo objectForKey:@"NSLocalizedDescription"]);
    }];
}
#define PostManUploadFileMimeTypeImage @"image/png"

-(void)UPLOAD:(void (^)(CGFloat progress))progress
      Success:(void (^)(id response))Success
      Faliure:(void (^)(NSString *errorStr))Faliure {
    
    PostManWayConfig *config = [PostManWayConfig sharedInstance];
    NSString *baseUrl = config.configPath;
    NSString *url = nil;
    if (self.haveRootParameters) {
        NSString *rootparamars = self.rootParameters?:config.rootParameters;
        url = [NSString stringWithFormat:@"%@%@/%@?",baseUrl,self.path,rootparamars];
    } else {
        url = [NSString stringWithFormat:@"%@%@?",baseUrl,self.path];
    }
    
    NSMutableDictionary *tempParamsDic = nil;
    if (self.paramKeys.count > 0) {
        tempParamsDic = [NSMutableDictionary new];
        for (NSString *tempkey in self.paramKeys) {
            if (self.params[tempkey]) {
                [tempParamsDic setObject:self.params[tempkey] forKey:tempkey];
            } else {
                NSLog(@"\n手动参数不存在：%@\n",tempkey);
            }
        }
    } else {
        tempParamsDic = [NSMutableDictionary dictionaryWithDictionary:self.params];
    }
    
    [self insertTokenToParam];
    
    if (self.choiceParams.count > 0) {
        for (NSString *tempKey in self.choiceParams.allKeys) {
            [tempParamsDic setObject:self.choiceParams[tempKey] forKey:tempKey];
        }
    }
    
    if (self.haveRootParameters) {
        NSLog(@"\n上传文件请求:\nBaseUrl:%@\nPath:%@\n参数:%@\n根参数:%@\nURL:%@\n",baseUrl,self.path,tempParamsDic,self.rootParameters?:config.rootParameters,url);
    } else {
        NSLog(@"\n上传文件请求:\nBaseUrl:%@\nPath:%@\n参数:%@\nURL:%@\n",baseUrl,self.path,tempParamsDic,url);
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeoutInterval>0?:config.timeoutInterval;
    manager.responseSerializer.acceptableContentTypes = self.accessType?:config.accessType;
    [manager POST:url parameters:tempParamsDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (self.mimeType == POSTMANUPLOADMIMETYPE_IMAGE) {
            for (UIImage *image in self.files) {
                [formData appendPartWithFileData:UIImagePNGRepresentation([self scaleImage:image toKb:2]) name:self.fileName fileName:self.fileName mimeType:PostManUploadFileMimeTypeImage];
//                [formData appendPartWithFileData:UIImagePNGRepresentation([self imageByScalingAndCroppingForSize:CGSizeMake(306,408) withSourceImage:image]) name:self.fileName fileName:self.fileName mimeType:PostManUploadFileMimeTypeImage];
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"\n\n文件上传进度%f\n\n",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        progress(1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"\n上传文件请求:%@\n成功返回结果:%@\n",url,responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([responseObject[@"reCode"] integerValue] == 301) {
                Faliure(responseObject[@"codeTxt"]);
                NSLog(@"codeTxt:%@",responseObject[@"codeTxt"]);
            }
            else if (responseObject[@"data"]) {
                Success(responseObject[@"data"]);
                NSLog(@"data:%@",responseObject[@"data"]);
            }
        } else {
            Success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"\n上传文件请求:%@\n失败返回错误:%@\n错误描述:%@\n",url,error,[error.userInfo objectForKey:@"NSLocalizedDescription"]);
        Faliure([error.userInfo objectForKey:@"NSLocalizedDescription"]);
        
    }];
}
//这个方法可以封装一下，抽离出来
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize withSourceImage:(UIImage *)sourceImage
{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        //  CGFloat widthFactor = targetWidth / width;
        
        CGFloat widthFactor = targetWidth/ width;
        CGFloat heightFactor  =targetHeight/height;
        
        if (widthFactor>heightFactor) {
            scaleFactor = widthFactor;
        }else{
            scaleFactor = heightFactor;
        }
        
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if (widthFactor > heightFactor) {
            thumbnailPoint.y = (targetHeight-scaledHeight)*0.5;
        }else
        {
            thumbnailPoint.x = (targetWidth -scaledWidth)*0.5;
        }
        
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
    {
        NSLog(@"image error");
    }
    UIGraphicsEndImageContext();
    
    return newImage;
}
-(UIImage *)scaleImage:(UIImage *)image toKb:(NSInteger)kb{
    
    if (!image) {
        return image;
    }
    if (kb<1) {
        return image;
    }
    kb*=1024;
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > kb && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
        NSLog(@"当前大小:%fkb ********************",(float)[imageData length]/1024.0f);
    }
    LNDLog(@"当前大小:%fkb",(float)[imageData length]/1024.0f);
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

#pragma mark private method
/**
 * 插入token到可选参数中
 */
-(void)insertTokenToParam {
    if (self.tokenParma) {
        if (self.choiceParams) {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:self.choiceParams];
            [dic setObject:[PostManWayConfig sharedInstance].rootParameters?:@"" forKey:@"token"];
            self.choiceParams = dic;
        } else {
            self.choiceParams = @{@"token":[PostManWayConfig sharedInstance].rootParameters?:@""};
        }
    }
}

@end
