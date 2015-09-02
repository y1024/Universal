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
     self.header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    
    [self beginMJRefresh];
}

- (void)addMJGifHeaderWithTarget:(id)target action:(SEL)aciton
{
    self.header = [MJRefreshGifHeader headerWithRefreshingTarget:target refreshingAction:aciton];
}


- (void)beginMJRefresh
{
    [self.header beginRefreshing];
}

- (void)endMJRefresh
{
    [self.header endRefreshing];
}

- (void)addMJFooterWithTarget:(id)target action:(SEL)_action
{
    self.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:_action];
}

- (void)addMJGifFooterWithTarget:(id)target action:(SEL)action
{
    self.footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:action];
}

- (void)endMJLoadMore
{
    [self.footer endRefreshing];
}

- (void)endMJLoadNoMore
{
    [self.footer noticeNoMoreData];
}

- (void)resetMJFooter
{
    [self.footer resetNoMoreData];
}


@end
