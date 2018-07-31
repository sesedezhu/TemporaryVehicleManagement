//
//  LNBuildingAlertController.h
//  FragrantTown
//
//  Created by liu on 16/8/17.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LNBuildingAlertController : UIAlertController
+(void)showOnBuilding:(UIViewController *)vc Titles:(NSArray *)titles Done: (void (^)(NSString *done))done;
+(void)showOnBuilding:(UIViewController *)vc Message:(NSString *)message Titles:(NSArray *)titles Done: (void (^)(NSString *done))done;
@end
