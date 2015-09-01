//
//  UIAlertView+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIAlertView+Extension.h"

@implementation UIAlertView (Extension)

+ (UIAlertView*)showAlertViewWithTitle:(NSString*)title message:(NSString*)message cancle:(NSString*)cancle other:(NSString*)other delegate:(id)delegate tag:(NSInteger)tag
{
    UIAlertView *kAlertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancle otherButtonTitles:other, nil];
    kAlertView.tag = tag;
    [kAlertView show];
    
    return kAlertView;
}

@end
