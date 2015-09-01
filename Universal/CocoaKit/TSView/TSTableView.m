//
//  MYTableView.m
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "TSTableView.h"
#import "PodHeaders.h"


@implementation TSTableView

+ (instancetype)loadFromNibWithNibName:(NSString*)nibName
{
    return [[[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil]firstObject];
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        
        self.backgroundColor = TSViewNormalColor;
        
    }
    
    return self ;
    
}

- (void)ts_addMJHeaderWithTarget:(id)target action:(SEL)action
{
    self.header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    
    [self ts_beginMJRefresh];
}

- (void)ts_addMJGifHeaderWithTarget:(id)target action:(SEL)aciton
{
    self.header = [MJRefreshGifHeader headerWithRefreshingTarget:target refreshingAction:aciton];
}


- (void)ts_beginMJRefresh
{
    [self.header beginRefreshing];
}

- (void)ts_endMJRefresh
{
    [self.header endRefreshing];
}

- (void)ts_addMJFooterWithTarget:(id)target action:(SEL)_action
{
        self.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:_action];
}

- (void)ts_addMJGifFooterWithTarget:(id)target action:(SEL)action
{
        self.footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:action];
}

- (void)ts_endMJLoadMore
{
    [self.footer endRefreshing];
}

- (void)ts_endMJLoadNoMore
{
    [self.footer noticeNoMoreData];
}

- (void)ts_resetMJFooter
{
    [self.footer resetNoMoreData];
}


@end
