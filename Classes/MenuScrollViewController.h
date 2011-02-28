//
//  MenuScrollViewController.h
//  ScrollLayers
//
//  Created by Openfinance (CC BY-SA 3.0)
//
// This file contains the main table view control.
// Furthemore it contains the implementation for the layers motion control.
// The user can see three layers at same time. If the user wants to hidde a layer, she can move 
// this layer to the right (only for second layers)

#import <UIKit/UIKit.h>

#define VIEW_HEIGHT 1004
#define SUBVIEW_HEIGHT 1024
#define MAIN_MENU_WIDTH 320
#define MAIN_MENU_DETAIL_WIDTH 448
#define THIRD_SCROLL_VIEW_WIDTH 580
#define POSITION_SEMISHOW_THIRD_SCROLL_VIEW 545
#define POSITION_SEMISHOW_SECOND_SCROLL_VIEW 100
#define POSITION_SHOW_THIRD_SCROLL_VIEW 200
#define POSITION_OUT_SCREEN 850
#define VIEW_WIDTH 768

#define SCROLL_VIEW_HORIZONTAL_SCROLL_ACTIVATE 1

#define ANIMATION_DURATION 0.7

@class DefaultMainViewController;
@class TableViewController;

@interface MenuScrollViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{		
	TableViewController *tableViewController;
	DefaultMainViewController *defaultViewController;
	
	UITableView *tableViewMainMenu;
	UIScrollView *scrollViewMainMenu;
	UIScrollView *scrollViewSecond;
	UIScrollView *scrollViewThird;
	
	UIView *viewSecondScrollView;
	UIView *viewThirdScrollView;
	
	int	scrollDirection;
	int scrollIncrement;
	
	int layerThreePosition;
	float lastContentOffset;
	BOOL isNavigation;
	
	NSMutableArray *lastView;
}

@property (nonatomic, retain) TableViewController *tableViewController;
@property (nonatomic, retain) DefaultMainViewController *defaultViewController;
@property (nonatomic, retain) IBOutlet UITableView *tableViewMainMenu;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollViewMainMenu;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollViewSecond;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollViewThird;
@property (nonatomic, retain) IBOutlet UIView *viewSecondScrollView;
@property (nonatomic, retain) IBOutlet UIView *viewThirdScrollView;
@property (nonatomic, retain) NSMutableArray *lastView;

- (void)showTableViewExample;
- (void)showOtherViewExample;
- (void)hiddeThirdLayer;
- (void)showLayersPositionScrollViewX:(float)scrollViewX ScrollContentOffSetX:(float)contentOffSetX SecondScrollView:(UIScrollView *)scrollView2 AnimationDuration:(float)animationDuration;
- (int)scrollDirectionDetect:(UIScrollView *)theScrollView;
- (void)lastViewDissapearEffect;
- (void)movePosition:(int)increment ScrollView:(UIScrollView *)scrollView;

@end

