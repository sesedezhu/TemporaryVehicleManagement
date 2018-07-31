//
//  NSString+LNCustomSkill.h
//  FragrantTown
//
//  Created by liu on 16/8/13.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (LNCustomSkill)
-(CGFloat)LNCalulateStringHeightWithFont:(UIFont *)font Width:(CGFloat)width;

-(NSDate *)LNConvertStringToDateWithDateForamter:(NSString *)dateForamter;

-(NSString *)LNGetDateStringDateFormater;

-(NSURL *)LNConvertStringToURL;

@end
