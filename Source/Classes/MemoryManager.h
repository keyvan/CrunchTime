#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSValue.h>

@interface MemoryManager: NSObject 
{
    NSMutableArray *memory;
}

-(MemoryManager*) init;
-(int) addToMemory: (double) v;
-(void) removeFromMemory: (int) slot;
-(double*) getMemory;
-(double) getMemorySlot: (int) slot;
-(int) getSize;
-(BOOL) isEmpty;
-(BOOL) isFull;
-(void) clear;
@end
