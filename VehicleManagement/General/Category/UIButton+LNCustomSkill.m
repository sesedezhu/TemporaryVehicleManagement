//
//  UIButton+LNCustomSkill.m
//  FragrantTown
//
//  Created by JobNewMac1 on 16/8/9.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "UIButton+LNCustomSkill.h"

@implementation UIButton (LNCustomSkill)
-(void)LNControlStateNormalBackGroundImage:(UIImage *)image {
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

-(void)LNControlStateSelectedBackGroundImage:(UIImage *)image {
    [self setBackgroundImage:image forState:UIControlStateSelected];
}

-(void)LNControlStateNormalImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateNormal];

}

-(void)LNControlStateSelectedImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateSelected];
}


-(void)LNControlStateNormalTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:UIControlStateNormal];
}

-(void)LNControlStateNormalTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

-(void)LNControlStateSelectedTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateSelected];
}

-(void)LNControlStateSelectedTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:UIControlStateSelected];
}

-(void)LNControlStateSelectedBackGroundColor:(UIColor *)color {
    
}

-(void)LNTintColor:(UIColor *)color {
    [self setTintColor:color];
}

-(void)LNChageTitleAndImageX {
    
    CGFloat titleWidth = self.titleLabel.bounds.size.width;
    CGFloat imageWidth = self.imageView.frame.size.width;
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleWidth+2 , 0, -titleWidth-2)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageWidth-2, 0, imageWidth+2)];
    
}

-(void)LNChangeImageUpTitleDown {

    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(-10.5, (width - imageWidth) / 2.0, 10.5, 0)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(imageHeight/2.0, -imageWidth, -imageHeight/2.0, 0)];
    
}

@end
