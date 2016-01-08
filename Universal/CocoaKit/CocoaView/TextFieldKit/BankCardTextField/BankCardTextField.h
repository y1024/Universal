//
//  BankCardTextField.h
//  Universal
//
//  Created by 杜晓星 on 16/1/6.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BankCardTextFieldDelegate <NSObject>
/**
 *  代理方法 返回 字符串
 *
 *  @param text
 */
- (void)bankCardTextFieldTextDidChanged:(NSString*)text;

@end

/**
 *  格式化 银行卡输入框
 */

@interface BankCardTextField : UITextField<UITextFieldDelegate>


{
    NSString    *previousTextFieldContent;
    UITextRange *previousSelection;
}

/**
 *  去除 空格
 */
@property(nonatomic,strong,readonly)NSString *bankCardTextFieldText;
/**
 *
 */
@property(nonatomic,assign)id               bankCardDelegate;

@end
