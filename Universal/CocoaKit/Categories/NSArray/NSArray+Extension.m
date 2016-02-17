//
//  NSArray+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSArray+Extension.h"
#import "NSObject+MethodSwizzle.h"

@implementation NSArray (Extension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj instanceMethodSwizzle:@selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:)];
    });
}

- (id)safeObjectAtIndex:(NSInteger)index
{
    if(index<[self count]){
        return [self safeObjectAtIndex:index];
    }
    else
    {
        DEBUGAssert(DEBUGSWITCH, @"index is beyond bounds");
    }
    return nil;
}


@end
