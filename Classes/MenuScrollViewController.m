//
//  MenuScrollViewController.m
//  ScrollLayers
//
//  Created by Openfinance (CC BY-SA 3.0)
//
// This file contains the main table view control.
// Furthemore it contains the implementation for the layers motion control.
// The user can see three layers at same time. If the user wants to hidde a layer, she can move 
// this layer to the right (only for second layers)

#import "MenuScrollViewController.h"
#import "TableViewController.h"
#import "DefaultMainViewController.h"

@implementation MenuScrollViewController

@synthesize defaultViewController, tableViewController;
@synthesize tableViewMainMenu, scrollViewSecond, scrollViewMainMenu, scrollViewThird, viewSecondScrollView, viewThirdScrollView, lastView;

enum DIRECTION
{
    RIGHT,
    LEFT,
	NONE
};

enum POSITION
{
    SHOW,
    SEMISHOW,
	HIDDEN
};


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	lastView = [NSMutableArray new];
	lastContentOffset = 0;
	
	// Init views
	defaultViewController = [[DefaultMainViewController alloc] initWithNibName:@"DefaultMainView" bundle:nil];
	tableViewController = [[TableViewController alloc] initWithNibName:@"TableView" bundle:nil];
	tableViewMainMenu.frame = CGRectMake(0, tableViewMainMenu.frame.origin.y, MAIN_MENU_WIDTH, VIEW_HEIGHT);
	
	// Init layers position
	scrollViewMainMenu.frame = CGRectMake(0, scrollViewMainMenu.frame.origin.y, scrollViewMainMenu.frame.size.width, VIEW_HEIGHT);
	scrollViewSecond.frame = CGRectMake(MAIN_MENU_WIDTH, scrollViewSecond.frame.origin.y, MAIN_MENU_DETAIL_WIDTH, VIEW_HEIGHT);
	viewSecondScrollView.frame = CGRectMake(0, viewSecondScrollView.frame.origin.y, MAIN_MENU_DETAIL_WIDTH, VIEW_HEIGHT);
	viewThirdScrollView.frame = CGRectMake(0, viewThirdScrollView.frame.origin.y, THIRD_SCROLL_VIEW_WIDTH, VIEW_HEIGHT);	

	// Init content Size for ScrollViews
	[scrollViewMainMenu setContentSize:CGSizeMake(MAIN_MENU_WIDTH, VIEW_HEIGHT)];
	[scrollViewSecond setContentSize:CGSizeMake(MAIN_MENU_DETAIL_WIDTH + SCROLL_VIEW_HORIZONTAL_SCROLL_ACTIVATE, VIEW_HEIGHT)];
	[scrollViewThird setContentSize:CGSizeMake(THIRD_SCROLL_VIEW_WIDTH + SCROLL_VIEW_HORIZONTAL_SCROLL_ACTIVATE, VIEW_HEIGHT)];
	
	// Add default layer
	[viewSecondScrollView addSubview:defaultViewController.view];
	tableViewMainMenu.tableHeaderView = nil;
	
	// Init layers visibility
	scrollViewSecond.hidden = NO;
	scrollViewThird.hidden = YES;
	layerThreePosition = HIDDEN;
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return NO;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc 
{
	[defaultViewController release];
	[tableViewController release];
	[tableViewMainMenu release];
	[scrollViewSecond release];
	[scrollViewMainMenu release];
	[scrollViewThird release];
	[viewSecondScrollView release];
	[viewThirdScrollView release];
	[lastView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Return the number of sections.
	return 1;
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	if (tableView == tableViewMainMenu) 
	{
		cell.textLabel.text = [[NSString alloc] initWithFormat:@"Row %d", indexPath.row];
	}
	
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	[viewSecondScrollView removeFromSuperview];
	
	if (indexPath.row % 2 != 0) 
	{	
		// Show new layer with table view
		[self showTableViewExample];
	}
	else 
	{
		// Show new layer with default view
		[self showOtherViewExample];
	}
}

// Show layer with tableView
- (void)showTableViewExample
{	
	// Init the view
	tableViewController.view.frame = CGRectMake(0, 0,  MAIN_MENU_DETAIL_WIDTH, VIEW_HEIGHT);
	tableViewController.view.hidden = NO;
	[tableViewController textSelectedscrollViewThird:scrollViewThird ScrollViewSecond:scrollViewSecond View:viewThirdScrollView];
	[scrollViewSecond addSubview:tableViewController.view];
	
	scrollViewSecond.hidden = NO;
	scrollViewSecond.frame = CGRectMake(VIEW_WIDTH, scrollViewSecond.frame.origin.y, MAIN_MENU_DETAIL_WIDTH, VIEW_HEIGHT);
	
	// Move first layer to new position
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:ANIMATION_DURATION];
	
	[self lastViewDissapearEffect]; // Effect for hidde the last view
	
	scrollViewSecond.frame = CGRectMake(MAIN_MENU_WIDTH, scrollViewSecond.frame.origin.y,  MAIN_MENU_DETAIL_WIDTH, VIEW_HEIGHT);
	[UIView commitAnimations];
	
	// Move the third layer out of screen
	scrollViewThird.frame = CGRectMake(POSITION_OUT_SCREEN, scrollViewThird.frame.origin.y, THIRD_SCROLL_VIEW_WIDTH, VIEW_HEIGHT);
}

