//
//  NSDictionary+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

- (BOOL)notNull
{
    if (!self) {
        return NO;
    }
    
    if ([self isKindOfClass:[NSNull class]]) {
        
        return NO;
    }
    if (![self isKindOfClass:[NSDictionary class]]) {
        
        return NO;
    }
    else
    {
        return YES;
    }
}

@end
