//
//  UIImage+Extension.h
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  本地读取图片
 *
 *  @param imageFullName <#imageFullName description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage*)noCacheWithName:(NSString*)imageFullName;

/**
 *  毛玻璃效果
 *
 *  @param blurPercent <#blurPercent description#>
 *
 *  @return <#return value description#>
 */
- (UIImage*)blurPercent:(CGFloat)blurPercent;

/**
 *  生成二维码
 *
 *  @param string <#string description#>
 *  @param w      <#w description#>
 *  @param h      <#h description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage*)QRCodeImageWithString:(NSString*)string imageWeight:(CGFloat)w imageHeight:(CGFloat)h;
/**
 *  存入本地相册
 */
- (void)writeToSavedPhotosAlbum;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;


@end
