//
//  UIViewController+Extension.m
//  Universal
//
//  Created by 杜晓星 on 16/1/8.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)


- (UIViewController*)rootNavController;
{
    return [[self stackViewControllers] firstObject];
    
}
- (UIViewController*)preViewContrller;
{
    NSArray *stackViewControllers = [self stackViewControllers];
    if (stackViewControllers.count == 1) {
        return [stackViewControllers firstObject];
    }
    else
    {
        return [stackViewControllers objectAtIndex:1];
    }
}
- (BOOL)popToViewController:(NSString*)viewControllerClass;
{
    Class popViewController = NSClassFromString(viewControllerClass);
    
    UIViewController *popViewControllerInArray = nil;
    
    NSArray *stackViewControllers = [self stackViewControllers];
    for (UIViewController *vcInArray in stackViewControllers) {
        if ([vcInArray isKindOfClass:popViewController]) {
            popViewControllerInArray = vcInArray;
        }
    }
    
    if (popViewControllerInArray) {
        [self.navigationController popToViewController:popViewControllerInArray animated:YES];
        return YES;
    }
    else
    {
            return NO;
    }
}


- (NSArray*)stackViewControllers
{
    UINavigationController *nav = self.navigationController;
    if (nav) {
        return nav.viewControllers;
    }
    else
    {
        return nil;
    }
}

@end
