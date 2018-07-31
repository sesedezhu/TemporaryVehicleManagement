//
//  UIColor+LNCustomColorSkill.h
// Create By LiuNing.

#import <UIKit/UIKit.h>

@interface UIColor (LNCustomColorSkill)
/**
 *  通过十六进制返回颜色
 *
 *  @param hexString
 *
 *  @return UIColor
 */
+(UIColor *)LNcolorWithHexString: (NSString *) hexString;

@end
