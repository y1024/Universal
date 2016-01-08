//
//  UIViewController+Extension.m
//  Universal
//
//  Created by 杜晓星 on 16/1/8.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import "UIViewController+Extension.h"
#import <objc/runtime.h>

static const char *singleTapGRKey = "singleTapGR";

@implementation UIViewController (Extension)

- (void)setSingleTapGR:(UITapGestureRecognizer *)singleTapGR
{
    objc_setAssociatedObject(self, singleTapGRKey,singleTapGR, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITapGestureRecognizer*)singleTapGR
{
    return objc_getAssociatedObject(self, singleTapGRKey);
}


- (void)dealloc
{
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

+ (void)load
{
    [super load];
}

- (void)setupForDismissKeyboard
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    self.singleTapGR = singleTapGR;
    [nc addObserver:self selector:@selector(addTapAction) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(removeTapAction) name:UIKeyboardWillHideNotification object:nil];
}

- (void)removeTapAction
{
    [self.view removeGestureRecognizer:self.singleTapGR];
}

- (void)addTapAction
{
    
    NSLog(@"UIKeyboardWillShowNotification");
    
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    self.singleTapGR = singleTapGR;
    [self.view addGestureRecognizer:singleTapGR];
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
}

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
