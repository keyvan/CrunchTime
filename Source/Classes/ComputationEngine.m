//
//  ComputationEngine.m
//  The main calculation engine
//
//  Created by Keyvan Nayyeri on 3/15/10.
//  Copyright CrunchTime Team 2010. All rights reserved.
//

#import "ComputationEngine.h"
#import "InsufficientNumberOfOperandsException.h"
#import "DivideByZeroException.h"
#import "NegativeOperandForLogException.h"
#import "NegativeOperandForRadicalException.h"
#import "Constants.h"

@implementation ComputationEngine

// Initialize the stack
-(id) init
{
	mgr = [[StackManager alloc] init];
	return self;
}

// Calculate the result of an operation by getting the operands from the stack
-(double) calculate: (NSString*) operator
{	
	// Addition
	if ([operator isEqualToString: @PLUS])
	{
		[self add];	
	}
	
	// Subtraction
	if ([operator isEqualToString: @MINUS])
	{
		[self subtract];	
	}
	
	// Multiplication
	if ([operator isEqualToString: @MULTIPLY])
	{
		[self multiply];	
	}
	
	// Division
	if ([operator isEqualToString: @DIVIDE])
	{	
		[self divide];
	}
	
	// Power
	if ([operator isEqualToString: @POWER])
	{
		[self power];
	}
	
	// Square Root
	if ([operator isEqualToString: @SQRT])
	{
		[self sqrt];
	}
	
	// Logarithm (base 10)
	if ([operator isEqualToString: @LOG])
	{
		[self log];	
	}
	
	// Lograithm (base 2)
	if ([operator isEqualToString: @LN])
	{
		[self ln];
	}
	
	// Sin
	if ([operator isEqualToString: @SIN])
	{
		[self sin];
	}
	
	// Cos
	if ([operator isEqualToString: @COS])
	{
		[self cos];		
	}
	
	// Tan
	if ([operator isEqualToString: @TAN])
	{
		[self tan];	
	}	

	return 0.0;
}

// Push an operand to the stack
-(void) pushOperand: (double) v
{
	[mgr pushOperand: v];
}

// Pop an operand from the stack
-(double) popOperand
{
	return [mgr popOperand];
}

// Get a pointer for the stack
-(NSArray*) getStack
{
	return [mgr getStack];
}

// Get the current size of the stack
-(int) getSize
{
	return [mgr getSize];
}

// Check to see if stack is empty
-(BOOL) isEmpty
{
	return [mgr isEmpty];
}

// Check to see if stack is full
-(BOOL) isFull
{
	return [mgr isFull];
}

// Clear the stack
-(void) clear
{
	[mgr clear];
}

// Peek the cursor to a value on stack
-(double) peek
{
	return [mgr peek];
}

// Addition
-(double) add
{
	double result = 0;
	
	// Exception thrown for insufficient number of operands (< 2)
	if ([mgr getSize] < 2)
	{
		NSException *e = [[InsufficientNumberOfOperandsException alloc] initWithReason: @"Invalid number of operands on stack for addition."];
		[e raise];	
	}
	
	double a = [mgr popOperand];
	double b = [mgr popOperand];
	
	result = a + b;
	
	[mgr pushOperand:result];
	
	return result;	
}

// Subtraction
-(double) subtract
{
	double result = 0;
	
	// Exception thrown for insufficient number of operands (< 2)
	if ([mgr getSize] < 2)
	{
		NSException *e = [[InsufficientNumberOfOperandsException alloc] initWithReason: @"Invalid number of operands on stack for subtraction."];
		[e raise];	
	}
	
	double a = [mgr popOperand];
	double b = [mgr popOperand];
	
	result = b - a;
	
	[mgr pushOperand:result];
	
	return result;	
}

// Multiplication
-(double) multiply
{
	double result = 0;
	
	// Exception thrown for insufficient number of operands (< 2)
	if ([mgr getSize] < 2)
	{
		NSException *e = [[InsufficientNumberOfOperandsException alloc] initWithReason: @"Invalid number of operands on stack for multiplication."];
		[e raise];	
	}
	
	double a = [mgr popOperand];
	double b = [mgr popOperand];
	
	result = a * b;
	
	[mgr pushOperand:result];
	
	return result;	
	
}

