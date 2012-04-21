//
//  CrunchTimeAppDelegate.m
//  CrunchTime
//
//  Created by Faranak Sorooshian on 3/10/10.
//  Copyright CrunchTime Team 2010. All rights reserved.
//

#import "CalculatorView.h"

#import "CrunchTimeAppDelegate.h"


@implementation CrunchTimeAppDelegate

@synthesize window;

// Synthesize the accessor methods for the view controller
@synthesize calculatorView;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
    // Create an instance of CalculatorView
	CalculatorView *aViewController = [[CalculatorView alloc]
									   initWithNibName:@"CalculatorView" bundle:[NSBundle mainBundle]];
	[self setCalculatorView:aViewController];
	[aViewController release];
	
	//Add the subview for the window
	UIView *controllersView = [calculatorView view];
	[window addSubview:controllersView];
	
	// Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
	
	// Release the view controller
	[calculatorView release];
    
	[window release];
    [super dealloc];
	
}


@end
