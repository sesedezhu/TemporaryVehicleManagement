//
//  LNMBProgressHUDSkill.m
//  FragrantTown
//
//  Created by liu on 16/8/25.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "LNMBProgressHUDSkill.h"

#import "ShortuctKeyForMethod.h"
#import "MBProgressHUD+LNMBProgress.h"
#import "NSString+LNCustomSkill.h"

#import "UIColor+LNCustomColorSkill.h"

@implementation LNMBProgressHUDSkill

+(void)LNMBProgressHUDINView:(UIView *)view {
    if (view == nil) {
        view = LNApplicationWindows;
    }
    [MBProgressHUD showHUDAddedTo:view animated:YES];
}

+(void)LNMBProgressHUDHiddenINView:(UIView *)view {
    if (view == nil) {
        view = LNApplicationWindows;
    }
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+(void)LNMBProgressHUDShowWord:(NSString *)word INView:(UIView *)view {
    if (view == nil) {
        view = LNApplicationWindows;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = word;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
}

+(void)LNMBProgressHUDNoHiddenShowWord:(NSString *)word INView:(UIView *)view {
    if (view == nil) {
        view = LNApplicationWindows;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.detailsLabel.text = word;
}

+(MBProgressHUD *)LNMBProgressProgressHUDINView:(UIView *)view {
    if (view == nil) {
        view = LNApplicationWindows;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    return hud;
}

@end
