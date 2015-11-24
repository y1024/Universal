//
//  WeightViewController.h
//  Demo
//
//  Created by 杜晓星 on 15/11/24.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol WeightViewControllerValueChangeDelegate <NSObject>

- (void)valueDidChange:(CGFloat)current;

@end

@interface WeightViewController : UIViewController

@property(nonatomic,assign)id delegate;

@property(nonatomic,assign)CGFloat valueMin;
@property(nonatomic,assign)CGFloat valueMax;

- (instancetype)initWithValueMin:(CGFloat)min ruleMax:(CGFloat)max delegate:(id)delegate;

@end
