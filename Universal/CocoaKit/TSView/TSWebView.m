//
//  MYWebView.m
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "TSWebView.h"

@implementation TSWebView

- (id)initWithFrame:(CGRect) frame URLString:(NSString *)urlString;
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0f]];
    }
    
    return self;
}
@end
