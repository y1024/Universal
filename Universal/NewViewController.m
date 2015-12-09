//
//  NewViewController.m
//  Universal
//
//  Created by 杜晓星 on 15/10/26.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NewViewController.h"
#import "CategoryHeaders.h"
#import  "UIImageView+Extension.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)dealloc
{

    NSLog(@"销毁");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    NSLog(@"%@",self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor redColor];
    
//  NSTimer *timer =  [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(testTimer) userInfo:nil repeats:NO];
////    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////        [timer invalidate];
////    });
//       [timer invalidate];
    
//    self.view.backgroundColor = [UIColor whiteColor];
//    
//    UIImageView *imageView = [UIImageView new];
//    
//    [self.view addSubview:imageView];
//
////    imageView.frame = CGRectMake(0, 100, 200, 200);
//            [imageView setFrame:CGRectMake(0,100, 100,100) QRCodeImageWithQRString:@"二维码www.baidu.com $@%a"];
    
//    [self.view removeAllSubViews];
//    
//    NSLog(@"%@",[NSString QRCodeStringFromImage:@"foobar"]);
//    
//    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
//    [self.view addSubview:webView];
//    [webView loadURL:@"http://www.baidu.com"];
//    
//    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(repeatInfo:) userInfo:webView repeats:YES];
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
