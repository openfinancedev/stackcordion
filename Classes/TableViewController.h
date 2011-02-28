//
//  TableViewController.h
//  ScrollLayers
//
//  Created by Openfinance (CC BY-SA 3.0)
//
// This file contains the implementation for the detail table which controls when the third layer must appear.

#import <UIKit/UIKit.h>
#import "DefaultViewController.h"

#define VIEW_DEFAULT_TABLE_VIEW_HEIGHT 1004
#define MAIN_MENU_DETAIL_WIDTH 448
#define MAIN_MENU_DETAIL_WIDTH_SCROLL 454
#define POSITION_SEMISHOW_SECOND_SCROLL_VIEW 100
#define POSITION_SEMISHOW_THIRD_SCROLL_VIEW 545
#define POSITION_SHOW_THIRD_SCROLL_VIEW 200
#define THIRD_SCROLL_VIEW_WIDTH 580
#define POSITION_OUT_SCREEN 850

#define ANIMATION_DURATION 0.7

@interface TableViewController : UIViewController 
{
	DefaultViewController *defaultViewController;
	NSMutableArray *lastView;
	
	UITableView *tableViewSecondMenu;
	UIScrollView *scrollView;
	
	
	UIScrollView *scrollViewThird;
	UIScrollView *scrollViewSecond;
	UIView *thirdView;
}

@property (nonatomic, retain) DefaultViewController *defaultViewController;
@property (nonatomic, retain) IBOutlet UITableView *tableViewSecondMenu;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) UIScrollView *scrollViewThird;
@property (nonatomic, retain) UIScrollView *scrollViewSecond;
@property (nonatomic, retain) UIView *thirdView;
@property (nonatomic, retain) NSMutableArray *lastView;

- (id)textSelectedscrollViewThird:(UIScrollView *)scrollViewF ScrollViewSecond:(UIScrollView *)secondScrollView View:(UIView *)theView;

@end
