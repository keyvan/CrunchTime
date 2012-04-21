#import "StackManager.h"
#import "Constants.h"
#import "CrunchTimeNumber.h"
#import "StackFullException.h"
#import "StackEmptyException.h"
#import "StackAccessException.h"
#import "CrunchTimeInnerException.h"
#import <Foundation/NSArray.h>
#import <Foundation/NSValue.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSException.h>
#import <stdio.h>

@implementation StackManager
-(StackManager*) init 
{
	self = [super init];
	
	if(self) 
	{
		stack = [[NSMutableArray alloc] initWithCapacity: INITIALSTACKSIZE];
	}
	
	return self;
}

-(void) dealloc
{
	[super dealloc];
	[stack release];
}

-(void) pushOperand: (double) v
{
	if ([self isFull])
	{
		NSException *e = [[StackFullException alloc] initWithReason: @"Stack is Full!"];
		[e raise];
	}

	CrunchTimeNumber* value = [[CrunchTimeNumber alloc] initWithValue: v];
	[stack addObject: value];
}

-(double) popOperand
{
	if ([self isEmpty])
	{
		NSException *e = [[StackEmptyException alloc] initWithReason: @"Stack is Empty!"];
		[e raise];
	}
	
	double v = [self peek];
	CrunchTimeNumber* value = [stack lastObject];
	[stack removeLastObject];
	[value release];
	return v;
}

-(NSArray*) getStack
{
	int size = [self getSize];
	NSMutableArray* values = [[NSMutableArray alloc] initWithCapacity: size];
	
	CrunchTimeNumber* num;
	int i;
	for(i = 0; i < size; i++)
	{
		num = [stack objectAtIndex: i];
		[values addObject: [num toString]];
	}
	return values;
}

-(int) getSize
{
	return [stack count];
}

-(BOOL) isEmpty
{
	return [self getSize] == 0;
}

-(BOOL) isFull
{
	return [self getSize] >= MAXSTACKSIZE;
}

-(void) removeAtPosition: (int) p
{
	if (p >= [self getSize] || p < 0)
	{
		NSException *e = [[StackAccessException alloc] initWithReason: @"Not valid stack position!"];
		[e raise];
	}

	CrunchTimeNumber* num = [stack objectAtIndex: p];
	[stack removeObjectAtIndex: p];
	[num release];
}

-(void) clear
{
	[stack release];
	stack = [[NSMutableArray alloc] initWithCapacity: INITIALSTACKSIZE];
}

-(double) peek
{
	if ([self isEmpty])
	{
		NSException *e = [[StackEmptyException alloc] initWithReason: @"Stack is Empty!"];
		[e raise];
	}

	CrunchTimeNumber* value = [stack lastObject];
	return [value getValue];
}
@end
