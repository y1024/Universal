//
//  UIWebView+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIWebView+Extension.h"

@implementation UIWebView (Extension)

- (void)loadURL:(NSString*)url
{
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0f]];
}

@end
