//
//  UIDevice+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIDevice+Extension.h"

@implementation UIDevice (Extension)

+ (BOOL)IPhone
{
    return [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}

+ (float)systemVersion
{
    return [[UIDevice currentDevice].systemVersion floatValue];
}

+ (BOOL)IOS8
{
    return [self systemVersion] >= 8.0 && [self systemVersion] < 9.0;
}

+ (BOOL)IOS7
{
    return [self systemVersion] >= 7.0 && [self systemVersion] < 8.0 ;
}

+ (BOOL)IOS6
{
    return [self systemVersion] >= 6.0 && [self systemVersion] < 7.0;
}

@end
