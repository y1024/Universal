//
//  MYCollectionView.m
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "TSCollectionView.h"
#import "PodHeaders.h"


@implementation TSCollectionView

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        self.backgroundColor = TSViewNormalColor;
    }
    
    return self;
    
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
