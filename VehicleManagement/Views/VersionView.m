//
//  VersionView.m
//  CamperDriver
//
//  Created by WFW on 2018/2/2.
//  Copyright © 2018年 JobNew. All rights reserved.
//

#import "VersionView.h"

@implementation VersionView

- (void)showViewWithAbility:(NSString *)ability updateExplain:(NSString *)explain url:(NSString*)url{
    
//    ability = @"0";
//    explain = @"1、用户端-增加打卡记录类型页面\n2、用户端打卡类型界面添加动画显示效果\n3、加油登记列表页面\n4、加油登记页面\n5、优化加油功能界面显示效果\n6、用户端更新哪里玩";
//    explain = @"油登记页K及功能用户端更新百度SDK新增语义化地址";
//    url= @"https://www.pgyer.com/HPs6";
    
    self.layer.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5].CGColor;
    self.bgView.layer.cornerRadius = 5;
    
    [self showBtnAbility:ability];
    
    self.updateUrl = url;
    
    if ([explain containsString:@"\n"]) {
        self.textView.textAlignment = NSTextAlignmentLeft;
    }
    
    CGFloat szHeight = [self sizeWithString:explain font:self.textView.font width:self.textView.frame.size.width];
    LNDLog(@"说明内容适应高度：%f",szHeight);
    if (szHeight < 30) {
        szHeight = 30;
    }
    if (szHeight > 120) {
        szHeight = 120;
    }
    self.bgViewLayoutContr.constant = szHeight + 80;
    self.textView.text = explain;
}

//显示btn
- (void)showBtnAbility:(NSString *)ability{
    NSInteger a = [ability integerValue];
    if (a == 1) {
        self.line.hidden = YES;
        self.btn01.hidden = YES;
        self.btn02.hidden = YES;
        self.btn03.hidden = NO;
    }else{
        self.line.hidden = NO;
        self.btn01.hidden = NO;
        self.btn02.hidden = NO;
        self.btn03.hidden = YES;
    }
}


- (IBAction)updateBtn:(UIButton *)sender {
    self.updateVersion(self.updateUrl);
}

- (IBAction)btnAtion:(UIButton *)sender {
    self.updateVersion(@"cancelUpdate");
}

//获取View高度
-(CGFloat)sizeWithString:(NSString*)string font:(UIFont*)font width:(float)width {
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width,   80000) options:NSStringDrawingTruncatesLastVisibleLine |   NSStringDrawingUsesFontLeading    |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.height;
}
@end
