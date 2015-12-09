//
//  ReplyViewController.h
//  yeemiao
//
//  Created by 杜晓星 on 15/12/5.
//  Copyright © 2015年 Threegene. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ReplyViewControllerDelegate <NSObject>

- (void)sendButtonClick:(NSString*)text;


@end

@interface ReplyViewController : UIViewController
/**
 *
 */
@property(nonatomic,assign)id              delegate;
@property(nonatomic,strong)NSString *placeHolderString;


@end
