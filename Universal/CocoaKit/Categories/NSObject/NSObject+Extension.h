//
//  NSObject+Extension.h
//  Universal
//
//  Created by 杜晓星 on 15/10/15.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

+ (BOOL)methodSwizzle:(SEL)originalSelector withMethod:(SEL)swizzledSelector error:(NSError **)error;

- (void)receiveTextFieldChangeNotificationWithObj:(id)obj action:(SEL)sel;

- (void)removeAllNotification;

- (NSDictionary*)mjInfo;

+ (instancetype)initWithMjInfo:(NSDictionary*)info;

- (BOOL)notNullArray;
- (BOOL)notNullString;
- (BOOL)notNullDictionary;

/**
 *  zh-Hans //简体汉字拼音
    en-US   //英文
    zh-Hans //简体手写
    zh-Hans //简体笔画
    zh-Hant //繁体手写
    zh-Hant //繁体仓颉
    zh-Hant //繁体笔画
    emoji   //表情
 *
 *  @param action
 *  @param obj
 */
- (void)obserCurrentInputModeWithAction:(SEL)action object:(id)obj;

@end
