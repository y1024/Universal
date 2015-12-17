//
//  TTTextView.m
//  CoreText
//
//  Created by 杜晓星 on 15/12/17.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import "TTTextView.h"


#if !(__has_feature(objc_instancetype))
#define instancetype id
#endif

@interface TTTextView ()

- (void)refreshPlaceholder;

@end


@implementation TTTextView

{
    UILabel *placeHolderLabel;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self limit];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
      [self limit];  
    }
    return self;
}


- (void)limit
{
    if (_maxCount <= 0) {
        _maxCount = NSIntegerMax;
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(questionTextViewTextDidChange:) name:UITextViewTextDidChangeNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshPlaceholder) name:UITextViewTextDidChangeNotification object:self];
}
- (void)questionTextViewTextDidChange:(NSNotification*)noti
{
    [self changeString];
}

- (void)changeString
{
    NSUInteger contentLength = self.text.length;
    
    if (contentLength >= _maxCount) {
        
        self.text = [self.text substringToIndex:_maxCount];
    }
}

//- (void)doLimitInputForTextView:(UITextView *)textField MaxLength:(NSInteger)MaxLength
//{
//    NSString *toBeString = textField.text;
//    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
//    if (![lang isEqualToString:@"en-US"]) { //非英文输入 中文输入法.. 简体中文输入，包括简体拼音，健体五笔，简体手写
//        UITextRange *selectedRange = [textField markedTextRange];
//        //获取高亮部分
//        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
//        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
//        if (!position) {
//            if (toBeString.length > MaxLength) {
//                textField.text = [toBeString substringToIndex:MaxLength];
//            }
//        }
//        /*
//         // 有高亮选择的字符串，则暂不对文字进行统计和限制
//         else{
//         
//         }
//         */
//    }
//    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
//    else{
//        if (toBeString.length > MaxLength) {
//            textField.text = [toBeString substringToIndex:MaxLength];
//        }
//    }
//}
- (void)refreshPlaceholder
{
    if([[self text] length])
    {
        [placeHolderLabel setAlpha:0];
    }
    else
    {
        [placeHolderLabel setAlpha:1];
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self refreshPlaceholder];
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    placeHolderLabel.font = self.font;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [placeHolderLabel sizeToFit];
    placeHolderLabel.frame = CGRectMake(8, 8, CGRectGetWidth(self.frame)-16, CGRectGetHeight(placeHolderLabel.frame));
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    if ( placeHolderLabel == nil )
    {
        placeHolderLabel = [[UILabel alloc] init];
        placeHolderLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
        placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        placeHolderLabel.numberOfLines = 0;
        placeHolderLabel.font = self.font;
        placeHolderLabel.backgroundColor = [UIColor clearColor];
        placeHolderLabel.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        placeHolderLabel.alpha = 0;
        [self addSubview:placeHolderLabel];
    }
    
    placeHolderLabel.text = self.placeholder;
    [self refreshPlaceholder];
}

//When any text changes on textField, the delegate getter is called. At this time we refresh the textView's placeholder
-(id<UITextViewDelegate>)delegate
{
    [self refreshPlaceholder];
    return [super delegate];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