// Show layer with default view
- (void)showOtherViewExample
{
	// Init the view
	defaultViewController = [[DefaultMainViewController alloc] initWithNibName:@"DefaultMainView" bundle:nil];
	defaultViewController.view.frame = CGRectMake(VIEW_WIDTH, defaultViewController.view.frame.origin.y, MAIN_MENU_DETAIL_WIDTH, SUBVIEW_HEIGHT);
	
	// Move first layer to new position
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:ANIMATION_DURATION];
	defaultViewController.view.frame = CGRectMake(MAIN_MENU_WIDTH, defaultViewController.view.frame.origin.y,  MAIN_MENU_DETAIL_WIDTH, SUBVIEW_HEIGHT);
	
	[self lastViewDissapearEffect]; // Effect for hidde the last view
	
	[self.view addSubview:defaultViewController.view];
	[lastView addObject:defaultViewController.view];
	[UIView commitAnimations];
}

#pragma mark -
#pragma mark Scroll view delegate

// Move layers when the user interact with a layer
- (void)scrollViewDidScroll:(UIScrollView *)theScrollView
{
	[self scrollDirectionDetect:theScrollView];

	if (theScrollView == scrollViewSecond) 
	{
		if (layerThreePosition != HIDDEN) 
		{
			[self movePosition:1 ScrollView:scrollViewThird];
		}
	}
	else if (theScrollView == scrollViewThird) 
	{
		if (layerThreePosition == SEMISHOW) 
		{
			if (scrollDirection == RIGHT) 
			{
				scrollViewSecond.frame = CGRectMake(scrollViewSecond.frame.origin.x + scrollIncrement, scrollViewSecond.frame.origin.y, scrollViewSecond.frame.size.width, scrollViewSecond.frame.size.height);
			}
			else
			{
				scrollViewSecond.frame = CGRectMake(scrollViewSecond.frame.origin.x - scrollIncrement, scrollViewSecond.frame.origin.y, scrollViewSecond.frame.size.width, scrollViewSecond.frame.size.height);
			}
		}
	}
}

// Put layer in final position
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView2 willDecelerate:(BOOL)decelerate
{
	if (scrollView2 == scrollViewSecond || scrollView2 == scrollViewThird)
	{
		if (scrollView2 == scrollViewSecond)
		{
			if (scrollDirection == RIGHT)
			{
				[self hiddeThirdLayer];
			}
		}
		else if (scrollView2 == scrollViewThird)
		{
			if (scrollDirection == LEFT) 
			{
				layerThreePosition = SHOW;
				[self showLayersPositionScrollViewX:POSITION_SHOW_THIRD_SCROLL_VIEW ScrollContentOffSetX:0 SecondScrollView:scrollView2 AnimationDuration:ANIMATION_DURATION];
			}
			else if (scrollDirection == RIGHT) 
			{
				if (layerThreePosition == SEMISHOW) 
				{
					[self hiddeThirdLayer];
				}
				else 
				{
					scrollIncrement = 0;
					layerThreePosition = SEMISHOW;
					[scrollViewThird setContentSize:CGSizeMake(THIRD_SCROLL_VIEW_WIDTH + SCROLL_VIEW_HORIZONTAL_SCROLL_ACTIVATE, VIEW_HEIGHT)];
					[self showLayersPositionScrollViewX:POSITION_SEMISHOW_THIRD_SCROLL_VIEW ScrollContentOffSetX:0 SecondScrollView:scrollView2 AnimationDuration:ANIMATION_DURATION];
				}
			}
		}
	}
}

