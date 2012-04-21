//
//  InsufficientNumberOfOperandsException.m
//  Exception for insufficient number of operands for an operator (< 2 or < 1)
//
//  Created by Keyvan  Nayyeri on 4/12/10.
//  Copyright 2010 CrunchTime Team 2010. All rights reserved.
//

#import "InsufficientNumberOfOperandsException.h"

@implementation InsufficientNumberOfOperandsException
-(id) initWithReason: (NSString *) reason
{
	self = [super initWithName: @"InsufficientNumberOfOperandsException"
						reason: reason
					  userInfo: nil];
	
	return self;
}

-(id) initWithReason: (NSString *)reason userInfo: (NSDictionary *)userInfo
{
	self = [super initWithName: @"InsufficientNumberOfOperandsException"
						reason: reason
					  userInfo: userInfo];
	
	return self;
}@end
