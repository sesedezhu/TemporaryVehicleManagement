//
//  MBProgressHUD+LNMBProgress.m
//  FragrantTown
//
//  Created by liu on 16/8/25.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "MBProgressHUD+LNMBProgress.h"
#import <objc/runtime.h>

static const void *LNMBProgressIdentiferKey = &LNMBProgressIdentiferKey;

@implementation MBProgressHUD (LNMBProgress)
-(NSString *)LNMBProgressIdentifer {
    return objc_getAssociatedObject(self, LNMBProgressIdentiferKey);
}

-(void)setLNMBProgressIdentifer:(NSString *)LNMBProgressIdentifer {
     objc_setAssociatedObject(self, LNMBProgressIdentiferKey, LNMBProgressIdentifer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
