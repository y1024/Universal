//
//  NSArray+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

- (BOOL)notNull;
{
    if (!self) {
        
        return NO;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        
        return NO;
    }
    
    if (![self isKindOfClass:[NSArray class]]) {
        
        return NO ;
    }
    if ([self count] == 0) {
        
        return NO;
    }
    else
    {
        return YES;
    }

}

@end
