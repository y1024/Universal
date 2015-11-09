//
//  UIView+Extension.m
//  Universal
//
//  Created by Code on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

+ (instancetype)loadFromNibWithNibName:(NSString*)nibName
{
    return [[[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil]firstObject];
}

- (CGFloat)__ldx_width
{
    return CGRectGetWidth(self.frame);
}
- (CGFloat)__ldx_height
{

    return CGRectGetHeight(self.frame);
}

- (CGFloat)__ldx_originX
{
    return self.frame.origin.x;
}

- (CGFloat)__ldx_originY
{
    return self.frame.origin.y;
}

- (CGFloat)__ldx_centerX
{
    return self.center.x;
}
- (CGFloat)__ldx_centerY
{
    return self.center.y;
}

- (CGFloat)__ldx_buttomY
{
    return [self __ldx_height] + [self __ldx_originY];
}
- (CGFloat)__ldx_rightX
{
    return [self __ldx_originX] + [self __ldx_width];
}

- (UIView*)cornerRadius:(CGFloat)radius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    
    return self;
}

- (void)removeAllSubViews
{
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
}

- (void)removeSubView:(Class)cls;
{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:cls]) {
            [subView removeFromSuperview];
        }
    }
}


@end
