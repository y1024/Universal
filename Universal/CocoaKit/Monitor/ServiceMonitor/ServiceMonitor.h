//
//  ServiceMonitor.h
//  Monitor
//
//  Created by 杜晓星 on 16/2/17.
//  Copyright © 2016年 杜晓星. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceMonitor : NSObject

+ (instancetype)instance;

- (void)install;
- (void)uninstall;

- (void)powerOn;
- (void)powerOff;

@end
