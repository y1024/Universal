//
//  PhoneTextField.h
//  Demo
//
//  Created by 杜晓星 on 15/10/26.
//  Copyright (c) 2015年 杜晓星. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PhoneTextFieldDelegate <NSObject>
/**
 *  代理方法 返回 字符串
 *
 *  @param text 
 */
- (void)phoneTextFieldTextDidChanged:(NSString*)text;

@end

/**
 *  格式化 手机号码输入框
 */

@interface PhoneTextField : UITextField<UITextFieldDelegate>

{
    NSString    *previousTextFieldContent;
    UITextRange *previousSelection;
}

/**
 *  去除 空格 
 */
@property(nonatomic,strong,readonly)NSString *phoneTextFieldText;

/**
 *  delegate
 */
@property(nonatomic,assign)id               phoneDelegate;


@end
