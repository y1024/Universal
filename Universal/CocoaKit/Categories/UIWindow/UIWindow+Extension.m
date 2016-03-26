//
//  UIWindow+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/8.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIWindow+Extension.h"
#import <objc/runtime.h>

@implementation BorderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
        self.layer.borderWidth = 2.0f;
        self.layer.borderColor = [UIColor redColor].CGColor;
    }
    return self;
}

- (void)startAnimation
{
    self.alpha = 1.0f;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:.75f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(didAppearingAnimationStopped)];
    
    self.alpha = 0.0f;
    
    [UIView commitAnimations];
}

- (void)didAppearingAnimationStopped
{
    [self removeFromSuperview];
}


@end

@implementation UIWindow (Extension)

+ (UIWindow*)__ldx_keyWindow;
{
    return [UIApplication sharedApplication].windows[0];
}


//+ (void)load
//{
//    [super load];
////    Method normalMethod = class_getInstanceMethod(self, @selector(sendEvent:));
////    Method borderMethod = class_getInstanceMethod(self, @selector(borderViewSendEvent:));
////    
////    method_exchangeImplementations(normalMethod, borderMethod);
//}


- (void)borderViewSendEvent:(UIEvent*)event;
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    if ( self == keyWindow && UIEventTypeTouches == event.type)
    {
        NSSet *allTouches = [event allTouches];
        if ( 1 == [allTouches count] )
        {
            UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
            if ( 1 == [touch tapCount] && UITouchPhaseBegan == touch.phase )
            {
                BorderView *border = [[BorderView alloc] initWithFrame:touch.view.bounds];
                [touch.view addSubview:border];
                [border startAnimation];
            }
        }
    }
    [self borderViewSendEvent:event];
}




@end
