//
//  MyViewController.m
//  Universal
//
//  Created by 杜晓星 on 16/1/8.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import "MyViewController.h"
#import "PhoneTextField.h"

@interface MyViewController ()<PhoneTextFieldDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet PhoneTextField *tf;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tf.phoneDelegate = self;
    
}


- (void)phoneTextFieldTextDidChanged:(NSString *)text
{
    NSLog(@"text:%@",text);
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
