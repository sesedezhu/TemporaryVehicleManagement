//
//  NSString+LNCustomSkill.m
//  FragrantTown
//
//  Created by liu on 16/8/13.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "NSString+LNCustomSkill.h"

@implementation NSString (LNCustomSkill)
-(CGFloat)LNCalulateStringHeightWithFont:(UIFont *)font Width:(CGFloat)width {
    if (self == nil || [self isEqualToString:@""]) {
        return 0;
    }
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size.height;
}

-(NSDate *)LNConvertStringToDateWithDateForamter:(NSString *)dateForamter {
    NSDateFormatter *formate = [NSDateFormatter new];
    [formate setDateFormat:dateForamter];
    [formate setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSDate *date = [formate dateFromString:self];
    return date;
}

-(NSString *)LNGetDateStringDateFormater {
    NSString *commentstr = @"/";
    if ([self rangeOfString:@"-"].location != NSNotFound) {
        commentstr = @"-";
    }
    NSString *formatterStr = @"";
    NSArray *array = [self componentsSeparatedByString:@":"];
    if (array.count == 3) {
        formatterStr = [NSString stringWithFormat:@"yyyy%@MM%@dd HH:mm:ss",commentstr,commentstr];
    } else if (array.count == 2) {
        formatterStr = [NSString stringWithFormat:@"yyyy%@MM%@dd HH:mm",commentstr,commentstr];
    } else {
        NSArray *temp = [self componentsSeparatedByString:@" "];
        if (temp.count == 2) {
            formatterStr = [NSString stringWithFormat:@"yyyy%@MM%@dd HH",commentstr,commentstr];
        } else {
            formatterStr = [NSString stringWithFormat:@"yyyy%@MM%@dd",commentstr,commentstr];
        }
    }
    return formatterStr;
}

-(NSURL *)LNConvertStringToURL {

    NSURL *URL = nil;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
       URL = [NSURL URLWithString:[self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]];
    } else {
        URL = [NSURL URLWithString:[self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    
    NSLog(@"\n字符串:%@\n转URL:%@\n",self,URL);
    
    return URL;
}

-(BOOL)LNIsEmpty {
    if ([self isEqualToString:@""] || self == nil || [self isEqualToString:@" "]) {
        return YES;
    }
    return NO;
}

@end
