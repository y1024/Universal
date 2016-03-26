//
//  ServiceMonitor.m
//  Monitor
//
//  Created by 杜晓星 on 16/2/17.
//  Copyright © 2016年 杜晓星. All rights reserved.
//

#import "ServiceMonitor.h"

#import "ServiceMonitorStatusBar.h"

#import "ServiceMonitorCPUModel.h"
#import "ServiceMonitorMemoryModel.h"
#import "ServiceMonitorNetworkModel.h"
#import "ServiceMonitorFPSModel.h"

@implementation ServiceMonitor


{
    NSTimer *						_timer;
    ServiceMonitorCPUModel *		_model1;
    ServiceMonitorMemoryModel *		_model2;
    ServiceMonitorNetworkModel *	_model3;
    ServiceMonitorFPSModel *		_model4;
    ServiceMonitorStatusBar *		_bar;
}

static ServiceMonitor *_singletonObject = nil ;

- (void)install
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didApplicationLaunched)
                                                 name:UIApplicationDidFinishLaunchingNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willApplicationTerminate)
                                                 name:UIApplicationWillTerminateNotification
                                               object:nil];
    
    _model1 = [ServiceMonitorCPUModel sharedInstance];
    _model2 = [ServiceMonitorMemoryModel sharedInstance];
    _model3 = [ServiceMonitorNetworkModel sharedInstance];
    _model4 = [ServiceMonitorFPSModel sharedInstance];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f / 10.0f
                                              target:self
                                            selector:@selector(didTimeout)
                                            userInfo:nil
                                             repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)uninstall
{
    _bar = nil;
    _model1 = nil;
    _model2 = nil;
    _model3 = nil;
    _model4 = nil;
    
    [_timer invalidate];
    _timer = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)powerOn
{
}

- (void)powerOff
{
}

#pragma mark -

- (void)didApplicationLaunched
{
    _bar = [[ServiceMonitorStatusBar alloc] init];
    [_bar show];
}

- (void)willApplicationTerminate
{
    _bar = nil;
}

- (void)didTimeout
{
    [_model1 update];
    [_model2 update];
    [_model3 update];
    [_model4 update];
    
    [_bar update];
}


- (instancetype)init
{
    if (_singletonObject) {
        
        return _singletonObject;
    }
    else
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            _singletonObject = [super init];
            
        });
    }
    return _singletonObject ;
}

+ (instancetype)instance;
{
    if (_singletonObject) {
        
        return _singletonObject;
        
    }
    _singletonObject = [[super allocWithZone:nil]init];
    
    return _singletonObject ;
}

#pragma mark + allocWithZone
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self instance];
}
#pragma mark - copyWithZone
- (instancetype)copyWithZone:(NSZone*)zone
{
    return self ;
}



@end
