//
//  RuleTableViewCell.h
//  Demo
//
//  Created by 杜晓星 on 15/11/20.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RuleTableViewCellModel.h"

typedef NS_ENUM(NSUInteger, RuleTableViewCellState) {
    RuleTableViewCellStateShort,
    RuleTableViewCellStateMiddle,
    RuleTableViewCellStateLong,
};

@interface RuleTableViewCell : UITableViewCell

@property(nonatomic,assign)NSInteger ruleTableViewCellState;

@property (weak, nonatomic) IBOutlet UILabel *ruleLabel;


@property (retain, nonatomic) IBOutlet UIImageView *cellNormalState;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellNormalRuleWidth;

- (void)configCell:(RuleTableViewCellModel*)model;


@end
