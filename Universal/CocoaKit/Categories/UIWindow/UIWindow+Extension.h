//
//  UIWindow+Extension.h
//  Universal
//
//  Created by emiaobao on 15/9/8.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BorderView : UIView

- (void)didAppearingAnimationStopped;


@end

@interface UIWindow (Extension)

+ (UIWindow*)__ldx_keyWindow;

@end


