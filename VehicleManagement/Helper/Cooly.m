//
//  Cooly.m
//  FragrantTown
//
//  Created by JobNewMac1 on 16/8/30.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "Cooly.h"

@implementation Cooly
+(BOOL)LNIsEmpty:(NSString *)string {
    if (![string isKindOfClass:[NSString class]]) {
        NSLog(@"\n不是string类型\n");
        return YES;
    }
    if ([string isEqualToString:@""] || string == nil || [string isEqualToString:@" "]) {
        return YES;
    }
    return NO;
}

//判断是否为整形：
+(BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形：
+(BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}
@end
