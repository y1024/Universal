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

@end
