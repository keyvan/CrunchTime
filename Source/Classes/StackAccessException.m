//
//  StackAccessException.m
//  Stack Access exception
//
//  Created by Neil Gandhi on 4/22/10.
//  Copyright 2010 CrunchTime Team 2010. All rights reserved.
//

#import "StackAccessException.h"


@implementation StackAccessException
-(id) initWithReason: (NSString *) reason
{
	self = [super initWithName: @"StackAccessException"
						reason: reason
					  userInfo: nil];
	
	return self;
}

-(id) initWithReason: (NSString *)reason userInfo: (NSDictionary *)userInfo
{
	self = [super initWithName: @"StackAccessException"
						reason: reason
					  userInfo: userInfo];
	
	return self;
}
@end
