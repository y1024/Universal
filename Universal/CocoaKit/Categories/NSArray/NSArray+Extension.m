//
//  NSArray+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSArray+Extension.h"

#import <objc/runtime.h>

#import "NSObject+Extension.h"




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

//+ (void)load
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSArray         *instanceArray = [NSArray array];
//        
//        [self methodSwizzleWithClassName:NSStringFromClass([instanceArray class])];
//        
//        
//    });
//    
//}
//
//+ (void)methodSwizzleWithClassName:(NSString*)clsName
//{
//    const char *clsCharName = clsName.UTF8String;
//    
//    Class subclass = objc_getClass(clsCharName);
//    
//    BOOL arrayIOverStepMethod =  [subclass methodSwizzle:@selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:) error:nil];
//    if (arrayIOverStepMethod) {
//         NSLog(@"SEL:%@",NSStringFromSelector(@selector(safeObjectAtIndex:)));
//    }
//}


- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
 
        return nil;
    }
    else
    {
        return [self objectAtIndex:index];
    }
    
}

@end
