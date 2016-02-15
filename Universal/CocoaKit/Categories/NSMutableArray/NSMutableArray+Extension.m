//
//  NSArray+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSArray+Extension.h"
#import "NSObject+MethodSwizzle.h"

/**
 *  0 DEBUG 1 Release
 *
 *  @param Extension
 *
 *  @return
 */


@implementation NSMutableArray (Extension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj instanceMethodSwizzle:@selector(addObject:) withMethod:@selector(safeAddObject:)];
        [obj instanceMethodSwizzle:@selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:)];
        [obj instanceMethodSwizzle:@selector(insertObject:atIndex:) withMethod:@selector(safeInsertObject:atIndex:)];
        [obj instanceMethodSwizzle:@selector(removeObjectAtIndex:) withMethod:@selector(safeRemoveObjectAtIndex:)];
        [obj instanceMethodSwizzle:@selector(replaceObjectAtIndex:withObject:) withMethod:@selector(safeReplaceObjectAtIndex:withObject:)];
    });
}

- (void)safeAddObject:(id)anObject
{
    if (anObject) {
        [self safeAddObject:anObject];
    }
    else
    {
        DEBUGAssert(anObject, @"obj is nil");
    }
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


- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject && index <= [self count]) {
        [self safeInsertObject:anObject atIndex:index];
    }else{
        NSAssert(DEBUGSWITCH, @"obj is nil or index is beyond bounds");
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index
{
    if (index < [self count]) {
        [self safeRemoveObjectAtIndex:index];
    }else
    {
        NSAssert(DEBUGSWITCH, @"index is beyond bounds");
    }
}

- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject && index <= [self count]) {
        [self safeReplaceObjectAtIndex:index withObject:anObject];
    }else{
        NSAssert(anObject  && DEBUGSWITCH, @"obj is nil");
    }
}

@end
