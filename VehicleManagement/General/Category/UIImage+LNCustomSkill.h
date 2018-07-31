//
//  UIImage+LNCustomSkill.h
//  CamperDriver
//
//  Created by WFW on 2018/4/12.
//  Copyright © 2018年 JobNew. All rights reserved.
//



@interface UIImage (LNCustomSkill)

+(UIImage *)scaleImage:(UIImage *)image toKb:(NSInteger)kb;
// 保存图片到document
+ (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName;
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;
+ (UIImage*)imageWithImg:(UIImage *)imaged andImageWidth:(CGFloat)imageWidth;
+ (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize withSourceImage:(UIImage *)sourceImage;
+ (UIImage *)filePathToScaleImage:(UIImage *)image toKb:(NSInteger)kb ;
+ (NSString *)imageDataLengthWith:(UIImage*)image;
@end
