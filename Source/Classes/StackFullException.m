//
//  StackFullException.m
//  Stack Full exception
//
//  Created by Neil Gandhi on 4/22/10.
//  Copyright 2010 CrunchTime Team 2010. All rights reserved.
//

#import "StackFullException.h"


@implementation StackFullException
-(id) initWithReason: (NSString *) reason
{
	self = [super initWithName: @"StackFullException"
						reason: reason
					  userInfo: nil];
	
	return self;
}

-(id) initWithReason: (NSString *)reason userInfo: (NSDictionary *)userInfo
{
	self = [super initWithName: @"StackFullException"
						reason: reason
					  userInfo: userInfo];
	
	return self;
}
@end
