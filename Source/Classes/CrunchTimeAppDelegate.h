//
//  CrunchTimeAppDelegate.h
//  CrunchTime
//
//  Created by Faranak Sorooshian on 3/10/10.
//  Copyright CrunchTime Team 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalculatorView;

@interface CrunchTimeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	
	// Add the instance variable for CalculatorView Class
	CalculatorView *calculatorView;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

// Add the declaration for this property
@property (nonatomic, retain) CalculatorView *calculatorView;

@end

