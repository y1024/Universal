//
//  GIFViewController.m
//  Universal
//
//  Created by 杜晓星 on 16/6/21.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import "GIFViewController.h"

@interface GIFViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation GIFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *resourceURL = [[NSBundle mainBundle]pathForResource:@"fight" ofType:@"gif"];
    self.webView.userInteractionEnabled = NO;
    NSData *GIFData = [[NSData alloc]initWithContentsOfFile:resourceURL];
    [self.webView loadData:GIFData MIMEType:@"image/gif" textEncodingName:@"utf-8" baseURL:[NSURL URLWithString:resourceURL]];
    
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
