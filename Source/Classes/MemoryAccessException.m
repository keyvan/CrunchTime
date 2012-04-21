//
//  MemoryAccessException.m
//  Memory Access exception
//
//  Created by Neil Gandhi on 4/22/10.
//  Copyright 2010 CrunchTime Team 2010. All rights reserved.
//

#import "MemoryAccessException.h"


@implementation MemoryAccessException
-(id) initWithReason: (NSString *) reason
{
	self = [super initWithName: @"MemoryAccessException"
						reason: reason
					  userInfo: nil];
	
	return self;
}

-(id) initWithReason: (NSString *)reason userInfo: (NSDictionary *)userInfo
{
	self = [super initWithName: @"MemoryAccessException"
						reason: reason
					  userInfo: userInfo];
	
	return self;
}
@end
