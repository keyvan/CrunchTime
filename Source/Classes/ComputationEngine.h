//
//  ComputationEngine.h
//  The main calculation engine
//
//  Created by Keyvan Nayyeri on 3/15/10.
//  Copyright CrunchTime Team 2010. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackManager.h"

@interface ComputationEngine : NSObject 
{
	StackManager *mgr;	
}

// Initialize the stack
-(id) init;
// Calculate the result of an operation by getting the operands from the stack
-(double) calculate: (NSString*) operator;
// Push an operand to the stack
-(void) pushOperand: (double) v;
// Pop an operand from the stack
-(double) popOperand;
// Get a pointer for the stack
-(NSArray*) getStack;
// Get the current size of the stack
-(int) getSize;
// Check to see if stack is empty
-(BOOL) isEmpty;
// Check to see if stack is full
-(BOOL) isFull;
// Clear the stack
-(void) clear;
// Peek the cursor to a value on stack
-(double) peek;

/* Calculation Methods */
// Addition
-(double) add;
// Subtraction
-(double) subtract;
// Multiplication
-(double) multiply;
// Division
-(double) divide;
// Power
-(double) power;
// Square Root
-(double) sqrt;
// Logarithm (Base 10)
-(double) log;
// Logarithm (Base e)
-(double) ln;
// Sin
-(double) sin;
// Cos
-(double) cos;
// Tan
-(double) tan;
@end
