//
//  NSHTTPCookieStorage+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSHTTPCookieStorage+Extension.h"

@implementation NSHTTPCookieStorage (Extension)

+ (void)cleanCookiesWithURLString:(NSString*)urlString
{
    /*
     关于HTTPCookies
     
     NSMutableURLRequest
     mutableURLRequest.HTTPShouldHandleCookies = NO ;系统提供的方法可以不产生Cookies
     系统产生HTTPCookies 保存本地速度比较慢。
     在下次启动程序时，可以直接清理。
     */
    NSURL *cleanURL = [NSURL URLWithString:urlString];
    if (cleanURL) {
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:cleanURL];
        for (int i = 0; i < [cookies count]; i++) {
            NSHTTPCookie *cookie = (NSHTTPCookie *)cookies[i];
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
        }
    }
}

@end