// Division
-(double) divide
{
	double result = 0;

	// Exception thrown for insufficient number of operands (< 2)
	if ([mgr getSize] < 2)
	{
		NSException *e = [[InsufficientNumberOfOperandsException alloc] initWithReason: @"Invalid number of operands on stack for divison."];
		[e raise];	
	}
	
	// Exception thrown for divison by 2
	if ([mgr peek] == 0)
	{
		NSException *e = [[DivideByZeroException alloc] initWithReason: @"Divide by zero is not defined."];
		[e raise];	
	}
		
	double a = [mgr popOperand];
	double b = [mgr popOperand];
	
	result = b / a;
	
	[mgr pushOperand:result];

	return result;
}

// Power
-(double) power
{
	double result = 0;
	
	// Exception thrown for insufficient number of operands (< 2)
	if ([mgr getSize] < 2)
	{
		NSException *e = [[InsufficientNumberOfOperandsException alloc] initWithReason: @"Invalid number of operands on stack for Power."];
		[e raise];	
	}
	
	double a = [mgr popOperand];
	double b = [mgr popOperand];
	
	result = pow(b, a);
	
	[mgr pushOperand:result];
	
	return result;	
}

// Square Root
-(double) sqrt
{
	double result = 0;
	
	// Exception thrown for insufficient number of operands (< 1)
	if ([mgr getSize] < 1)
	{
		NSException *e = [[InsufficientNumberOfOperandsException alloc] initWithReason: @"Invalid number of operands on stack for Square Root."];
		[e raise];	
	}
	
	// Exception thrown for insufficient number of operands (< 1)
	if ([mgr peek] < 0)
	{
		NSException *e = [[NegativeOperandForRadicalException alloc] initWithReason: @"Negative operand for Radical is not defined."];
		[e raise];	
	}
	
	double a = [mgr popOperand];
	
	result = pow(a, 0.5);
	
	[mgr pushOperand:result];
	
	return result;		
}

// Logarithm (Base 10)
-(double) log
{
	double result = 0;
	
	// Exception thrown for insufficient number of operands (< 1)
	if ([mgr getSize] < 1)
	{
		NSException *e = [[InsufficientNumberOfOperandsException alloc] initWithReason: @"Invalid number of operands on stack for Log."];
		[e raise];	
	}		
	
	// Exception thrown for negative operands for log
	if ([mgr peek] <= 0)
	{
		NSException *e = [[NegativeOperandForLogException alloc] initWithReason: @"Logarithmtic operands can't be negative or zero."];
		[e raise];	
	}
	
	double a = [mgr popOperand];
	
	result = log10(a);
	
	[mgr pushOperand:result];
	
	return result;	
	
}

// Logarithm (Base e)
-(double) ln
{
	double result = 0;
	
	// Exception thrown for insufficient number of operands (< 1)
	if ([mgr getSize] < 1)
	{
		NSException *e = [[InsufficientNumberOfOperandsException alloc] initWithReason: @"Invalid number of operands on stack for Ln."];
		[e raise];	
	}
	
	// Exception thrown for negative operands for log
	if ([mgr peek] <= 0)
	{
		NSException *e = [[NegativeOperandForLogException alloc] initWithReason: @"Logarithmtic operands can't be negative or zero."];
		[e raise];	
	}
	
	double a = [mgr popOperand];
	
	result = log(a);
	
	[mgr pushOperand:result];
	
	return result;
}

// Sin
-(double) sin
{
	double result = 0;
	
	// Exception thrown for insufficient number of operands (< 1)
	if ([mgr getSize] < 1)
	{
		NSException *e = [[InsufficientNumberOfOperandsException alloc] initWithReason: @"Invalid number of operands on stack for Sin."];
		[e raise];	
	}
	
	double a = [mgr popOperand];
	
	result = sin(a);
	
	[mgr pushOperand:result];
	
	return result;		
}

// Cos
-(double) cos
{
	double result = 0;
	
	// Exception thrown for insufficient number of operands (< 1)
	if ([mgr getSize] < 1)
	{
		NSException *e = [[InsufficientNumberOfOperandsException alloc] initWithReason: @"Invalid number of operands on stack for Cos."];
		[e raise];	
	}
	
	double a = [mgr popOperand];
	
	result = cos(a);
	
	[mgr pushOperand:result];
	
	return result;
}

// Tan
-(double) tan
{
	double result = 0;
	
	// Exception thrown for insufficient number of operands (< 1)
	if ([mgr getSize] < 1)
	{
		NSException *e = [[InsufficientNumberOfOperandsException alloc] initWithReason: @"Invalid number of operands on stack for Tan."];
		[e raise];	
	}
	
	double a = [mgr popOperand];
	
	result = tan(a);
	
	[mgr pushOperand:result];
	
	return result;	
}

@end
