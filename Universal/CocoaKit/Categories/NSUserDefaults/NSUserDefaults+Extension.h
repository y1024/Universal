//
//  NSUserDefaults+Extension.h
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Extension)

+ (id)objectForKey:(NSString*)key;

+ (void)removeObjectForKey:(NSString*)key;

+ (void)__ldx_safeSetObject:(id)obj forKey:(NSString*)key;



@end
