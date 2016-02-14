//
//  UICollectionViewFlowLayout+PhotoSource.m
//  yeemiao
//
//  Created by 杜晓星 on 16/1/26.
//  Copyright © 2016年 Threegene. All rights reserved.
//

#import "UICollectionViewFlowLayout+PhotoSource.h"

@implementation UICollectionViewFlowLayout (PhotoSource)

+ (instancetype)photoSource
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    
    CGFloat screenWidth =   CGRectGetWidth([UIScreen mainScreen].bounds) ;
    
    CGFloat itemWidth = (screenWidth - 4*5)/3;
    layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
    
    return layout;
}

@end
