//
//  NegativeOperandForLogException.m
//  Negative operand for logarithmtic exception
//
//  Created by Keyvan Nayyeri on 4/19/10.
//  Copyright 2010 CrunchTime Team 2010. All rights reserved.
//

#import "NegativeOperandForLogException.h"
#import "CrunchTimeUserException.h"

@implementation NegativeOperandForLogException
-(id) initWithReason: (NSString *) reason
{
	self = [super initWithName: @"NegativeOperandForLogException"
						reason: reason
					  userInfo: nil];
	
	return self;
}

-(id) initWithReason: (NSString *)reason userInfo: (NSDictionary *)userInfo
{
	self = [super initWithName: @"NegativeOperandForLogException"
						reason: reason
					  userInfo: userInfo];
	
	return self;
}
@end
