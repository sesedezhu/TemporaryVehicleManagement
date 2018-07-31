//
//  UIView+LNCustomeMethodSkill.m
//  FragrantTown
//
//  Created by liu on 16/8/9.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "UIView+LNCustomeMethodSkill.h"

@implementation UIView (LNCustomeMethodSkill)
-(void)LNCornerRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

-(void)LNBorderWithWidth:(CGFloat)width Color:(UIColor *)color {
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

-(void)LNAddTapAction:(SEL)selector Target:(id)target{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:selector];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

-(void)LNAddLongTapAction:(SEL)selector Target:(id)target {
    UILongPressGestureRecognizer *tap = [[UILongPressGestureRecognizer alloc]initWithTarget:target action:selector];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

@end