// Put third layer out of screen
- (void)hiddeThirdLayer
{
	layerThreePosition = HIDDEN;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:ANIMATION_DURATION];
	scrollViewSecond.frame = CGRectMake(MAIN_MENU_WIDTH, scrollViewSecond.frame.origin.y, MAIN_MENU_DETAIL_WIDTH, VIEW_HEIGHT);
	scrollViewThird.frame = CGRectMake(POSITION_OUT_SCREEN, scrollViewThird.frame.origin.y, THIRD_SCROLL_VIEW_WIDTH, VIEW_HEIGHT);
	[UIView commitAnimations];
}


// Put layer in her position
- (void)showLayersPositionScrollViewX:(float)scrollViewX ScrollContentOffSetX:(float)contentOffSetX SecondScrollView:(UIScrollView *)scrollView2 AnimationDuration:(float)animationDuration
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:animationDuration];
	scrollViewThird.frame = CGRectMake(scrollViewX, scrollViewThird.frame.origin.y, THIRD_SCROLL_VIEW_WIDTH, VIEW_HEIGHT);
	viewThirdScrollView.frame = CGRectMake(0, viewThirdScrollView.frame.origin.y, THIRD_SCROLL_VIEW_WIDTH, viewThirdScrollView.frame.size.height);
	scrollViewSecond.frame = CGRectMake(POSITION_SEMISHOW_SECOND_SCROLL_VIEW, scrollViewSecond.frame.origin.y,  MAIN_MENU_DETAIL_WIDTH, VIEW_HEIGHT);
	[scrollView2 setContentOffset:CGPointMake(contentOffSetX, 0)];
	[UIView commitAnimations];
}

// Return direction scroll
- (int)scrollDirectionDetect:(UIScrollView *)theScrollView
{	
	if (lastContentOffset > theScrollView.contentOffset.x)
	{
		scrollDirection = RIGHT;
	}
	else if (lastContentOffset < theScrollView.contentOffset.x) 
	{
		scrollDirection = LEFT;
	}
	else 
	{
		scrollDirection = NONE;
	}
	
	lastContentOffset = theScrollView.contentOffset.x;
	
	return scrollDirection;
}

#pragma mark -
#pragma mark Scroll view Auxiliar methods

// Effect for change layer in same level
- (void)lastViewDissapearEffect
{
	if ([lastView count] > 0) 
	{
		UIView *lastViewAdded = ((UIView *)[lastView objectAtIndex:0]);
		lastViewAdded.frame = CGRectMake(POSITION_OUT_SCREEN, 0, lastViewAdded.frame.size.width, lastViewAdded.frame.size.height);
		[lastView removeAllObjects];
	}
	scrollViewSecond.frame = CGRectMake(POSITION_OUT_SCREEN, scrollViewSecond.frame.origin.y, MAIN_MENU_DETAIL_WIDTH, VIEW_HEIGHT);
	scrollViewThird.frame = CGRectMake(POSITION_OUT_SCREEN, scrollViewThird.frame.origin.y, MAIN_MENU_DETAIL_WIDTH, VIEW_HEIGHT);
}

// Change the position scrollView layer
- (void)movePosition:(int)increment ScrollView:(UIScrollView *)scrollView
{
	if (scrollDirection == RIGHT) 
	{
		scrollView.frame = CGRectMake(scrollView.frame.origin.x + increment, scrollView.frame.origin.y, scrollView.frame.size.width, scrollView.frame.size.height);
	}
	else if (scrollDirection == LEFT) 
	{
		scrollView.frame = CGRectMake(scrollView.frame.origin.x - increment, scrollView.frame.origin.y, scrollView.frame.size.width, scrollView.frame.size.height);
	}
}


@end
