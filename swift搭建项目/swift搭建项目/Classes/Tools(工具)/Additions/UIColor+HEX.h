//
//  UIColor+HEX.h
//  swift搭建项目
//
//  
//  Copyright (c) 2015年 iswift搭建项目. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HEX)
+ (UIColor *) colorWithHexString: (NSString *)color;
// fasdf
+ (UIColor *) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
// fasfasdfa
@end
