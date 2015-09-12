//
//  UIWindow+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/8.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIWindow+Extension.h"

@implementation UIWindow (Extension)

+ (UIWindow*)keyWindow
{
    return [UIApplication sharedApplication].windows[0];
}

@end
