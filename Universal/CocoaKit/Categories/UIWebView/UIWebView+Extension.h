//
//  UIWebView+Extension.h
//  Universal
//
//  Created by emiaobao on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (Extension)


- (void)loadURL:(NSString*)url;

/**
 *  加载  html字符串 处理图片
 *
 *  @param htmlString
 */
- (void)loadHTMLString:(NSString*)htmlString;

/**
 *  utf-8编码
 */
- (void)utf8Coding;

/**
 *  增加CSS样式
 */
- (void)addCss;



@end
