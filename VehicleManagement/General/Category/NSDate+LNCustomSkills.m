//
//  NSDate+LNCustomSkills.m
//  FragrantTown
//
//  Created by liu on 16/8/13.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "NSDate+LNCustomSkills.h"

@implementation NSDate (LNCustomSkills)

-(NSDate *)LNLocaleDate {
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: self];
    NSDate *localeDate = [self  dateByAddingTimeInterval: interval];
    return localeDate;
}

-(NSDictionary *)LNTimeInfo {
    NSDate *date = self;

    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    [calendar setFirstWeekday:1];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    comps = [calendar components:unitFlags fromDate:newDate];
    
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSInteger hour = [comps hour];
    NSInteger minute = [comps minute];
    NSInteger second = [comps second];
    NSLog(@"%@",comps);
    
    NSDictionary *dic = @{
                          @"year":[NSString stringWithFormat:@"%lu",(long)year],
                          @"month":[NSString stringWithFormat:@"%lu",(long)month],
                          @"day":[NSString stringWithFormat:@"%lu",(long)day],
                          @"week":[self LNTimeWeek],
                          @"hour":[NSString stringWithFormat:@"%lu",(long)hour],
                          @"minute":[NSString stringWithFormat:@"%lu",(long)minute],
                          @"second":[NSString stringWithFormat:@"%lu",(long)second],
                          };
    return dic;
}

-(NSString *)LNTimeWeek {/*---------------*/
    
    NSDate *date = self;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    [calendar setFirstWeekday:1];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    comps = [calendar components:unitFlags fromDate:date];
    
    NSInteger week = [comps weekday];
    
    NSString *zou = @"";
    switch (week) {
        case 1:
            zou = @"周末";
            break;
        case 2:
            zou = @"周一";
            break;
        case 3:
            zou = @"周二";
            break;
        case 4:
            zou = @"周三";
            break;
        case 5:
            zou = @"周四";
            break;
        case 6:
            zou = @"周五";
            break;
        case 7:
            zou = @"周六";
            break;
            
        default:
            break;
    }
    
    return zou;
}

-(NSString *)LNTimeYear {
    return [[self LNTimeInfo] objectForKey:@"year"];
}

-(NSString *)LNTimeMonth {
    return [[self LNTimeInfo] objectForKey:@"month"];
}

-(NSString *)LNTimeDay {
    return [[self LNTimeInfo] objectForKey:@"day"];
}

-(NSString *)LNTimeHour {
    return [[self LNTimeInfo] objectForKey:@"hour"];
}

-(NSString *)LNTimeMinute {
    return [[self LNTimeInfo] objectForKey:@"minute"];
}
-(NSString *)LNTimeSecend {
    return [[self LNTimeInfo] objectForKey:@"second"];
}

-(NSString *)LNTimeNormalFormatString {
    
    NSDate *now = [[NSDate date] LNLocaleDate];
//    NSDate *localdate = [self LNLocaleDate];
    NSTimeInterval inv = [now timeIntervalSinceDate:self];
    if (inv < 0) {
        return @"未来";
    } else if (inv <= 20 && inv >= 0) { //小于20秒
        return @"刚刚";
    } else if (inv > 20 && inv < 60) {
        return [NSString stringWithFormat:@"%f秒前",inv];
    } else if (inv / 60 < 60) {
        return [NSString stringWithFormat:@"%lu分钟前",(long)(inv/60)];
    } else if (inv / (60 * 60) < 24) {
        return [NSString stringWithFormat:@"%lu小时前",(long)(inv/(60 * 60))];
    } else if (inv / (60 * 60 * 24) <= 5) {
        return [NSString stringWithFormat:@"%lu天前",(long)(inv/(60 * 60 * 24))];
    }
    NSDateFormatter *formate = [NSDateFormatter new];
    [formate setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formate setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    return [formate stringFromDate:self];
}

-(NSString *)LNTimeNormalFormatStringStyleTwo {
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calender setFirstWeekday:2];
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *fromeDate;
    NSDate *toDate;
    [calender rangeOfUnit:NSCalendarUnitDay startDate:&fromeDate interval:NULL forDate:[NSDate date]];
    [calender rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:self];
    NSDateComponents *daycomponents = [calender components:NSCalendarUnitDay fromDate:fromeDate toDate:toDate options:NSCalendarWrapComponents];
    NSInteger day = daycomponents.day;
    if (day == 0) {
        NSDictionary *dic = [self LNTimeInfo];
        return [NSString stringWithFormat:@"今天 %@:%@",dic[@"hour"],dic[@"minute"]];
    } else if (day == 1) {
        NSDictionary *dic = [self LNTimeInfo];
        return [NSString stringWithFormat:@"明天 %@:%@",dic[@"hour"],dic[@"minute"]];
    }
    return [formatter stringFromDate:self];
}

@end
