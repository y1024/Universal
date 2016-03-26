//
//     ____    _                        __     _      _____
//    / ___\  /_\     /\/\    /\ /\    /__\   /_\     \_   \
//    \ \    //_\\   /    \  / / \ \  / \//  //_\\     / /\/
//  /\_\ \  /  _  \ / /\/\ \ \ \_/ / / _  \ /  _  \ /\/ /_
//  \____/  \_/ \_/ \/    \/  \___/  \/ \_/ \_/ \_/ \____/
//
//	Copyright Samurai development team and other contributors
//
//	http://www.samurai-framework.com
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "ServiceMonitorStatusBar.h"

#import "ServiceMonitorCPUModel.h"
#import "ServiceMonitorMemoryModel.h"
#import "ServiceMonitorNetworkModel.h"
#import "ServiceMonitorFPSModel.h"

#import "JBChartView.h"
#import "JBBarChartView.h"
#import "JBLineChartView.h"

#pragma mark -

@interface ServiceMonitorStatusBar(Private)<JBLineChartViewDataSource, JBLineChartViewDelegate>
@end

#pragma mark -

@implementation ServiceMonitorStatusBar
{
	BOOL						_inited;
	UILabel *					_label;
	JBLineChartView *			_cpuChart;
	JBLineChartView *			_fpsChart;
    

    
	ServiceMonitorCPUModel *	_cpuModel;
	ServiceMonitorFPSModel *	_fpsModel;
    
    
//    JBLineChartView *           _netWorkUploadChart;
//    JBLineChartView *           _netWorkDownloadChart;
//    ServiceMonitorNetworkModel  *_netWorkModel;
    
    
}

- (id)init
{
	CGRect barFrame;
	barFrame.origin.x = 0.0f;
	barFrame.origin.y = [UIScreen mainScreen].bounds.size.height - 16.0f;
	barFrame.size.width = [UIScreen mainScreen].bounds.size.width;
	barFrame.size.height = 16.0f;

	self = [super initWithFrame:barFrame];
	if ( self )
	{
		self.hidden = YES;
		self.backgroundColor = [UIColor clearColor]; // [UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:0.5f];
		self.windowLevel = UIWindowLevelStatusBar + 5.0f;
		self.rootViewController = [[UIViewController alloc] init];
		
		_cpuModel = [ServiceMonitorCPUModel sharedInstance];
		_fpsModel = [ServiceMonitorFPSModel sharedInstance];
        
        
//        _netWorkModel = [ServiceMonitorNetworkModel sharedInstance];
        
	}
	return self;
}

- (void)dealloc
{
	[_label removeFromSuperview];
	_label = nil;
	
	[_cpuChart removeFromSuperview];
	_cpuChart = nil;

	[_fpsChart removeFromSuperview];
	_fpsChart = nil;
}

- (void)setFrame:(CGRect)frame
{
	CGRect barFrame;
	barFrame.origin.x = 0.0f;
	barFrame.origin.y = [UIScreen mainScreen].bounds.size.height - 16.0f;
	barFrame.size.width = [UIScreen mainScreen].bounds.size.width;
	barFrame.size.height = 16.0f;

	[super setFrame:barFrame];
}


- (double)netSpeedWithBytesValue:(NSInteger)value
{
    return value/1024.0;
}

- (void)update
{
	if ( NO == self.hidden )
	{
		[_cpuChart reloadData];
		[_fpsChart reloadData];
//        [_netWorkUploadChart reloadData];
//        [_netWorkDownloadChart reloadData];
//		_label.text = [NSString stringWithFormat:@"CPU:%.2f%%   FPS:%lu  上传:%l.2lfkb/s 下载:%.2lfkb/s", _cpuModel.percent * 100.0f, (unsigned long)_fpsModel.fps,[self netSpeedWithBytesValue:[[_netWorkModel.uploadHistory lastObject] floatValue]],[self netSpeedWithBytesValue:[[_netWorkModel.downloadHistory lastObject] floatValue]]];
        
        _label.text = [NSString stringWithFormat:@"CPU:%.2f%%   FPS:%lu", _cpuModel.percent * 100.0f, (unsigned long)_fpsModel.fps];
	}
}

- (void)show
{
	if ( NO == _inited )
	{
		_cpuChart = [[JBLineChartView alloc] initWithFrame:CGRectInset(self.bounds, -5.0f, -1.0f)];
		_cpuChart.delegate = self;
		_cpuChart.dataSource = self;
		_cpuChart.alpha = 0.95f;
		[self addSubview:_cpuChart];

		_fpsChart = [[JBLineChartView alloc] initWithFrame:CGRectInset(self.bounds, -5.0f, -1.0f)];
		_fpsChart.delegate = self;
		_fpsChart.dataSource = self;
		_fpsChart.alpha = 0.95f;
		[self addSubview:_fpsChart];
        
//        _netWorkUploadChart = [[JBLineChartView alloc] initWithFrame:CGRectInset(self.bounds, -5.0f, -1.0f)];
//        _netWorkUploadChart.delegate = self;
//        _netWorkUploadChart.dataSource = self;
//        _netWorkUploadChart.alpha = 0.95f;
//        [self addSubview:_netWorkUploadChart];
//        
//        _netWorkDownloadChart = [[JBLineChartView alloc] initWithFrame:CGRectInset(self.bounds, -5.0f, -1.0f)];
//        _netWorkDownloadChart.delegate = self;
//        _netWorkDownloadChart.dataSource = self;
//        _netWorkDownloadChart.alpha = 0.95f;
//        [self addSubview:_netWorkDownloadChart];
        
        

		_label = [[UILabel alloc] initWithFrame:self.bounds];
		_label.backgroundColor = [UIColor clearColor];
		_label.font = [UIFont systemFontOfSize:12.0f];
		_label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
		_label.textAlignment = NSTextAlignmentCenter;
		_label.textColor = [UIColor blackColor];
		_label.backgroundColor = [UIColor clearColor];
		_label.lineBreakMode = NSLineBreakByClipping;
		_label.layer.shadowColor = [[UIColor whiteColor] CGColor];
		_label.layer.shadowOpacity = 1.0f;
		_label.layer.shadowRadius = 1.0f;
		_label.layer.shadowOffset = CGSizeMake(0.f, 0.0f);
		[self addSubview:_label];
		
		_inited = YES;
	}
	
	[self update];
	
	self.hidden = NO;
}

