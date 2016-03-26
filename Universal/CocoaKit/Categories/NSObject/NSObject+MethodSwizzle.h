//
//  NSObject+MethodSwizzle.h
//  Universal
//
//  Created by 杜晓星 on 16/2/14.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import <Foundation/Foundation.h>


#define DEBUGSWITCH  0

#define DEBUGAssert(condition,desc, ...) NSAssert((DEBUGSWITCH || condition),desc);

@interface NSObject (MethodSwizzle)

- (void)instanceMethodSwizzle:(SEL)originalSelector withMethod:(SEL)swizzledSelector;

@end
