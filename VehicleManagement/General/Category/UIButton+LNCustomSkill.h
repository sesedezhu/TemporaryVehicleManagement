//
//  UIButton+LNCustomSkill.h
//  FragrantTown
//
//  Created by JobNewMac1 on 16/8/9.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LNCustomSkill)
-(void)LNControlStateNormalBackGroundImage:(UIImage *)image;
-(void)LNControlStateSelectedBackGroundImage:(UIImage *)image;

-(void)LNControlStateNormalImage:(UIImage *)image;
-(void)LNControlStateSelectedImage:(UIImage *)image;

-(void)LNControlStateNormalBackGroundColor:(UIColor *)color;
-(void)LNControlStateSelectedBackGroundColor:(UIColor *)color;


-(void)LNControlStateNormalTitleColor:(UIColor *)color;
-(void)LNControlStateSelectedTitleColor:(UIColor *)color;

-(void)LNControlStateNormalTitle:(NSString *)title;
-(void)LNControlStateSelectedTitle:(NSString *)title;

-(void)LNTintColor:(UIColor *)color;

-(void)LNChageTitleAndImageX;

-(void)LNChangeImageUpTitleDown;

@end
