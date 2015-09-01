//
//  UIAlertView+Extension.h
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Extension)

+ (UIAlertView*)showAlertViewWithTitle:(NSString*)title message:(NSString*)message cancle:(NSString*)cancle other:(NSString*)other delegate:(id)delegate tag:(NSInteger)tag;

@end
