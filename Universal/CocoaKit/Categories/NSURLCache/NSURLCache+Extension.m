//
//  NSURLCache+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSURLCache+Extension.h"

@implementation NSURLCache (Extension)

+ (void)cleanCacheWithURLString:(NSString*)urlString;
{
    /*
     关于HTTPCaches
     相同的URL 不同时间启动 产生的缓存文件名字不一样。第一次启动产生缓存以后没有清理，下次启动则清理不成功。
     如果使用相同的URL再次请求，则会覆盖原来的缓存文件。
     如果需要清理缓存文件的话，建议每次程序退出前就清理。
     */
    NSURLRequest *cleanURLRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    if (cleanURLRequest) {
        [[NSURLCache sharedURLCache]removeCachedResponseForRequest:cleanURLRequest];
    }
}
@end
