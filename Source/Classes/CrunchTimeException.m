//
//  CrunchTimeException.m
//  Root exception type for all the exceptions
//
//  Created by Keyvan Nayyeri on 3/15/10.
//  Copyright 2010 CrunchTime Team 2010. All rights reserved.
//

#import "CrunchTimeException.h"
#import <Foundation/NSException.h>


@implementation CrunchTimeException
-(id) initWithReason: (NSString *) reason
{
	self = [self initWithReason: reason userInfo: nil];
	return self;
}

-(id) initWithReason: (NSString *)reason userInfo: (NSDictionary *)userInfo
{
	self = [super initWithName: @"CrunchTimeException"
			reason: reason
			userInfo: userInfo];
			
	return self;
}
@end
