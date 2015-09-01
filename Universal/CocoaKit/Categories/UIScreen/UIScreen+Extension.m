//
//  UIScreen+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIScreen+Extension.h"

@implementation UIScreen (Extension)

+ (CGRect)frame
{
    return [UIScreen mainScreen].bounds;
}

+ (CGFloat)width
{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)height
{
    return [UIScreen mainScreen].bounds.size.height;
}

+ (BOOL)IPhone4SInch
{
    return ([self height] == 480.0f) && ([self width] == 320.0f);
}

+ (BOOL)IPhone5SInch;
{
    return ([self height] == 568.0f) && ([self width] == 320.0f);
}
+ (BOOL)IPhone6Inch
{
    return ([self height] == 667.0f) && ([self width] == 375.0f);
}

+ (BOOL)IPhone6PInch
{
    return ([self height] == 736.0f) && ([self width] == 414.0f) ;
}


@end
