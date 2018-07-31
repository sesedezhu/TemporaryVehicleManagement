//
//  LNMBProgressHUDSkill.h
//  FragrantTown
//
//  Created by liu on 16/8/25.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface LNMBProgressHUDSkill : NSObject
+(void)LNMBProgressHUDINView:(UIView *)view;
+(void)LNMBProgressHUDHiddenINView:(UIView *)view;
+(void)LNMBProgressHUDShowWord:(NSString *)word INView:(UIView *)view;
+(void)LNMBProgressHUDNoHiddenShowWord:(NSString *)word INView:(UIView *)view;
+(MBProgressHUD *)LNMBProgressProgressHUDINView:(UIView *)view;
@end
