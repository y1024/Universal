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
    // 定义 cookie 要设定的 host
    NSURL *cookieHost = [NSURL URLWithString:url];
    
    NSDictionary *cookieInfo = [NSDictionary dictionaryWithDictionary:info];
    [cookieInfo setValue:[cookieHost host] forKey:NSHTTPCookieDomain];
    [cookieHost setValue:[cookieHost path] forKey:NSHTTPCookiePath];

    
    // 设定 cookie
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieInfo];
    
    // 设定 cookie 到 storage 中
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    
    // 建立 NSURLRequest 连到 cookie.php，连线的时候会自动加入上面设定的 Cookie
//    NSString *urlAddress = @"http://blog.toright.com/cookie.php";
//    NSURL *myurl = [NSURL URLWithString:urlAddress];
//    NSURLRequest *requestObj = [NSURLRequest requestWithURL:myurl];
//    
//    // 建立 UIWebView
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}
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
