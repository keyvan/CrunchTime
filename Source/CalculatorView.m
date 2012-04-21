//
//  CalculatorView.m
//  CrunchTime
//
//  Created by Faranak  Sorooshian on 3/19/10.
//  Copyright 2010 CrunchTime Team. All rights reserved.
//

#import "CalculatorView.h"
#import "InputProcessor.h"
#import "CrunchTimeUserException.h"
#import "CrunchTimeInnerException.h"
#import "Constants.h"


@implementation CalculatorView

//synthesize the accessor methods

@synthesize ip;
@synthesize textField;
@synthesize mytableView;

//@synthesize UserAlert;

@synthesize button0;
@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;
@synthesize button5;
@synthesize button6;
@synthesize button7;
@synthesize button8;
@synthesize button9;
@synthesize buttonAdd;
@synthesize buttonSub;
@synthesize buttonMul;
@synthesize buttonDiv;
@synthesize buttonSin;
@synthesize buttonCos;
@synthesize buttonTan;
@synthesize buttonLog;
@synthesize buttonLn;
@synthesize buttonPow;
@synthesize buttonSqrt;

@synthesize buttonPnt;
@synthesize buttonNeg;
@synthesize buttonEnt;
@synthesize buttonDel;
@synthesize buttonClr;

@synthesize buttonSci;
@synthesize buttonM;
@synthesize buttonMR;

@synthesize string;
@synthesize contentArray;

// create teh InputProcessor instance
-(id) initWithNibName:(NSString *)n bundle:(NSBundle *)b {
	[self SetUpInputProcessor];
	return self;
}

// get the count of values in the contentArray
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [contentArray count];
}

// populate a cell in the UITableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identity = @"MainCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
	// if the cell has not been allocated, allocate it
	if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:identity] autorelease];
    }
	// put the value (from contentArray) into the cell and right align it.
    cell.textLabel.text = [contentArray objectAtIndex:indexPath.row];
	cell.textLabel.textAlignment = UITextAlignmentRight;
	
    return cell;
}

// Set up the InputProcessor class by allocating it
- (void)SetUpInputProcessor {
    InputProcessor *tip = [[InputProcessor alloc] init];
	self.ip = tip;
	[tip release];
}

