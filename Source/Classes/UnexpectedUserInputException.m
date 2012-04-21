//
//  UnexpectedUserInputException.m
//  Unexpected user input exception
//
//  Created by Robert L. Porter on 4/25/10.
//  Copyright 2010 CrunchTime Team. All rights reserved.
//

#import "UnexpectedUserInputException.h"


@implementation UnexpectedUserInputException
-(id) initWithReason: (NSString *) reason
{
	self = [super initWithName: @"UnexpectedUserInputException"
						reason: reason
					  userInfo: nil];
	
	return self;
}

-(id) initWithReason: (NSString *)reason userInfo: (NSDictionary *)userInfo
{
	self = [super initWithName: @"UnexpectedUserInputException"
						reason: reason
					  userInfo: userInfo];
	
	return self;
}
@end
