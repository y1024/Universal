//
//  ReplyViewController.m
//  yeemiao
//
//  Created by 杜晓星 on 15/12/5.
//  Copyright © 2015年 Threegene. All rights reserved.
//

#import "ReplyViewController.h"


#define kContentMaxNumber  300

@interface ReplyViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeightConstant;
@property (weak, nonatomic) IBOutlet UILabel *placeHolderLabel;


@end

@implementation ReplyViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_textView becomeFirstResponder];
}


- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView.text.length == 0) {
        [UIView animateWithDuration:0.5f animations:^{
            
        } completion:^(BOOL finished) {
            self.placeHolderLabel.alpha  = 0 ;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.5f animations:^{
            
        } completion:^(BOOL finished) {
            self.placeHolderLabel.alpha  = 1 ;
        }];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@""]) {
        return YES;
    }

    if ([textView.text length] < kContentMaxNumber) {

        return YES;
    }
    return NO;
}



//- (void)contentViewTextDidChange:(NSNotification*)noti
//{
//    UITextView *tf = noti.object;
//    NSString *message = [NSString stringWithFormat:@"%ld",kContentMaxNumber - tf.text.length];
//    _messageLabel.text = message;
//}

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
