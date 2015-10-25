//
//  NSArray+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSArray+Extension.h"

//#import <objc/runtime.h>
//
//#import "NSObject+Extension.h"

@implementation NSMutableArray (Extension)


//+ (void)load
//{
//    @autoreleasepool {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            NSMutableArray  *mutableArrayInstance = [NSMutableArray array];
//            [self methodSwizzleWithClassName:NSStringFromClass([mutableArrayInstance class])];
//        });
//    }
//}
//
//+ (void)methodSwizzleWithClassName:(NSString*)clsName
//{
//    const char *clsCharName = clsName.UTF8String;
//    
//    Class subclass = objc_getClass(clsCharName);
//    
//    BOOL arrayI =  [subclass methodSwizzle:@selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:) error:nil];
//    if (arrayI) {
//        NSLog(@"SEL:%@",NSStringFromSelector(@selector(safeObjectAtIndex:)));
//    }
//    
//    BOOL arrayISafeAddMethod = [subclass methodSwizzle:@selector(addObject:) withMethod:@selector(safeAddObject:) error:nil];
//    if (arrayISafeAddMethod) {
//       NSLog(@"SEL:%@",NSStringFromSelector(@selector(safeAddObject:)));
//        
//    }
//}

//- (id)safeObjectAtIndex:(NSUInteger)index
//{
//    if (index >= self.count) {
//        
//        return nil;
//    }
//    else
//    {
//        return [self safeObjectAtIndex:index];
//    }
//    
//}


- (void)safeAddObject:(id)obj
{
    if (nil != obj) {
        
        [self addObject:obj];
    }
}



@end
