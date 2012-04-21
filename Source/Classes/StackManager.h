#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSValue.h>

@interface StackManager: NSObject 
{
    NSMutableArray *stack;
}

-(StackManager*) init;
-(void) pushOperand: (double) v;
-(double) popOperand;
-(NSArray*) getStack;
-(int) getSize;
-(BOOL) isEmpty;
-(BOOL) isFull;
-(void) removeAtPosition: (int) p;
-(void) clear;
-(double) peek;
@end
