#import "MemoryManager.h"
#import "Constants.h"
#import "MemoryAccessException.h"
#import "CruncHTimeNumber.h"
#import <Foundation/NSArray.h>
#import <Foundation/NSValue.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSException.h>
#import <stdio.h>

@implementation MemoryManager
-(MemoryManager*) init 
{
	self = [super init];
	
	if(self) 
	{
		memory = [[NSMutableArray alloc] initWithCapacity: INITIALMEMORYSIZE];
	}
	
	return self;
}

-(void) dealloc
{
	[super dealloc];
	[memory release];
}

-(int) addToMemory: (double) v
{
	if ([self isFull])
	{
		[self removeFromMemory: 0];
	}

	CrunchTimeNumber* value = [[CrunchTimeNumber alloc] initWithValue: v];
	[memory addObject: value];
	return [self getSize] - 1;
}

-(void) removeFromMemory: (int) slot
{
	if (slot >= [self getSize] || slot < 0)
	{
		NSException *e = [[MemoryAccessException alloc] initWithReason: @"Not valid memory slot!"];
		[e raise];
	}
	
	CrunchTimeNumber* num = [memory objectAtIndex: slot];
	[memory removeObjectAtIndex: slot];
	[num release];
}

-(double*) getMemory
{
	int size = [self getSize];
	double *values = malloc(size * sizeof(double));
	CrunchTimeNumber *num;
	int i;
	for(i = 0; i < size; i++)
	{
		num = [memory objectAtIndex: i];
		values[i] = [num getValue];
	}
	return values;
}

-(double) getMemorySlot: (int) slot
{
	if (slot >= [self getSize] || slot < 0)
	{
		NSException *e = [[MemoryAccessException alloc] initWithReason: @"No values in memory!"];
		[e raise];
	}
	
	CrunchTimeNumber* num = [memory objectAtIndex: slot];
	return [num getValue];
}

-(int) getSize
{
	return [memory count];
}

-(BOOL) isEmpty
{
	return [self getSize] == 0;
}

-(BOOL) isFull
{
	return [self getSize] == MAXMEMORYSIZE;
}

-(void) clear
{
	[memory release];
	memory = [[NSMutableArray alloc] initWithCapacity: INITIALMEMORYSIZE];
}

@end
