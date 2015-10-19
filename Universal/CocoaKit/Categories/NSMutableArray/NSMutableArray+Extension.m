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

@implementation NSMutableArray (Extension)


+ (void)load
{
    @autoreleasepool {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSMutableArray  *mutableArrayInstance = [NSMutableArray array];
            [self methodSwizzleWithClassName:NSStringFromClass([mutableArrayInstance class])];
        });
    }
}

+ (void)methodSwizzleWithClassName:(NSString*)clsName
{
    const char *clsCharName = clsName.UTF8String;
    
    Class subclass = objc_getClass(clsCharName);
    
    BOOL arrayI =  [subclass methodSwizzle:@selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:) error:nil];
    if (arrayI) {
        NSLog(@"可变数组：数组越界方法交换成功");
    }
    
    BOOL arrayISafeAddMethod = [subclass methodSwizzle:@selector(addObject:) withMethod:@selector(safeAddObject:) error:nil];
    if (arrayISafeAddMethod) {
        NSLog(@"arrayISafeAddMethod");
        
    }
}

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        
        return nil;
    }
    else
    {
        return [self safeObjectAtIndex:index];
    }
    
}


- (void)safeAddObject:(id)obj
{
    if (nil != obj) {
        
        [self safeAddObject:obj];
    }
}



@end
