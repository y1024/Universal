//
//  UIColor+Extension.h
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor*)hexString:(NSString*)_HexString;

+ (UIColor*)R:(CGFloat)_R G:(CGFloat)_G B:(CGFloat)_B;

+ (UIColor*)R:(CGFloat)_R G:(CGFloat)_G B:(CGFloat)_B A:(CGFloat)_A;

+ (UIColor*)hex:(NSInteger)hex;

@end
