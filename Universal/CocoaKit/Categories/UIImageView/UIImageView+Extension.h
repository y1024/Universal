//
//  UIImageView+Extension.h
//  Universal
//
//  Created by emiaobao on 15/9/16.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define lineW       4
#define intervalW   2


@interface UIImageView (Extension)

/**
 *  画虚线 默认 线 4 间隔 2
 *
 *  @param rect
 *
 *  @return
 */
+ (instancetype)drawImaginarylineWithRect:(CGRect)rect;


@end