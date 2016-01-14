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


+ (void)addCookieWithURL:(NSString*)url cookieInfo:(NSDictionary*)info;

{
    NSURL *cookieHost = [NSURL URLWithString:url];
    NSMutableDictionary *cookieInfo = [NSMutableDictionary dictionary];
    [cookieInfo setValue:[cookieHost host] forKey:NSHTTPCookieDomain];
    [cookieInfo setValue:[cookieHost path] forKey:NSHTTPCookiePath];
    [cookieInfo setValue:@"NSHTTPCookieName" forKey:NSHTTPCookieName];
    [cookieInfo setValue:info forKey:NSHTTPCookieValue];
    [cookieInfo setValue:[NSDate dateWithTimeIntervalSinceNow:60*60*10] forKey:NSHTTPCookieExpires];
    
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieInfo];
    
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
}
- (void)loadURL:(NSString*)url
{
    [self loadURL:url timeOut:60.0f];
}
- (void)loadURL:(NSString*)url timeOut:(NSTimeInterval)time
{
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:time]];
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



- (void)utf8Coding
{
    [self stringByEvaluatingJavaScriptFromString:
     @"var tagHead =document.documentElement.firstChild;"
     "var tagMeta = document.createElement(\"meta\");"
     "tagMeta.setAttribute(\"http-equiv\", \"Content-Type\");"
     "tagMeta.setAttribute(\"content\", \"text/html; charset=utf-8\");"
     "var tagHeadAdd = tagHead.appendChild(tagMeta);"];
}

- (void)addCss
{
    [self stringByEvaluatingJavaScriptFromString:
     @"var tagHead =document.documentElement.firstChild;"
     "var tagStyle = document.createElement(\"style\");"
     "tagStyle.setAttribute(\"type\", \"text/css\");"
     "tagStyle.appendChild(document.createTextNode(\"BODY{padding: 20pt 15pt}\"));"
     "var tagHeadAdd = tagHead.appendChild(tagStyle);"];
}

@end
