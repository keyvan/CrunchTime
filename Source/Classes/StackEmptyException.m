//
//  StackEmptyException.m
//  Stack Empty exception
//
//  Created by Neil Gandhi on 4/22/10.
//  Copyright 2010 CrunchTime Team 2010. All rights reserved.
//

#import "StackEmptyException.h"


@implementation StackEmptyException
-(id) initWithReason: (NSString *) reason
{
	self = [super initWithName: @"StackEmptyException"
						reason: reason
					  userInfo: nil];
	
	return self;
}

-(id) initWithReason: (NSString *)reason userInfo: (NSDictionary *)userInfo
{
	self = [super initWithName: @"StackEmptyException"
						reason: reason
					  userInfo: userInfo];
	
	return self;
}
@end
