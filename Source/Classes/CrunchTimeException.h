//
//  CrunchTimeException.h
//  Root exception type for all the exceptions
//
//  Created by Keyvan Nayyeri on 3/15/10.
//  Copyright 2010 CrunchTime Team 2010. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSException.h>


@interface CrunchTimeException : NSException 
{

}

-(id) initWithReason: (NSString *)reason;
-(id) initWithReason: (NSString *)reason userInfo: (NSDictionary *)userInfo;

@end
