//
//  UIBarItem+LNCustomeSkill.m
//  FragrantTown
//
//  Created by JobNewMac1 on 16/8/12.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "UIBarItem+LNCustomeSkill.h"
#import <objc/runtime.h>

static const void *lnBarItemCustomeViewControllerKey = &lnBarItemCustomeViewControllerKey;

@implementation UIBarItem (LNCustomeSkill)
-(UIViewController *)lnBarItemCustomeViewController {
    return objc_getAssociatedObject(self, lnBarItemCustomeViewControllerKey);
}

-(void)setLnBarItemCustomeViewController:(UIViewController *)lnBarItemCustomeViewController {
    objc_setAssociatedObject(self, lnBarItemCustomeViewControllerKey, lnBarItemCustomeViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
