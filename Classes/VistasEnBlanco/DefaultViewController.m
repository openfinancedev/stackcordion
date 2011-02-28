//
//  DefaultViewController.m
//  ScrollLayers
//
//  Created by Openfinance (CC BY-SA 3.0)
//
// This file contains a default view controller


#import "DefaultViewController.h"
#import "ImagesHelper.h"


@implementation DefaultViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	// Add gradient image in border of layer
	[ImagesHelper insertGradientImageInLayer:self.view];
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


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
