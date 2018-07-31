//
//  UIImage+LNCustomSkill.m
//  CamperDriver
//
//  Created by WFW on 2018/4/12.
//  Copyright © 2018年 JobNew. All rights reserved.
//

#import "UIImage+LNCustomSkill.h"
#import <Photos/PHPhotoLibrary.h>
//#import <Photos/PhotosDefines.h>
@implementation UIImage (LNCustomSkill)

+(NSString *)imageDataLengthWith:(UIImage*)image{
    CGFloat compression = 1.0f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    NSString *imageDataLength = [NSString stringWithFormat:@"当前大小:%fkb",(float)[imageData length]/1024.0f];
    NSLog(@"当前大小:%@",imageDataLength);
    return imageDataLength;
}

+(UIImage *)scaleImage:(UIImage *)image toKb:(NSInteger)kb{
    
    if (!image) {
        return image;
    }
    if (kb<1) {
        return image;
    }
    kb*=1024;
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > kb && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
        NSLog(@"当前大小:%fkb ********************",(float)[imageData length]/1024.0f);
    }
    NSLog(@"当前大小:%fkb",(float)[imageData length]/1024.0f);
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    [UIImage saveImageData:imageData WithName:@"compressedImage"];
    return compressedImage;
}

+ (UIImage *)filePathToScaleImage:(UIImage *)image toKb:(NSInteger)kb {
    
    if (!image) {
        return nil;
    }
    NSData *imageData;
    if (kb<1) {
        imageData = UIImageJPEGRepresentation(image, 1.0f);
    }else{
        kb*=1024;
        CGFloat compression = 0.9f;
        CGFloat maxCompression = 0.1f;
        imageData = UIImageJPEGRepresentation(image, compression);
        while ([imageData length] > kb && compression > maxCompression) {
            compression -= 0.1;
            imageData = UIImageJPEGRepresentation(image, compression);
            NSLog(@"当前大小:%fkb ********************",(float)[imageData length]/1024.0f);
        }
    }
    NSLog(@"当前大小:%fkb",(float)[imageData length]/1024.0f);
    
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths firstObject];
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:@"newimage"];
    NSLog(@"\n/*/*/*/*/*/*/*/保存图片名称：%@\n",fullPathToFile);
    if ([imageData writeToFile:fullPathToFile atomically:NO]) {
        return [[UIImage alloc]initWithContentsOfFile:fullPathToFile];
    }
    return nil;
}

// 在结束回调的方法中，我们对图片进行了大小的处理，为图片的上转做了准备
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}
// 保存图片到document
+ (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName
{
    NSData* imageData = UIImagePNGRepresentation(tempImage);
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    // Now we get the full path to the file
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    // and then we write it out
    [imageData writeToFile:fullPathToFile atomically:NO];
    NSLog(@"\n/*/*/*/*/*/*/*/保存图片名称：%@\n",fullPathToFile);
    return fullPathToFile;
}

+ (UIImage *)saveImageData:(NSData *)tempImageData WithName:(NSString *)imageName
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    // Now we get the full path to the file
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    // and then we write it out
    [tempImageData writeToFile:fullPathToFile atomically:NO];
    NSLog(@"\n/*/*/*/*/*/*/*/保存图片名称：%@\n",fullPathToFile);
    return [[UIImage alloc]initWithContentsOfFile:fullPathToFile];
}

// 从文档目录下获取Documents路径
+ (NSString *)documentFolderPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}
-(UIImage *)getDocumentImage{
    // 读取沙盒路径图片
    NSString *aPath3=[NSString stringWithFormat:@"%@/Documents/%@.png",NSHomeDirectory(),@"test"];
    // 拿到沙盒路径图片
    UIImage *imgFromUrl3=[[UIImage alloc]initWithContentsOfFile:aPath3];
    // 图片保存相册
    UIImageWriteToSavedPhotosAlbum(imgFromUrl3, self, nil, nil);
    return imgFromUrl3;
}


//处理方式：先“压”后”缩“
+ (UIImage*)imageWithImg:(UIImage *)imaged andImageWidth:(CGFloat)imageWidth
{
    //487927   先压，经过这一步后，图片的size其实没有改变的，再缩后才变。
    NSData *imgData = UIImageJPEGRepresentation(imaged, 1);
    imaged = [UIImage imageWithData:imgData];
    CGFloat height = imageWidth*(imaged.size.height/imaged.size.width);
    return [UIImage imageByScalingAndCroppingForSize:CGSizeMake(imageWidth, height) withSourceImage:imaged];
}

//这个方法可以封装一下，抽离出来
+ (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize withSourceImage:(UIImage *)sourceImage
{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        //  CGFloat widthFactor = targetWidth / width;
        
        CGFloat widthFactor = targetWidth/ width;
        CGFloat heightFactor  =targetHeight/height;
        
        if (widthFactor>heightFactor) {
            scaleFactor = widthFactor;
        }else{
            scaleFactor = heightFactor;
        }
        
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if (widthFactor > heightFactor) {
            thumbnailPoint.y = (targetHeight-scaledHeight)*0.5;
        }else
        {
            thumbnailPoint.x = (targetWidth -scaledWidth)*0.5;
        }
        
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
    {
        NSLog(@"image error");
    }
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
