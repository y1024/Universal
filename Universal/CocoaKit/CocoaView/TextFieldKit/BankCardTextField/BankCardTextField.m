//
//  BankCardTextField.m
//  Universal
//
//  Created by 杜晓星 on 16/1/6.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import "BankCardTextField.h"


@implementation BankCardTextField

static const int kBankCardNumber = 19;

- (NSString*)bankCardTextFieldText
{
    NSString *textString = self.text;
    
    return [textString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
        self.keyboardType = UIKeyboardTypeNumberPad;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}


- (void)awakeFromNib
{
    [self initialize];
}

-(void)initialize
{
    self.delegate = self;
    [self addTarget:self action:@selector(reformatAsCardNumber:) forControlEvents:UIControlEventEditingChanged];
}
// Source and explanation: http://stackoverflow.com/a/19161529/1709587
- (void)reformatAsCardNumber:(UITextField *)textField
{
    NSUInteger targetCursorPosition =[textField offsetFromPosition:textField.beginningOfDocument toPosition:textField.selectedTextRange.start];
    
    NSString *cardNumberWithoutSpaces = [self removeNonDigits:textField.text andPreserveCursorPosition:&targetCursorPosition];
    
    if ([cardNumberWithoutSpaces length] > kBankCardNumber) {
        [textField setText:previousTextFieldContent];
        textField.selectedTextRange = previousSelection;
        return;
    }
    
    NSString *cardNumberWithSpaces =[self insertSpacesEveryFourDigitsIntoString:cardNumberWithoutSpaces andPreserveCursorPosition:&targetCursorPosition];
    
    textField.text = cardNumberWithSpaces;
    UITextPosition *targetPosition = [textField positionFromPosition:[textField beginningOfDocument] offset:targetCursorPosition];
    
    [textField setSelectedTextRange:[textField textRangeFromPosition:targetPosition toPosition :targetPosition]];
    
    if ([self.bankCardDelegate respondsToSelector:@selector(bankCardTextFieldTextDidChanged:)]) {
        [self.bankCardDelegate bankCardTextFieldTextDidChanged:textField.text];
    }
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    previousTextFieldContent = textField.text;
    previousSelection = textField.selectedTextRange;
    
    return YES;
}

- (NSString*)removeNonDigits:(NSString*)string andPreserveCursorPosition:(NSUInteger*)cursorPosition
{
    NSUInteger      originalCursorPosition = *cursorPosition;
    NSMutableString *digitsOnlyString = [NSMutableString new];
    
    for (NSUInteger i = 0; i < [string length]; i++) {
        unichar characterToAdd = [string characterAtIndex:i];
        
        if (isdigit(characterToAdd)) {
            NSString *stringToAdd = [NSString stringWithCharacters:&characterToAdd length:1];
            
            [digitsOnlyString appendString:stringToAdd];
        } else {
            if (i < originalCursorPosition) {
                (*cursorPosition)--;
            }
        }
    }
    
    return digitsOnlyString;
    
}

/**
 *  判断当前 text 是否需要追加空格
 *
 *  @param i
 *
 *  @return 
 */
- (BOOL)appendBankWithIndex:(NSInteger)i
{
    if (i%4 == 0 && i > 0) {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (NSString*)insertSpacesEveryFourDigitsIntoString:(NSString*)string andPreserveCursorPosition:(NSUInteger*)cursorPosition
{
    NSMutableString *stringWithAddedSpaces = [NSMutableString new];
    NSUInteger      cursorPositionInSpacelessString = *cursorPosition;
    
    for (NSUInteger i = 0; i < [string length]; i++) {
        
        if ([self appendBankWithIndex:i]) {
            [stringWithAddedSpaces appendString:@" "];
            
            if (i < cursorPositionInSpacelessString) {
                (*cursorPosition)++;
            }
        }
        unichar     characterToAdd = [string characterAtIndex:i];
        NSString    *stringToAdd =
        [NSString stringWithCharacters:&characterToAdd length:1];
        
        [stringWithAddedSpaces appendString:stringToAdd];
    }
    
    return stringWithAddedSpaces;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
