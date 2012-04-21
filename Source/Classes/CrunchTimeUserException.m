//
//  CrunchTimeUserException.m
//  CrunchTime
//
//  Created by Neil Gandhi on 4/11/10.
//  Copyright 2010 CrunchTime Team. All rights reserved.
//

#import "CrunchTimeException.h"
#import "CrunchTimeUserException.h"
#import <Foundation/NSException.h>
#import <Foundation/NSDictionary.h>


@implementation CrunchTimeUserException
-(id) initWithReason: (NSString *) reason
{
	self = [self initWithReason: reason userInfo: nil];
	return self;
}

-(id) initWithReason: (NSString *)reason userInfo: (NSDictionary *)userInfo
{
	self = [super initWithName: @"CrunchTimeUserException"
			reason: reason
			userInfo: userInfo];
			
	return self;
}
@end
