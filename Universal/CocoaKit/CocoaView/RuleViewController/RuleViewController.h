//
//  RuleViewController.h
//  Demo
//
//  Created by 杜晓星 on 15/11/20.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RuleViewControllerRuleChangeDelegate <NSObject>

- (void)ruleDidChange:(CGFloat)current;

@end


@interface RuleViewController : UIViewController


@property(nonatomic,assign)id delegate;

@property(nonatomic,assign)NSInteger ruleMin;
@property(nonatomic,assign)NSInteger ruleMax;




@end
