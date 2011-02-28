//
//  ImagesHelper.m
//  ScrollLayers
//
//  Created by Openfinance (CC BY-SA 3.0)
//
// This file contains auxiliar methods to put the gradient image in the layers

#import "ImagesHelper.h"

@implementation ImagesHelper

// Put the gradient image in the border layer
+ (void)insertGradientImageInLayer:(id)scrollView
{
	UIImageView *imageGradient = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMAGE_GRADIENT_NAME]];
	imageGradient.frame = CGRectMake(-IMAGE_GRADIENT_WIDTH, imageGradient.frame.origin.y, imageGradient.frame.size.width, imageGradient.frame.size.height);
	[scrollView addSubview:imageGradient];
}

@end
