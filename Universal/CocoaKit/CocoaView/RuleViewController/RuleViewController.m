//
//  RuleViewController.m
//  Demo
//
//  Created by 杜晓星 on 15/11/20.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import "RuleViewController.h"

#import "RuleTableViewCell.h"


@interface RuleViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *taleView;

@property(nonatomic,strong)NSMutableArray *sourceArray;

@property(nonatomic,assign)NSInteger       mistake;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation RuleViewController


- (instancetype)initWithRuleMin:(CGFloat)min ruleMax:(CGFloat)max delegate:(id)delegate
{
    return [self initWithRuleMin:min ruleMax:max defaultValue:min delegate:delegate];
}

- (instancetype)initWithRuleMin:(CGFloat)min ruleMax:(CGFloat)max defaultValue:(CGFloat)defaultVale delegate:(id)delegate
{
    self = [super init];
    if (self) {
        self.ruleMin = min;
        self.ruleMax = max;
        self.delegate = delegate;
        if (defaultVale == 0) {
             self.defaultValue = min;
        }
        else
        {
            self.defaultValue = defaultVale;
        }
       
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.taleView registerNib:[UINib nibWithNibName:@"RuleTableViewCell" bundle:nil] forCellReuseIdentifier:@"RuleTableViewCell"];
    self.sourceArray = [NSMutableArray array];
    [self configSource];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    CGFloat screenHeight = CGRectGetHeight([UIApplication sharedApplication].keyWindow.bounds);
    
    UIEdgeInsets insets = UIEdgeInsetsMake(screenHeight - 451.5 + 14, 0, 215, 0);
    
    _taleView.contentInset = insets;
    
//    CGFloat offsetY = insets.top + (_ruleMax - _defaultValue) * 100;
//    
//    _taleView.contentOffset = CGPointMake(0, offsetY);
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGFloat screenHeight = CGRectGetHeight([UIApplication sharedApplication].keyWindow.bounds);
    
    UIEdgeInsets insets = UIEdgeInsetsMake(screenHeight - 451.5 + 14, 0, 215, 0);
    CGFloat      yOffset = _taleView.contentSize.height - insets.top - insets.bottom - (10) - (_defaultValue - _ruleMin)*100;
 
}


- (void)configSource
{
    if (_ruleMin <=0 ) {
        _ruleMin = 0 ;
    }
    if (_ruleMax <= 0) {
        _ruleMax = 0;
    }
    if (_ruleMin >= _ruleMax) {
        _ruleMax = _ruleMin + 10 ;
    }
    _mistake = ((NSInteger)(_ruleMax - _ruleMin)) * 10;
    
    CGFloat kRuleMax = _ruleMax;
    
    for (int i = 0; i <= _mistake; i ++) {
        RuleTableViewCellModel *model = [[RuleTableViewCellModel alloc]init];
        model.rule = kRuleMax ;
        
        kRuleMax -= 0.1;

        [_sourceArray addObject:model];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sourceArray.count ;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RuleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RuleTableViewCell"];
    [cell configCell:_sourceArray[indexPath.row]];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat screenHeight = CGRectGetHeight([UIApplication sharedApplication].keyWindow.bounds);
    CGFloat offset =  scrollView.contentOffset.y + (screenHeight - 451.5 + 14);
    CGFloat rule = _ruleMax - offset*0.1/10;
    if (rule <= 0) {
        rule = 0 ;
    }
    _messageLabel.text = [NSString stringWithFormat:@"%.1lf",rule];
    
    if ([_delegate respondsToSelector:@selector(ruleDidChange:)]) {
        [_delegate ruleDidChange:rule];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
