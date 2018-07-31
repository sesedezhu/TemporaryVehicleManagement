//
//  MessageCountLabel.m
//  Camper
//
//  Created by JobNewMac1 on 16/9/30.
//  Copyright © 2016年 ning. All rights reserved.
//

#import "MessageCountLabel.h"

@implementation MessageCountLabel
-(void)awakeFromNib {
    //self.adjustsFontSizeToFitWidth = YES;
    [super awakeFromNib];
    self.textAlignment = NSTextAlignmentCenter;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        //self.adjustsFontSizeToFitWidth = YES;
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //self.adjustsFontSizeToFitWidth = YES;
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(void)addNotify {
    [WorldNotifyManager addUpdateMessageCountNotify:self Selector:@selector(updateMessageCount:) object:nil];
}

-(void)removeNotify {
    [WorldNotifyManager deleteUpdateMessageCountNotify:self object:nil];
}

-(void)updateMessageCount:(NSNotification *)notify {
    NSString *str = [UserInfoSkills getUserInfo:UserInfoSkillsType_MessageCount];
    if (str && [str integerValue] > 0) {
        self.hidden = NO;
        self.text = str;
    } else {
        self.hidden = YES;
    }
}

@end
