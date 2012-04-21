//
//  CrunchTimeInnerException.m
//  CrunchTime
//
//  Created by Neil Gandhi on 4/11/10.
//  Copyright 2010 CrunchTime Team. All rights reserved.
//

#import "CrunchTimeException.h"
#import "CrunchTimeInnerException.h"
#import <Foundation/NSException.h>
#import <Foundation/NSDictionary.h>


@implementation CrunchTimeInnerException
-(id) initWithReason: (NSString *) reason
{
	self = [super initWithName: @"CrunchTimeInnerException"
			reason: reason
			userInfo: nil];
			
	return self;
}

-(id) initWithReason: (NSString *)reason userInfo: (NSDictionary *)userInfo
{
	self = [super initWithName: @"CrunchTimeInnerException"
			reason: reason
			userInfo: userInfo];
			
	return self;
}
@end
