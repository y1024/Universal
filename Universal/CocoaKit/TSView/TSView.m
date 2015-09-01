//
//  TSView.m
//  CocoaKit
//
//  Created by emiaobao on 15/8/9.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "TSView.h"

@implementation TSView


+ (instancetype)loadFromNibWithNibName:(NSString*)nibName
{
    return [[[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil]firstObject];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
