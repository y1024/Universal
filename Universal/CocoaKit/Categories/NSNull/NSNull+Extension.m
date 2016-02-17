//
//  NSNull+Extension.m
//  Universal
//
//  Created by 杜晓星 on 15/10/15.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSNull+Extension.h"

@implementation NSNull (Extension)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    
    if (nil != signature)
    {
        return signature;
    }
    
    else
    {
        for (NSObject *object in XYNullObjects)
        {
            signature = [object methodSignatureForSelector:selector];
            
            if (signature)
            {
                if (strcmp(signature.methodReturnType, "@") == 0)
                {
                    signature = [[NSNull null] methodSignatureForSelector:@selector(__uxy_nil)];
                }
                break;
            }
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if (strcmp(anInvocation.methodSignature.methodReturnType, "@") == 0)
    {
        anInvocation.selector = @selector(__uxy_nil);
        [anInvocation invokeWithTarget:self];
        return;
    }
    
    for (NSObject *object in XYNullObjects)
    {
        if ([object respondsToSelector:anInvocation.selector])
        {
            [anInvocation invokeWithTarget:object];
            return;
        }
    }
    
    [self doesNotRecognizeSelector:anInvocation.selector];
}

- (id)__uxy_nil
{
    return nil;
}


@end
