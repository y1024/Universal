//
//  NSString+HomePath.h
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *const soundAlert;              //soundAlert
extern NSString *const backspace;               //退格
extern NSString *const formFeed;                // Form feed
extern NSString *const lineFeed;                //换行
extern NSString *const enterKey;                //回车
extern NSString *const horizontalTab;           //水平制表符
extern NSString *const VerticalTab;             //垂直制表符
extern NSString *const backslash;               //反斜杠
extern NSString *const doubleQuotationMarks;    //双引号
extern NSString *const SingleQuotes;            //单引号

extern NSString *const regxAllNumbers;

@interface NSString (Extension)

+ (NSString*)HomePath;

- (NSString*)reutf8;

- (NSString*)utf8;

- (NSString *)htmlString;

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

/**
 *  时间戳 毫秒
 *
 *  @param seconds
 *
 *  @return
 */
+ (NSString*)dateWithTimestamp:(NSInteger)seconds;

- (NSString*)replaceBackslash;

/**
 *  正则表达式匹配
 *
 *  @param condition
 *
 *  @return
 */
- (BOOL)regexWithString:(NSString*)condition;
/**
 *  正则检验纯数字
 *
 *  @return
 */
- (BOOL)regexAllNumbers;

/**
 *  utf8 data
 *
 *  @param data
 *
 *  @return
 */
+ (NSString*)stringWithUTF8Data:(NSData*)data;
/**
 *  资源路径
 *
 *  @param pathName
 *  @param name
 *  @param type
 *
 *  @return
 */
+ (NSString*)resource:(NSString*)name type:(NSString*)type;

/**
 *  urlencode
 *
 *  @return
 */
- (NSString*)urlencode;

+ (NSString*)QRCodeStringFromImage:(NSString*)imageName;

/**
 *  字符串 指定宽度 计算高度
 *
 *  @param font
 *  @param w
 *
 *  @return
 */
- (CGFloat)selfHeightWithFont:(CGFloat)font totalWidth:(CGFloat)w;

/**
 *  字符串 单行 宽度
 *
 *  @param font
 *
 *  @return
 */
- (CGFloat)selfWidthWithFont:(CGFloat)font;

/**
 *  MD5
 *
 *  @return
 */
- (NSString *)MD5;

+ (NSString *)MD5ByAStr:(NSString *)aSourceStr;

/**
 *  是否包含表情
 *
 *  @return <#return value description#>
 */
- (BOOL)isContainEmoji;

@end
