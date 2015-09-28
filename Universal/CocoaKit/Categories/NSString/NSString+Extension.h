//
//  NSString+HomePath.h
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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

+ (NSString*)UUID;

/**
 *  时间戳
 *
 *  @return
 */
+ (NSString*)timestamp;
/**
 *  读取条码 信息
 *
 *  @param img <#img description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)stringWithCodeImage:(UIImage*)img;


@end
