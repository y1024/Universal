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

- (CGFloat)width;

- (CGFloat)height;

- (CGFloat)originX;

- (CGFloat)originY;

- (CGFloat)centerX;

- (CGFloat)centerY;



- (CGFloat)buttomY;

- (CGFloat)rightX;



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
