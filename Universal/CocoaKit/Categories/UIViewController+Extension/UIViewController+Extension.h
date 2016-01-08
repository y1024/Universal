//
//  UIViewController+Extension.h
//  Universal
//
//  Created by 杜晓星 on 16/1/8.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

/**
 *  返回 rootViewController
 *
 *  @return <#return value description#>
 */
- (UIViewController*)rootNavController;

/**
 *  返回前一视图
 *
 *  @return
 */
- (UIViewController*)preViewContrller;
/**
 *  跳转到 指定ViewController 如果 当前栈中有2个相同的 pop到最近的
 *
 *  @param viewControllerClass
 */
- (BOOL)popToViewController:(NSString*)viewControllerClass;

@end
