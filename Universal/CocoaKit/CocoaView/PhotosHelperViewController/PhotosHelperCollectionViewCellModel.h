//
//  PhotosHelperCollectionViewCellModel.h
//  Demo
//
//  Created by 杜晓星 on 15/12/1.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PhotosHelperCollectionViewCellModel : NSObject

@property(nonatomic,assign)CGFloat imageWidth;
@property(nonatomic,assign)CGFloat imageHeight;

@property(nonatomic,strong)UIImage *image;

@property(nonatomic,assign)BOOL    selected;

@end
