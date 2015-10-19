//
//  UIButton+Extension.m
//  Universal
//
//  Created by 杜晓星 on 15/10/12.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>

static const char *delayTimeIntervalKey = "delayTimeIntervalKey";

@implementation UIControl (Extension)

- (void)setDelayTimeInterval:(NSTimeInterval)delayTimeInterval
{
    objc_setAssociatedObject(self, delayTimeIntervalKey, @(delayTimeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)delayTimeInterval
{
    return [objc_getAssociatedObject(self, delayTimeIntervalKey) doubleValue];
}

+ (void)load
{
    Method normal = class_getInstanceMethod(self , @selector(sendAction:to:forEvent:));
    Method delay  = class_getInstanceMethod(self, @selector(delayButtonEvent:target:event:));
    
    method_exchangeImplementations(normal, delay);
}


static const char *acceptedEventTimeKey = "acceptedEventTimeKey";

- (void)setAcceptedEventTime:(NSTimeInterval)acceptedEventTime
{
    objc_setAssociatedObject(self, acceptedEventTimeKey, @(acceptedEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)acceptedEventTime
{
    return [objc_getAssociatedObject(self, acceptedEventTimeKey) doubleValue];
}

- (void)delayButtonEvent:(SEL)buttonAction target:(id)target event:(UIControlEvents)event
{
    if (NSDate.date.timeIntervalSince1970 - self.acceptedEventTime < self.delayTimeInterval) return;
    
    if (self.delayTimeInterval > 0)
    {
        self.acceptedEventTime = NSDate.date.timeIntervalSince1970;
    }
    
    [self delayButtonEvent:buttonAction target:target event:event];
}

@end
