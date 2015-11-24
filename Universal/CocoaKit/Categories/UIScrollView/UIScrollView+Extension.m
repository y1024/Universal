//
//  UITableView+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIScrollView+Extension.h"
#import <MJRefresh.h>

@implementation UIScrollView (Extension)

- (void)addMJHeaderWithTarget:(id)target action:(SEL)action
{
     self.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    
    [self beginMJRefresh];
}

- (void)addMJGifHeaderWithTarget:(id)target action:(SEL)aciton
{
    self.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:target refreshingAction:aciton];
}


- (void)beginMJRefresh
{
    [self.mj_header beginRefreshing];
}

- (void)endMJRefresh
{
    [self.mj_header endRefreshing];
}

- (void)addMJFooterWithTarget:(id)target action:(SEL)_action
{
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:_action];
}

- (void)addMJGifFooterWithTarget:(id)target action:(SEL)action
{
    self.mj_footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:action];
}

- (void)endMJLoadMore
{
    [self.mj_footer endRefreshing];
}

- (void)endMJLoadNoMore
{
    [self.mj_footer endRefreshingWithNoMoreData];
}

- (void)resetMJFooter
{
    [self.mj_footer resetNoMoreData];
}


@end
