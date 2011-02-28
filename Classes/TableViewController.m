//
//  TableViewController.m
//  ScrollLayers
//
//  Created by Openfinance (CC BY-SA 3.0)
//
// This file contains the implementation for the detail table which controls when the third layer must appear.

#import "TableViewController.h"
#import "DefaultViewController.h"
#import "ImagesHelper.h"

@implementation TableViewController

@synthesize tableViewSecondMenu, defaultViewController;
@synthesize scrollView, scrollViewThird, scrollViewSecond, thirdView, lastView;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad 
{
    [super viewDidLoad];
	// Init default View
	[scrollView setContentSize:CGSizeMake(MAIN_MENU_DETAIL_WIDTH_SCROLL, VIEW_DEFAULT_TABLE_VIEW_HEIGHT)];
	defaultViewController = [[DefaultViewController alloc] initWithNibName:@"DefaultView" bundle:nil];
	
	// Add gradient image in border of layer
	[ImagesHelper insertGradientImageInLayer:scrollView];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"Subrow %d", indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{	
	// Second view move to new position
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:ANIMATION_DURATION];
	scrollViewThird.frame = CGRectMake(POSITION_OUT_SCREEN, scrollViewThird.frame.origin.y, THIRD_SCROLL_VIEW_WIDTH, VIEW_DEFAULT_TABLE_VIEW_HEIGHT);
	scrollViewThird.hidden = NO;
	scrollViewSecond.frame = CGRectMake(POSITION_SEMISHOW_SECOND_SCROLL_VIEW, scrollViewSecond.frame.origin.y, MAIN_MENU_DETAIL_WIDTH, VIEW_DEFAULT_TABLE_VIEW_HEIGHT);
	[UIView commitAnimations];
	
	// Third view move to new position
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:ANIMATION_DURATION];
	scrollViewThird.frame = CGRectMake(POSITION_SHOW_THIRD_SCROLL_VIEW, scrollViewThird.frame.origin.y, THIRD_SCROLL_VIEW_WIDTH, VIEW_DEFAULT_TABLE_VIEW_HEIGHT);
	[thirdView addSubview:defaultViewController.view];

	[UIView commitAnimations];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc 
{
	[tableViewSecondMenu release];
	[defaultViewController release];
	[scrollView release];
	[scrollViewThird release];
	[scrollViewSecond release];
	[thirdView release];
	[lastView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Arguments

- (id)textSelectedscrollViewThird:(UIScrollView *)scrollViewF ScrollViewSecond:(UIScrollView *)secondScrollView View:(UIView *)theView
{
	self.scrollViewThird = scrollViewF;
	self.scrollViewSecond = secondScrollView;
	self.thirdView = theView;
	
	return self;
}

@end

