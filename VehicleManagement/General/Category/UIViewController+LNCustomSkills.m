//
//  UIViewController+LNCustomSkills.m
//  Cycling
//
//  Created by JobNewMac1 on 16/9/1.
//  Copyright © 2016年 JobNew. All rights reserved.
//

#import "UIViewController+LNCustomSkills.h"
#import <objc/runtime.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "UIImage+LNCustomSkill.h"
#define PhotoName @"PhotoName"

@interface UIViewController()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic ,strong)  void (^image)(UIImage *image ,NSString *imageName);
@end

static const void *lnViewControllerImageBlockKey = &lnViewControllerImageBlockKey;

@implementation UIViewController (LNCustomSkills)

-(void)LNRightNavItemWithTitle:(NSString *)title Action:(SEL)selector {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:selector];
}

-(void)LNRightNavItemWithImage:(UIImage *)image Action:(SEL)selector {
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:selector];
}

-(void)LNRightNavItemWithView:(UIView *)view Action:(SEL)selector {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    if (selector) {
        [view LNAddTapAction:selector Target:self];
    }
}

-(void)LNLeftNavItemWithTitle:(NSString *)title Action:(SEL)selector {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:selector];
}

-(void)LNLeftNavItemWithImage:(UIImage *)image Action:(SEL)selector {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:selector];
}

-(void)LNOpenImagePickerController:(void (^)(UIImage *image , NSString *imageName))SelectImage {
    
    self.image = SelectImage;
    
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

-(void)LNOpenCamera:(void (^)(UIImage *image , NSString *imageName))SelectImage {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        self.image = SelectImage;
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.delegate = self;
        picker.allowsEditing = NO;
        [self presentViewController:picker animated:YES completion:^{

        }];
    } else {
        
    }
}

-(void)LNOpenImageChoiceController:(void (^)(UIImage *image , NSString *imageName))SelectImage {
    UIAlertController *con = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self LNOpenCamera:SelectImage];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self LNOpenImagePickerController:SelectImage];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [con addAction:action1];
    [con addAction:action2];
    [con addAction:action3];
    [self presentViewController:con animated:YES completion:^{
        
    }];
}

#pragma mark UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(nonnull UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    if (image != nil) {
        if (self.image) {
            NSURL *imageurl = [editingInfo valueForKey:UIImagePickerControllerReferenceURL];
            ALAssetsLibrary *lib = [ALAssetsLibrary new];
            [lib assetForURL:imageurl resultBlock:^(ALAsset *asset) {
                NSLog(@"\n\n选择的图片名称：%@\n\n",asset.defaultRepresentation.filename);
                
                if (asset.defaultRepresentation.filename) {
                    self.image(image,asset.defaultRepresentation.filename);
                } else {
                    NSString *imageNameIStr = [LNUserdefauts objectForKey:PhotoName];
                    if (imageNameIStr == nil) {
                        imageNameIStr = @"0";
                    }
                    
                    NSInteger imageNameIIndex = imageNameIStr.integerValue;
                    NSString *str = [NSString stringWithFormat:@"%ld.jpg",(long)imageNameIIndex];
                    //576*768^500     306*608^200  432*576^300
                    UIImage *newImage = [UIImage imageByScalingAndCroppingForSize:CGSizeMake(432, 576) withSourceImage:image];
                    if (self.image) {
                        self.image(newImage,str);
//                        self.image(image,str);
                    }
                    
                    [LNUserdefauts setObject:@"1" forKey:PhotoName];
//                    [LNUserdefauts setObject:[NSString stringWithFormat:@"%ld",(long)(imageNameIIndex + 1)] forKey:PhotoName];
                }
                
            } failureBlock:^(NSError *error) {
                self.image(image ,nil);
            }];
        }
    }
    [picker dismissViewControllerAnimated:YES completion:^{
        NSString *imageNameIStr = [LNUserdefauts objectForKey:PhotoName];
        if (imageNameIStr == nil) {
            
        }else{
            self.image = nil;
        }
    }];
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{
        self.image = nil;
    }];
}


#pragma mark settter getter
-(void)setImage:(void (^)(UIImage *))image {
    objc_setAssociatedObject(self, lnViewControllerImageBlockKey, image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void (^)(UIImage *))image {
    return objc_getAssociatedObject(self, lnViewControllerImageBlockKey);
}


@end
