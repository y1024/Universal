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
