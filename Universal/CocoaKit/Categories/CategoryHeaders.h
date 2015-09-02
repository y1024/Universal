//
//  CategoryHeaders.h
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIScreen+Extension.h"
#import "NSBundle+Extension.h"
#import "UIApplication+Extension.h"
#import "NSString+Extension.h"
#import "UIAlertView+Extension.h"
#import "NSUserDefaults+Extension.h"
#import "UIDevice+Extension.h"
#import "UIColor+Extension.h"
#import "NSUserDefaults+Extension.h"
#import "NSArray+Extension.h"
#import "NSDictionary+Extension.h"
#import "UIImage+Extension.h"
#import "NSHTTPCookieStorage+Extension.h"
#import "NSURLCache+Extension.h"
#import "AVCaptureDevice+Extension.h"
#import "NSData+Extension.h"
#import "UIView+Extension.h"
#import "UIScrollView+Extension.h"
#import "UIWebView+Extension.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((rgbValue >> 16) & 0xFF)/255.f \
green:((rgbValue >> 8) & 0xFF)/255.f \
blue:(rgbValue & 0xFF)/255.f \
alpha:1.0f]