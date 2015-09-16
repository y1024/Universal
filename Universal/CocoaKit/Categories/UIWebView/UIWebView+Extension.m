//
//  UIWebView+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIWebView+Extension.h"
#import "CategoryHeaders.h"

@implementation UIWebView (Extension)



- (void)loadURL:(NSString*)url
{
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0f]];
}

- (void)loadHTMLString:(NSString*)htmlString
{
    NSString *fullHtmlString = nil;
    
    if ([htmlString isContainsString:@"<head>"]) {
        fullHtmlString = [htmlString stringByReplacingOccurrencesOfString:@"<head>" withString:@"<head><style>img{width:100% !important;}</style>"];
    }
    else
    {
        NSString *headString = @"<head><style>img{width:100% !important;}</style></head>";
        fullHtmlString = [NSString stringWithFormat:@"%@%@",headString,htmlString];
    }
    [self loadHTMLString:fullHtmlString baseURL:nil];
}

@end