// Implement the GetInput method 
- (IBAction)GetInput:(id)sender {
	int flag = 0;
	
	NSString* localString = [[NSString alloc]init];
	NSString* textString = [[NSString alloc]init];
	NSArray* stackString = [[NSString alloc]init];
	
	// Read the input key and put it in the localString
	if (sender == button0) {
		localString = @ZERO;
	}
	
	if (sender == button1) {
		localString = @ONE;
	}	
	
	if (sender == button2) {
		localString = @TWO;
	}
	
	if (sender == button3) {
		localString = @THREE;
	}		
	
	if (sender == button4) {
		localString = @FOUR;
	}
	
	if (sender == button5) {
		localString = @FIVE;
	}	
	
	if (sender == button6) {
		localString = @SIX;
	}
	
	if (sender == button7) {
		localString = @SEVEN;
	}		
	
	if (sender == button8) {
		localString = @EIGHT;
	}
	
	if (sender == button9) {
		localString = @NINE;
	}	
	
	if (sender == buttonAdd) {
		localString = @PLUS;
	}
	
	if (sender == buttonSub) {
		localString = @MINUS;
	}		
	
	if (sender == buttonMul) {
		localString = @MULTIPLY;
	}
	
	if (sender == buttonDiv) {
		localString = @DIVIDE;
	}
	
	if (sender == buttonSin) {
		localString = @SIN;
	}
	
	if (sender == buttonCos) {
		localString = @COS;
	}
	
	if (sender == buttonTan) {
		localString = @TAN;
	}
	
	if (sender == buttonLog) {
		localString = @LOG;
	}
	
	if (sender == buttonLn) {
		localString = @LN;
	}
	
	if (sender == buttonPow) {
		localString = @POWER;
	}
	
	if (sender == buttonSqrt) {
		localString = @SQRT;
	}
	
	if (sender == buttonPnt) {
		localString = @POINT;
	}
	
	if (sender == buttonNeg) {
		localString = @NEG;
	}	
	
	if (sender == buttonEnt) {
		localString = @ENT;
	}	
	
	if (sender == buttonDel) {
		localString = @DEL;
	}
	
	if (sender == buttonClr) {
		localString = @CLR;
	}
	
	if (sender == buttonSci) {
		localString = @SCI;
	}
	
	if (sender == buttonM) {
		localString = @M;
	}
	
	if (sender == buttonMR) {
		localString = @MR;
	}
	
	if ([sender isKindOfClass: [NSString class]]) {
		if ([(NSString*)sender isEqualToString: @SHAKE]) {
			localString = @SHAKE;
		}
	}
			
	
	@try {
		
		// Call the ProcessKey method from the InputProcessor class
		textString=[ip ProcessKey: localString: textField.text];
		
	}
	
	// Invalid Command Exception Alert
	@catch (CrunchTimeUserException* e) {
		UIAlertView *userAlert = [[UIAlertView alloc]
								  initWithTitle:@"Invalid Command"
								  message: [e reason]
								  delegate:nil
								  cancelButtonTitle:@"Hide"
								  otherButtonTitles:nil];
		
		[userAlert show];
		[userAlert autorelease];
	}
	
	// Internal Error Exception Alert
	@catch (CrunchTimeInnerException* e) {
		UIAlertView *userAlert = [[UIAlertView alloc]
								  initWithTitle:@"Internal Error"
								  message: [e reason]
								  delegate:nil
								  cancelButtonTitle:@"Hide"
								  otherButtonTitles:nil];
		
		[userAlert show];
		[userAlert autorelease];
	}
	
	@finally {
		
	}
	
	// Check if the CLR key should be applied on the textFiled or on the stack 
	if ([localString isEqualToString:@CLR] && [textField.text isEqualToString:@""]) {
		flag = 1;
	}
	
	// Check if the pressed key should be showed on the textFiled or not
	if (localString!=@ENT && localString!=@PLUS && localString!=@MINUS && 
		localString!=@MULTIPLY && localString!=@DIVIDE && localString!=@SCI && 
		localString!=@SIN && localString!=@COS && localString!=@TAN && 
		localString!=@LOG && localString!=@LN && localString!=@POWER && 
		localString!=@SQRT && localString!=@SHAKE && flag!=1) {
		textField.text = textString;
	}
	else {
		stackString=[ip getStack];
		if ([localString isEqualToString:@SCI] || [localString isEqualToString:@SHAKE])
			textField.text = textString;
		else
			textField.text = @"";
		
		// Call PutIntoStack method to put the value into the stack
		[self PutIntoStack:stackString];
		
	}
}

// This is the method to put the value into the stack
- (void)PutIntoStack:(NSArray *)thevalue {
	int i;

	// loop through the passed in array and put the values into the contentArray (local copy of stack)
	if ([thevalue count] < 4) {
		NSMutableArray* newArray = [[NSMutableArray alloc] initWithCapacity: 4];
		i = 0;
		while(i++ < 4 - [thevalue count])
			[newArray addObject: [NSString stringWithFormat: @"%s", ""]];
		[newArray addObjectsFromArray: thevalue];
		contentArray = newArray;		
	}
	else {
		contentArray = thevalue;
	}
	
	// redisplay the UITableView with the latest values
	[mytableView reloadData];
	
	// scroll to the bottom of the list
	int lastRowNumber = [mytableView numberOfRowsInSection:0] - 1;
	NSIndexPath* mip = [NSIndexPath indexPathForRow:lastRowNumber inSection:0];
	[mytableView scrollToRowAtIndexPath:mip atScrollPosition:UITableViewScrollPositionBottom animated:YES];
	
}

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	 return YES;
 }
*/ 

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	// Release the instance variables
	[textField release];
	
	[button0 release];
	[button1 release];
	[button2 release];
	[button3 release];
	[button4 release];
	[button5 release];
	[button6 release];
	[button7 release];
	[button8 release];
	[button9 release];
	[buttonAdd release];
	[buttonSub release];
	[buttonMul release];
	[buttonDiv release];
	[buttonSin release];
	[buttonCos release];
	[buttonTan release];
	[buttonLog release];
	[buttonLn release];
	[buttonPow release];
	[buttonSqrt release];
	[buttonPnt release];
	[buttonNeg release];
	[buttonEnt release];
	[buttonDel release];
	[buttonClr release];
	
	[buttonSci release];
	[buttonM release];
	[buttonMR release];
	
	[string release];
	
    [super dealloc];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {

}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	if (motion == UIEventSubtypeMotionShake) {
		[self GetInput:@SHAKE];
	}
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    // re-show the stack here -- this is a best practice in case the gesture was recoginized incorrectly or it was cancelled
}

@end