- (void)hide
{
	self.hidden = YES;
}

#pragma mark - JBLineChartViewDataSource

- (NSUInteger)numberOfLinesInLineChartView:(JBLineChartView *)lineChartView
{
	return 1;
}

- (NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex
{
	if ( _cpuChart == lineChartView )
	{
		return _cpuModel.history.count;
	}
	else if ( _fpsChart == lineChartView )
	{
		return _fpsModel.history.count;
	}
//    else if (_netWorkUploadChart == lineChartView)
//    {
//        return _netWorkModel.uploadHistory.count;
//    }
//    else if (_netWorkDownloadChart == lineChartView)
//    {
//        return _netWorkModel.downloadHistory.count;
//        
//    }
	return 0;
}

- (BOOL)lineChartView:(JBLineChartView *)lineChartView showsDotsForLineAtLineIndex:(NSUInteger)lineIndex
{
	return NO;
}

- (BOOL)lineChartView:(JBLineChartView *)lineChartView smoothLineAtLineIndex:(NSUInteger)lineIndex
{
	return YES;
}

#pragma mark - JBLineChartViewDelegate

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView verticalValueForHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
	if ( _cpuChart == lineChartView )
	{
		return [[_cpuModel.history objectAtIndex:horizontalIndex] floatValue];
	}
	else if ( _fpsChart == lineChartView )
	{
		return [[_fpsModel.history objectAtIndex:horizontalIndex] floatValue];
	}
//    else if (_netWorkUploadChart == lineChartView)
//    {
//        return [[_netWorkModel.uploadHistory objectAtIndex:horizontalIndex] floatValue];
//    }
//    else if (_netWorkDownloadChart == lineChartView)
//    {
//        return [[_netWorkModel.downloadHistory objectAtIndex:horizontalIndex]floatValue];
//        
//    }
	
	return 0;
}

- (void)lineChartView:(JBLineChartView *)lineChartView didSelectLineAtIndex:(NSUInteger)lineIndex horizontalIndex:(NSUInteger)horizontalIndex touchPoint:(CGPoint)touchPoint
{
}

- (void)didDeselectLineInLineChartView:(JBLineChartView *)lineChartView
{
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForLineAtLineIndex:(NSUInteger)lineIndex
{
	if ( _cpuChart == lineChartView )
	{
        return [UIColor colorWithRed:91/255.0 green:191/255.0 blue:81/255.0 alpha:1];
	}
	else if ( _fpsChart == lineChartView )
	{
        return [UIColor colorWithRed:255/255.0 green:0/255.0 blue:0/255.0 alpha:1];
	}
	
//    else if (_netWorkUploadChart == lineChartView)
//    {
//        return [UIColor colorWithRed:242/255.0 green:131/255.0 blue:56/255.0f alpha:1];
//    }
//    else if (_netWorkDownloadChart == lineChartView)
//    {
//        return [UIColor colorWithRed:161/255.0 green:61/255.0 blue:150/255.0 alpha:1];
//        
//    }
    
	return [UIColor grayColor];
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView fillColorForLineAtLineIndex:(NSUInteger)lineIndex
{
	return [[self lineChartView:lineChartView colorForLineAtLineIndex:lineIndex] colorWithAlphaComponent:0.2f];
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForDotAtHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
	return [UIColor whiteColor];
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView widthForLineAtLineIndex:(NSUInteger)lineIndex
{
	return 1.0f;
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView verticalSelectionColorForLineAtLineIndex:(NSUInteger)lineIndex
{
	return [UIColor whiteColor];
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView selectionColorForLineAtLineIndex:(NSUInteger)lineIndex
{
	return [UIColor whiteColor];
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView selectionFillColorForLineAtLineIndex:(NSUInteger)lineIndex
{
	return [[self lineChartView:lineChartView selectionColorForLineAtLineIndex:lineIndex] colorWithAlphaComponent:0.9f];
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView selectionColorForDotAtHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
	return [UIColor lightGrayColor];
}

- (JBLineChartViewLineStyle)lineChartView:(JBLineChartView *)lineChartView lineStyleForLineAtLineIndex:(NSUInteger)lineIndex
{
	return JBLineChartViewLineStyleSolid;
}

@end
