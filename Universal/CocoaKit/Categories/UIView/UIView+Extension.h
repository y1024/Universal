//
//  UIView+Extension.h
//  Universal
//
//  Created by Code on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

+ (instancetype)loadFromNibWithNibName:(NSString*)nibName;

- (CGFloat)__ldx_width;

- (CGFloat)__ldx_height;

- (CGFloat)__ldx_originX;

- (CGFloat)__ldx_originY;

- (CGFloat)__ldx_centerX;

- (CGFloat)__ldx_centerY;



- (CGFloat)__ldx_buttomY;

- (CGFloat)__ldx_rightX;



/**
 *  切圆角
 *
 *  @param radius
 *
 *  @return
 */
- (UIView*)cornerRadius:(CGFloat)radius;

- (void)removeAllSubViews;

- (void)removeSubView:(Class)cls;

@end
