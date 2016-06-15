//
//  AppDelegate.h
//  Universal
//
//  Created by emiaobao on 15/8/31.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SimplePing.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,SimplePingDelegate>

@property (strong, nonatomic) SimplePing  *ping;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSTimer  *sendTimer;


@end

