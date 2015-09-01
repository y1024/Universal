//
//  UIApplication+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIApplication+Extension.h"

@implementation UIApplication (Extension)

+ (void)openAPPInStore:(NSInteger)APPID
{
    NSString *appURLString = [NSString stringWithFormat:@"http://itunes.apple.com/us/app/id%ld",(long)APPID];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURLString]];
}

+ (void)statusBarBlack
{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
}

+ (void)statusBarWhite
{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

@end
