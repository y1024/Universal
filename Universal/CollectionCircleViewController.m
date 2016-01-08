//
//  CollectionCircleViewController.m
//  Universal
//
//  Created by 杜晓星 on 15/12/28.
//  Copyright © 2015年 emiaobao. All rights reserved.
//

#import "CollectionCircleViewController.h"
#import "CircleLayoutCell.h"
#import "CircleLayout.h"
#import "UIViewController+Extension.h"


NSString * const cellIdentifier = @"MY_CELL";
@interface CollectionCircleViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *circleCollectionView;
@property (nonatomic, assign) NSInteger cellCount;
/**
 *  <#Description#>
 */
@property(nonatomic,strong)UITapGestureRecognizer   *singleTapGR              ;
@end

@implementation CollectionCircleViewController

- (void)dealloc
{
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.cellCount = 10;
    self.circleCollectionView.collectionViewLayout = [[CircleLayout alloc]init];
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.circleCollectionView addGestureRecognizer:tapRecognizer];
    [self.circleCollectionView registerClass:[CircleLayoutCell class] forCellWithReuseIdentifier:cellIdentifier];
    [self.circleCollectionView reloadData];
    self.circleCollectionView.backgroundColor = [UIColor whiteColor];
    [self setupForDismissKeyboard];
    
    return;
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    
    __weak UIViewController *weakSelf = self;
    
//    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
//    [nc addObserverForName:UIKeyboardWillShowNotification
//                    object:nil
//                     queue:mainQuene
//                usingBlock:^(NSNotification *note){
//                    [weakSelf.view addGestureRecognizer:singleTapGR];
//                    NSLog(@"UIKeyboardWillShowNotification");
//                }];
    [nc addObserver:self selector:@selector(addTapAction) name:UIKeyboardWillShowNotification object:nil];
    
//    [nc addObserverForName:UIKeyboardWillHideNotification
//                    object:nil
//                     queue:mainQuene
//                usingBlock:^(NSNotification *note){
//                    [weakSelf.view removeGestureRecognizer:singleTapGR];
//                }];
    
      [nc addObserver:self selector:@selector(removeTapAction) name:UIKeyboardWillHideNotification object:nil];
    
//    for (int i = 0 ; i < 100000; i++) {
//        NSString *str = [NSString stringWithFormat:@"%d",i];
//    }
}

- (void)removeTapAction
{
    [self.view removeGestureRecognizer:self.singleTapGR];
}

- (void)addTapAction
{
    
     NSLog(@"UIKeyboardWillShowNotification");
    
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    self.singleTapGR = singleTapGR;
    [self.view addGestureRecognizer:singleTapGR];
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return self.cellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CircleLayoutCell *cell = [cv dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint initialPinchPoint = [sender locationInView:self.circleCollectionView];
        NSIndexPath* tappedCellPath = [self.circleCollectionView indexPathForItemAtPoint:initialPinchPoint];
        if (tappedCellPath!=nil)
        {
            self.cellCount = self.cellCount - 1;
            [self.circleCollectionView performBatchUpdates:^{
                [self.circleCollectionView deleteItemsAtIndexPaths:@[tappedCellPath]];
                
            } completion:nil];
        }
        else
        {
            self.cellCount = self.cellCount + 1;
            [self.circleCollectionView performBatchUpdates:^{
                [self.circleCollectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
            } completion:nil];
        }
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
