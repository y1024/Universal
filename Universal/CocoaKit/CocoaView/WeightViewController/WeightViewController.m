//
//  WeightViewController.m
//  Demo
//
//  Created by 杜晓星 on 15/11/24.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import "WeightViewController.h"
#import "WeightCollectionViewCell.h"
#import "WeightCollectionFlowLayout.h"

#define kCollectionViewContentLeftOffset CGRectGetWidth([UIApplication sharedApplication].keyWindow.bounds)/2

@interface WeightViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *weightCollectionView;
@property(nonatomic,assign)NSInteger mistake;
@property(nonatomic,strong)NSMutableArray *sourceArray;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

@implementation WeightViewController

- (instancetype)initWithValueMin:(CGFloat)min ruleMax:(CGFloat)max delegate:(id)delegate
{
    return [self initWithValueMin:min ruleMax:max defaultValue:min delegate:delegate];
}

- (instancetype)initWithValueMin:(CGFloat)min ruleMax:(CGFloat)max defaultValue:(CGFloat)defaulValue delegate:(id)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.valueMin = min;
        self.valueMax = max;
        self.defaulValue = defaulValue;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIEdgeInsets inset = UIEdgeInsetsMake(0, kCollectionViewContentLeftOffset, 0, kCollectionViewContentLeftOffset);
    _weightCollectionView.contentInset = inset;
    
    CGFloat vaule = -kCollectionViewContentLeftOffset + (_defaulValue - _valueMin)*200;
    _weightCollectionView.contentOffset = CGPointMake(vaule, 0);

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_weightCollectionView registerNib:[UINib nibWithNibName:@"WeightCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"WeightCollectionViewCell"];
    _weightCollectionView.collectionViewLayout = [[WeightCollectionFlowLayout alloc]init];
    self.sourceArray = [NSMutableArray array];
    [self configSource];
    
    CGRectGetWidth([UIApplication sharedApplication].keyWindow.bounds);
    
    

}

- (void)configSource
{
    if (_valueMin <=0 ) {
        _valueMin = 0 ;
    }
    if (_valueMax <= 0) {
        _valueMax = 0;
    }
    if (_valueMin >= _valueMax) {
        _valueMax = _valueMin + 10 ;
    }
    _mistake = ((NSInteger)(_valueMax *10 - _valueMin *10)) + 1;
    
    CGFloat kRuleMin = _valueMin;
    
    for (int i = 0; i < _mistake; i ++) {
        
        @autoreleasepool {
            WeightCollectionViewCellModel *model = [[WeightCollectionViewCellModel alloc]init];
            model.value = [NSNumber numberWithFloat:kRuleMin] ;
            kRuleMin += 0.1;
            [_sourceArray addObject:model];
        }

    }
    [_weightCollectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _sourceArray.count ;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WeightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeightCollectionViewCell" forIndexPath:indexPath];
    
    WeightCollectionViewCellModel *model = _sourceArray[indexPath.item];
    
    [cell configCell:model];
    
    
    return cell ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset =  scrollView.contentOffset.x + kCollectionViewContentLeftOffset;
    CGFloat value = _valueMin +  offset/200;
    _valueLabel.text = [NSString stringWithFormat:@"%.1lf",value];
    
    if ([_delegate respondsToSelector:@selector(valueDidChange:)]) {
        [_delegate valueDidChange:value];
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
