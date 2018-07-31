//
//  SimpleEnterBuilding.h
//  Cycling
//
//  Created by JobNewMac1 on 16/9/7.
//  Copyright © 2016年 JobNew. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,SimpleEnterBuildingStyle) {
    SimpleEnterBuildingStyle_NickName = 0,
    SimpleEnterBuildingStyle_Phone
};

@interface SimpleEnterBuilding : UIViewController
@property (nonatomic ,assign) SimpleEnterBuildingStyle style;
-(instancetype)initWithStyle:(SimpleEnterBuildingStyle)style AndText:(NSString *)text;
@end
