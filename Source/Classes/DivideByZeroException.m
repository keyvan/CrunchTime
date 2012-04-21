//
//  DivideByZeroException.m
//  Division by zero exception
//
//  Created by Keyvan Nayyeri on 4/19/10.
//  Copyright 2010 CrunchTime Team 2010. All rights reserved.
//

#import "DivideByZeroException.h"


@implementation DivideByZeroException
-(id) initWithReason: (NSString *) reason
{
	self = [super initWithName: @"DivideByZeroException"
						reason: reason
					  userInfo: nil];
	
	return self;
}

-(id) initWithReason: (NSString *)reason userInfo: (NSDictionary *)userInfo
{
	self = [super initWithName: @"DivideByZeroException"
						reason: reason
					  userInfo: userInfo];
	
	return self;
}
@end
