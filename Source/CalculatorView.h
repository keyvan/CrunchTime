//
//  CalculatorView.h
//  CrunchTime
//
//  Created by Faranak  Sorooshian on 3/19/10.
//  Copyright 2010 CrunchTime Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class InputProcessor;

@interface CalculatorView : UIViewController <UITextFieldDelegate> {
	
	InputProcessor *ip;
	
	// UITextField instance variable
	UITextField *textField;
	
	// UIButton instance variables
	UIButton *button0;
	UIButton *button1;
	UIButton *button2;
	UIButton *button3;
	UIButton *button4;
	UIButton *button5;
	UIButton *button6;
	UIButton *button7;
	UIButton *button8;
	UIButton *button9;
	UIButton *buttonAdd;
	UIButton *buttonSub;
	UIButton *buttonMul;
	UIButton *buttonDiv;
	UIButton *buttonSin;
	UIButton *buttonCos;
	UIButton *buttonTan;
	UIButton *buttonLog;
	UIButton *buttonLn;
	UIButton *buttonPow;
	UIButton *buttonSqrt;
	UIButton *buttonPnt;
	UIButton *buttonNeg;
	UIButton *buttonEnt;
	UIButton *buttonDel;
	UIButton *buttonClr;
	
	UIButton *buttonSci;
	UIButton *buttonM;
	UIButton *buttonMR;
	
	
	// NSString instance variable
	NSString *string;
	NSArray *contentArray;
	
	// UITableView instance
	UITableView *mytableView;
	
}

// Add property declarations
@property (nonatomic, retain) InputProcessor *ip;
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) IBOutlet UITableView *mytableView;

@property (nonatomic, retain) IBOutlet UIButton *button0;
@property (nonatomic, retain) IBOutlet UIButton *button1;
@property (nonatomic, retain) IBOutlet UIButton *button2;
@property (nonatomic, retain) IBOutlet UIButton *button3;
@property (nonatomic, retain) IBOutlet UIButton *button4;
@property (nonatomic, retain) IBOutlet UIButton *button5;
@property (nonatomic, retain) IBOutlet UIButton *button6;
@property (nonatomic, retain) IBOutlet UIButton *button7;
@property (nonatomic, retain) IBOutlet UIButton *button8;
@property (nonatomic, retain) IBOutlet UIButton *button9;
@property (nonatomic, retain) IBOutlet UIButton *buttonAdd;
@property (nonatomic, retain) IBOutlet UIButton *buttonSub;
@property (nonatomic, retain) IBOutlet UIButton *buttonMul;
@property (nonatomic, retain) IBOutlet UIButton *buttonDiv;
@property (nonatomic, retain) IBOutlet UIButton *buttonSin;
@property (nonatomic, retain) IBOutlet UIButton *buttonCos;
@property (nonatomic, retain) IBOutlet UIButton *buttonTan;
@property (nonatomic, retain) IBOutlet UIButton *buttonLog;
@property (nonatomic, retain) IBOutlet UIButton *buttonLn;
@property (nonatomic, retain) IBOutlet UIButton *buttonPow;
@property (nonatomic, retain) IBOutlet UIButton *buttonSqrt;
@property (nonatomic, retain) IBOutlet UIButton *buttonPnt;
@property (nonatomic, retain) IBOutlet UIButton *buttonNeg;
@property (nonatomic, retain) IBOutlet UIButton *buttonEnt;
@property (nonatomic, retain) IBOutlet UIButton *buttonDel;
@property (nonatomic, retain) IBOutlet UIButton *buttonClr;

@property (nonatomic, retain) IBOutlet UIButton *buttonSci;
@property (nonatomic, retain) IBOutlet UIButton *buttonM;
@property (nonatomic, retain) IBOutlet UIButton *buttonMR;

@property (nonatomic, copy) NSString *string;
@property (nonatomic, retain) NSArray *contentArray;

// Declare the GetInput method
- (IBAction)GetInput:(id)sender;

// Declare the PutIntoStack method
- (void)PutIntoStack:(NSArray *)thevalue;

// Declare the SetUpInputProcessor method
- (void)SetUpInputProcessor;

@end
