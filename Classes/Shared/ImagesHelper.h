//
//  ImagesHelper.h
//  ScrollLayers
//
//  Created by Openfinance (CC BY-SA 3.0)
//
// This file contains auxiliar methods to put the gradient image in the layers

#import <Foundation/Foundation.h>

#define IMAGE_GRADIENT_NAME @"gradient.png"
#define IMAGE_GRADIENT_WIDTH 42

@interface ImagesHelper : NSObject 
{
}

+ (void)insertGradientImageInLayer:(id)scrollView;

@end
