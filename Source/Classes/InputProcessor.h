//
//  InputProcessor.h
//  CrunchTime
//
//  Created by Robert L. Porter on 3/15/2010.
//  Copyright 2010 CrunchTime Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorView.h"

@class ComputationEngine;
@class MemoryManager;

@interface InputProcessor : NSObject {
    ComputationEngine *CompEngine;
	MemoryManager *MemoryMgr;
}
@property (nonatomic, retain) ComputationEngine *CompEngine;
@property (nonatomic, retain) MemoryManager *MemoryMgr;

- (id)init;
- (void)setUpComputationEngine;
- (NSString *)ProcessKey:(NSString *)KeyPressed: (NSString *)TempStorageValue;
- (NSString *)ValidateNumberString:(NSString *)UnvalidatedNumber;
- (NSArray *)getStack;
- (int) getSize;
- (void)DebugStack;
@end
