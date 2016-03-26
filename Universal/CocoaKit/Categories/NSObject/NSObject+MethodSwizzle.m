//
//  NSObject+MethodSwizzle.m
//  Universal
//
//  Created by 杜晓星 on 16/2/14.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import "NSObject+MethodSwizzle.h"
#import <objc/runtime.h>

@implementation NSObject (MethodSwizzle)


- (void)instanceMethodSwizzle:(SEL)originalSelector withMethod:(SEL)swizzledSelector;
{
    Class cls = [self class];
    NSString *clsName = NSStringFromClass(cls);
    NSString *originSELName = NSStringFromSelector(originalSelector);
    NSString *swizzleSELName = NSStringFromSelector(swizzledSelector);
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    if (!originalMethod) {
        NSString *string = [NSString stringWithFormat:@" %@ 类没有找到 %@ 方法",clsName,originSELName];
        NSLog(@"error:%@",string);
        
        return;
    }
    
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    if (!swizzledMethod) {
        NSString *string = [NSString stringWithFormat:@" %@ 类没有找到 %@ 方法",clsName,swizzleSELName];
        NSLog(@"error:%@",string);
        
        return;
    }
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}



@end
