//
//  InputProcessor.m
//  CrunchTime
//
//  Created by Robert L. Porter on 3/15/2010.
//  Copyright 2010 CrunchTime Team. All rights reserved.
//

#import "InputProcessor.h"
#import "CalculatorView.h"
#import "ComputationEngine.h"
#import "ConfigurationManager.h"
#import "MemoryManager.h"
#import "Constants.h"
#import "UnexpectedUserInputException.h"

@implementation InputProcessor

@synthesize CompEngine;
@synthesize MemoryMgr;

// set up the ComputationEngine and MemoryManager classes
- (id)init {
	if (self = [super init]) {
		[self setUpComputationEngine];
		MemoryMgr = [[MemoryManager alloc] init];
	}
    return self;
}

// set up (really) the ComputationEngine class
- (void)setUpComputationEngine {
	ComputationEngine *tce = [[ComputationEngine alloc] init];
	self.CompEngine = tce;
	[tce release];
}

// deallocate memory for our local variable
- (void)dealloc {
	[CompEngine release];
	[MemoryMgr release];
	[super dealloc];
}

// Process the input key pressed by examining the value pressed (in a large if-then-else
// structure because Objective C doesn't support switch with strings) and act accordingly.
// Then validate a new string constructed for the temporary storage area.
- (NSString *)ProcessKey:(NSString *)KeyPressed: (NSString *)TempStorageValue {
	
	// for debugging purposes only...  NSLog(@"KeyPressed = %@", KeyPressed);	
	
	// create a local copy of the temp value
	NSString *CurrentValue = [NSString stringWithFormat:@"%@", TempStorageValue];
	// convert our value to a string (just in case whatever we were given is not a string)
	NSString * KeyPressedStr = [NSString stringWithFormat:@"%@", KeyPressed];
	// initialize the value we will be deriving and returning for the temp storage area
	NSString * NewVal;
	
	// if the key is a number (as a character)
	if (([KeyPressedStr isEqualToString:@ZERO]) ||
		([KeyPressedStr isEqualToString:@ONE]) ||
		([KeyPressedStr isEqualToString:@TWO]) ||
		([KeyPressedStr isEqualToString:@THREE]) ||
		([KeyPressedStr isEqualToString:@FOUR]) ||
		([KeyPressedStr isEqualToString:@FIVE]) ||
		([KeyPressedStr isEqualToString:@SIX]) ||
		([KeyPressedStr isEqualToString:@SEVEN]) ||
		([KeyPressedStr isEqualToString:@EIGHT]) ||
		([KeyPressedStr isEqualToString:@NINE])) {
		// append the number character to our current value)
		NewVal = [NSString stringWithFormat:@"%@%@", CurrentValue, KeyPressedStr];
	}
	
	// if the decimal key is pressed
    else if ([KeyPressedStr isEqualToString:@POINT]) {
		// determine if the current value already has a decimal
		NSRange textRange;
		textRange =[CurrentValue rangeOfString:@POINT];
		// if it does not have a decimal
		if (textRange.location == NSNotFound) {
			// if it has no value at all, start with "0."
			int strlen = [CurrentValue length];
			if (strlen == 0)
				NewVal = [NSString stringWithFormat:@"%s", "0."];
			// else append the decimal to our current value
			else
				NewVal = [NSString stringWithFormat:@"%@%@", CurrentValue, KeyPressedStr];
		}
		// else keep the value the same
		else {
			NewVal = CurrentValue;
		}
	}
	
	// if an operator key is pressed
	else if (([KeyPressedStr isEqualToString:@PLUS]) ||
		    ([KeyPressedStr isEqualToString:@MINUS]) ||
			([KeyPressedStr isEqualToString:@MULTIPLY]) ||
		    ([KeyPressedStr isEqualToString:@DIVIDE]) ||
		    ([KeyPressedStr isEqualToString:@POWER]) ||
		    ([KeyPressedStr isEqualToString:@SQRT]) ||  // RAD --> SQRT
		    ([KeyPressedStr isEqualToString:@LOG]) ||
		    ([KeyPressedStr isEqualToString:@LN]) ||
		    ([KeyPressedStr isEqualToString:@SIN]) ||
		    ([KeyPressedStr isEqualToString:@COS]) ||
		    ([KeyPressedStr isEqualToString:@TAN])) {
		// check if there is something in TempStorageValue and if so, push it onto the stack
		if  (![TempStorageValue isEqualToString:@""]) {
			double myDouble = [CurrentValue doubleValue];
			[CompEngine pushOperand: myDouble];
		}
		// pass the operator to the calculation engine
		[CompEngine calculate:KeyPressedStr];
		// blank out the temporary storage value
		NewVal = [NSString stringWithFormat:@"%s", ""];
	}
	
	// if the ENTER key is pressed
	else if ([KeyPressedStr isEqualToString:@ENT]) {
		// if the temporary storage value is not empty
		if (!([CurrentValue isEqualToString:@""])) {
			// pass CurrentValue to the calculation engine to be pushed onto the stack
			double myDouble = [CurrentValue doubleValue];
			[CompEngine pushOperand: myDouble];
		}
		// else the temp storage is empty, so we must be trying to duplicate the last value on the stack
		else {
			// if the stack is not empty, duplicate the last value on the stack
			if ([CompEngine getSize] > 0){
				double myDouble = [CompEngine peek];
				[CompEngine pushOperand: myDouble];
			}
			// else there is nothing to duplicate, so...
			else {
				// blank out the temporary storage value
				NewVal = [NSString stringWithFormat:@"%s", ""];
			}			
		}
		// blank out the temporary storage value
		NewVal = [NSString stringWithFormat:@"%s", ""];
	}
	
	// if the CLEAR key is pressed
	else if ([KeyPressedStr isEqualToString:@CLR]) {
		// if not actively entering a value in temporary storage
		if ([CurrentValue isEqualToString:@""]) {
			// remove and discard the last value on the stack
			[CompEngine popOperand];
			NewVal = [NSString stringWithFormat:@"%s", ""];
		}
		// else we are actively entering a values, so...
		else {
			// blank out the temporary storage value
			NewVal = [NSString stringWithFormat:@"%s", ""];
		}
	}
	
	// if the DELETE key is pressed
	else if ([KeyPressedStr isEqualToString:@DEL]) {
		// if the temporary storage value is not empty
		if (!([CurrentValue isEqualToString:@""])) {
			// remove the last character entered from our value
			int strlen = [CurrentValue length];			
			NewVal = [CurrentValue substringWithRange:NSMakeRange(0, strlen-1)]; 
		}
		else
			NewVal = [NSString stringWithFormat:@"%s", ""];
		
	}
	
	// if the POSITIVE/NEGATIVE key is pressed (toggle the negative sign)
	else if ([KeyPressedStr isEqualToString:@NEG]) {
		// get the length of the current value
		int strlen = [CurrentValue length];
		// if there is anything on our current display
		if (strlen > 0) {
			// get the first character in the string
			NSString *firstCharacter = [CurrentValue substringWithRange:NSMakeRange(0,1)];
			// if there is a first character (theoretically, this is redundant)
			if (firstCharacter != nil) {
				// if the first character is a negative sign
				if ([firstCharacter isEqualToString:@MINUS]) {
					// remove the negative sign from our value
					NewVal = [CurrentValue substringWithRange:NSMakeRange(1, strlen-1)]; 
				}
				// else the first character is not a negative sign
				else {
					// add the negative sign to our value
					NewVal = [NSString stringWithFormat:@"%s%@", MINUS, CurrentValue];
				}
   			}
		}
		else {
			NewVal = [NSString stringWithFormat:@"%s", ""];
		}
	}
	
	// if the SCI key is pressed (toggle the scientific notation sign)
	else if ([KeyPressedStr isEqualToString:@SCI]) {
		// Toggle scientific notation
		[[ConfigurationManager sharedInstance] toggleNotation];
		
		// get the length of the current value
		int strlen = [CurrentValue length];
		// if there is anything on our current display
		if (strlen > 0) {
			NewVal = [NSString stringWithFormat:@"%@", CurrentValue];
		}
		else {
			NewVal = [NSString stringWithFormat:@"%s", ""];
		}
	}
	
	// if the M key is pressed (add to memory)
	else if ([KeyPressedStr isEqualToString:@M]) {
		if  (![TempStorageValue isEqualToString:@""]) {
			double myDouble = [CurrentValue doubleValue];
			// Add to memory
			[MemoryMgr addToMemory:myDouble];
		}
		
		NewVal = [NSString stringWithFormat:@"%s", ""];
	}
	
	// if the MR key is pressed (recall from memory)
	else if ([KeyPressedStr isEqualToString:@MR]) {
		double val = [MemoryMgr getMemorySlot:0];
		NewVal = [NSString stringWithFormat:@"%g", val];
	}
	
	// if the Shake gesture was activated
	else if ([KeyPressedStr isEqualToString:@SHAKE]) {
		[CompEngine clear];
		if (strlen > 0) {
			NewVal = [NSString stringWithFormat:@"%@", CurrentValue];
		}
		else {
			NewVal = [NSString stringWithFormat:@"%s", ""];
		}
	}
	
	// if something unexpected happened
	else {
		NSString *theexception = [NSString stringWithFormat:@"Unexpected user input: %@", KeyPressedStr];
		NSException *e = [[UnexpectedUserInputException alloc] initWithReason: theexception];
		[e raise];	
	}
	
    // Okay, by now we've evaluated what the user entered.  So now let's
	// see if the new value string we've constructed makes sense...
	CurrentValue = [self ValidateNumberString: NewVal];
	
	// For debugging purposes only, look at what's in the stack [self DebugStack];
	// return our validated value string...
	return CurrentValue;
}

