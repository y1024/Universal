//
//  ViewController.m
//  Universal
//
//  Created by emiaobao on 15/8/31.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "ViewController.h"

#import "PodHeaders.h"


@interface ViewController ()



@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen width], [UIScreen height])];
//    [self.view addSubview:scroll];
//    scroll.contentSize = CGSizeMake([UIScreen width], [UIScreen height]);
//    
//    [scroll addMJHeaderWithTarget:self action:@selector(refresh:)];
//    
//    
//    DDLogWarn(@"home:%@",[NSString timestamp]);
//    
//    
//    UIImageView *line = [UIImageView drawImaginarylineWithRect:CGRectMake(0, 200, 320, 1)];
//    [self.view addSubview:line];
    
    NSLog([NSString dateWithTimestamp:1443024000000]);
    
}

//- (void)refresh:(MJRefreshHeader*)view
//{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        [view endRefreshing];
//        
//    });
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
