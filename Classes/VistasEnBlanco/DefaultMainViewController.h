//
//  DefaultMainViewController.h
//  ScrollLayers
//
//  Created by Openfinance (CC BY-SA 3.0)
//
// This file contains a default view controller

#import <UIKit/UIKit.h>

#define VIEW_DEFAULT_TABLE_VIEW_HEIGHT 1004
#define MAIN_MENU_DETAIL_WIDTH 454

@interface DefaultMainViewController : UIViewController 
{
	UIScrollView *scrollView;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@end
