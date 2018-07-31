//
//  NSDate+LNCustomSkills.h
//  FragrantTown
//
//  Created by liu on 16/8/13.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LNCustomSkills)

/*
 * 时间差补偿
 */
-(NSDate *)LNLocaleDate;

/*
 * 时间装换成字符串
 * @return 刚刚 || 几分钟前 || 几小时前 || 几天前 || xxxx年xx月xx日 xx时xx分xx秒
 */
-(NSString *)LNTimeNormalFormatString;

/**
 * 时间转换为字符串
 * @return 今天: 09:13  || 明天：09：18 || xxxx年xx月xx日 xx时xx分
 */
-(NSString *)LNTimeNormalFormatStringStyleTwo;

/**
 * 获取时间信息
 */
-(NSDictionary *)LNTimeInfo;

/**
 * 返回时间是周几
 */
-(NSString *)LNTimeWeek;
/**
 * 返回时间的年
 */
-(NSString *)LNTimeYear;
/**
 * 返回时间的月
 */
-(NSString *)LNTimeMonth;
/**
 * 返回时间的日
 */
-(NSString *)LNTimeDay;
/**
 * 返回时间的时
 */
-(NSString *)LNTimeHour;
/**
 * 返回时间的分
 */
-(NSString *)LNTimeMinute;
/**
 * 返回时间的秒
 */
-(NSString *)LNTimeSecend;
@end
