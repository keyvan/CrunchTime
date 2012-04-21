#import "ConfigurationManager.h"
#include <limits.h>

@implementation ConfigurationManager

static ConfigurationManager *sharedInstance = nil;

+(ConfigurationManager*) sharedInstance
{
    if (sharedInstance == nil)
	{
        sharedInstance = [[ConfigurationManager alloc] init];
		[sharedInstance setNotation: NO];
		[sharedInstance setBase: 10];
	}
    return sharedInstance;
}

-(void) setNotation: (BOOL) v
{
	notationSetting = v;
	if(v == YES)
		[self setBase: 10];
}

-(void) toggleNotation
{
	[self setNotation: !notationSetting];
}

-(void) setBase: (int) n
{
	baseSetting = n;
	if(n != 10)
		[self setNotation: NO];
}

-(BOOL) getNotation
{
	return notationSetting;
}

-(int) getBase
{
	return baseSetting;
}

+ (id)allocWithZone:(NSZone *)zone {
	if (sharedInstance == nil) 
	{
		sharedInstance = [super allocWithZone:zone];
		return sharedInstance;  // assignment and return on first allocation
	}
    return nil; // on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;  // denotes an object that cannot be released
}

- (void)release {
    //do nothing
}

- (id)autorelease {
    return self;
}

@end
