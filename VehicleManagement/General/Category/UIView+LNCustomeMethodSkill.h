//
//  UIView+LNCustomeMethodSkill.h
//  FragrantTown
//
//  Created by liu on 16/8/9.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LNCustomeMethodSkill)
-(void)LNCornerRadius:(CGFloat)radius;
-(void)LNBorderWithWidth:(CGFloat)width Color:(UIColor *)color;
-(void)LNAddTapAction:(SEL)selector Target:(id)target;
-(void)LNAddLongTapAction:(SEL)selector Target:(id)target;
@end
