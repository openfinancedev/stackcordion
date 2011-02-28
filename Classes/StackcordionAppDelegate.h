//
//  StackcordionAppDelegate.h
//  Stackcordion
//
//  Created by Openfinance (CC BY-SA 3.0)
//

#import <UIKit/UIKit.h>

@class MenuScrollViewController;

@interface StackcordionAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MenuScrollViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MenuScrollViewController *viewController;

@end

