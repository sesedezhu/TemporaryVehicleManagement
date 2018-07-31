//
//  CacheTool.h
//  CamperDriver
//
//  Created by ZQWFMac on 2018/7/25.
//  Copyright © 2018年 JobNew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheTool : NSObject

+ (NSString *)getCacheSizeWithFilePath;

+ (void) clearSize;

@end
