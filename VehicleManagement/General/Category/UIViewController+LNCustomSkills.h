//
//  UIViewController+LNCustomSkills.h
//  Cycling
//
//  Created by JobNewMac1 on 16/9/1.
//  Copyright © 2016年 JobNew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LNCustomSkills)

-(void)LNRightNavItemWithTitle:(NSString *)title Action:(SEL)selector;
-(void)LNRightNavItemWithImage:(UIImage *)image Action:(SEL)selector;
-(void)LNRightNavItemWithView:(UIView *)view Action:(SEL)selector;

-(void)LNLeftNavItemWithTitle:(NSString *)title Action:(SEL)selector;
-(void)LNLeftNavItemWithImage:(UIImage *)image Action:(SEL)selector;

-(void)LNOpenImagePickerController:(void (^)(UIImage *image , NSString *imageName))SelectImage;

-(void)LNOpenCamera:(void (^)(UIImage *image , NSString *imageName))SelectImage;

-(void)LNOpenImageChoiceController:(void (^)(UIImage *image , NSString *imageName))SelectImage;


@end
