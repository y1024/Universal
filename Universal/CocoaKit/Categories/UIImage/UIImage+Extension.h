//
//  UIImage+Extension.h
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+ (UIImage*)noCacheWithName:(NSString*)imageFullName;

- (UIImage*)blurPercent:(CGFloat)blurPercent;

+ (UIImage*)QRCodeImageWithString:(NSString*)string imageWeight:(CGFloat)w imageHeight:(CGFloat)h;
/**
 *  存入本地相册
 */
- (void)writeToSavedPhotosAlbum;

@end
