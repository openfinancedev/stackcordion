//
//  DefaultMainViewController.m
//  ScrollLayers
//
//  Created by Openfinance (CC BY-SA 3.0)
//
// This file contains a default view controller

#import "DefaultMainViewController.h"
#import "ImagesHelper.h"


@implementation DefaultMainViewController

@synthesize scrollView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	[scrollView setContentSize:CGSizeMake(MAIN_MENU_DETAIL_WIDTH, VIEW_DEFAULT_TABLE_VIEW_HEIGHT)];

	// Add gradient image in border of layer
	[ImagesHelper insertGradientImageInLayer:scrollView];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return NO;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload 
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc 
{
    [super dealloc];
}


@end