// validate that the string is a valid number and return whatever is validated
- (NSString *)ValidateNumberString:(NSString *)UnvalidatedNumber {
	NSString *ValidatedNumber;
	
	// if the new value is blank
	if (([UnvalidatedNumber isEqualToString:@""]) || ([UnvalidatedNumber isEqualToString:@MINUS])) {
		// then our display value is blank
		ValidatedNumber = [NSString stringWithFormat:@"%s", ""];
	}
	// else our new value is something, so...
	else {
		// if this is this special case...
		if (([UnvalidatedNumber isEqualToString:@"-0."]) || ([UnvalidatedNumber isEqualToString:@"-0"])) {
			ValidatedNumber = [NSString stringWithFormat:@"%s", "0."];
		}
		else {
			// attempt a conversion to a floating point
			float myFloat = [UnvalidatedNumber floatValue];
			if ([UnvalidatedNumber isEqualToString:@ZERO] ||
				[UnvalidatedNumber hasPrefix:@"0."] ||
				(myFloat != 0.0))
				// save the new value string
				ValidatedNumber = [NSString stringWithFormat:@"%@", UnvalidatedNumber];
		}
	}
	// return the validated number
	return ValidatedNumber;
}

// get whatever is on the internal stack
-(NSArray *) getStack {
	return [CompEngine getStack];
}

// get the size of the internal stack
-(int) getSize {
	return [CompEngine getSize];
}

// This function is for debugging purposes only.  It will output to the console whatever
// is currently on the interal stack.
- (void)DebugStack {
	// DEBUG -- look at what's in the stack
	//double *TheStack = [CompEngine getStack];
	NSArray* TheStack = [CompEngine getStack];
	int c;
	for (c=0;c<[TheStack count];c++)
		NSLog(@"TheStack %@", (NSString*)[TheStack objectAtIndex:c]);
	//	NSLog(@"TheStack %f", TheStack[c]);		
}

@end		
