//
//  NSString+HomePath.h
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

+ (NSString*)HomePath;

- (BOOL)notNull;

- (NSString*)reutf8;

- (NSString*)utf8;

/**
 *  汉语转拼音 带空格
 *
 *  @return
 */
- (NSString*)combineSyllablesWithBlank;

/**
 *  汉语转拼音 无空格
 *
 *  @return
 */
- (NSString*)combineSyllablesNoBlank;

- (BOOL)isContainsString:(NSString *)aString;

+ (NSString*)WIFIName;



@end
