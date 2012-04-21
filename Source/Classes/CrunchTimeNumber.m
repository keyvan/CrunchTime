#import "CrunchTimeNumber.h"
#import "ConfigurationManager.h"
#import <Foundation/NSString.h>
#import "Constants.h"

@implementation CrunchTimeNumber
-(CrunchTimeNumber*) initWithString: (NSString*) s
{
	double v = [s doubleValue];
	self = [self initWithValue: v]; 	
	return self;
}

-(CrunchTimeNumber*) initWithValue: (double) v
{
	self = [super init];
	
	if(self) 
	{
		value = v;
	}
	
	return self;
}

-(double) getValue
{
	return value;
}

-(NSString*) toString
{
	ConfigurationManager* config = [ConfigurationManager sharedInstance];
	BOOL notationSetting = [config getNotation];
	//int baseSetting = [config getBase];
	if(notationSetting == YES)
		return [NSString stringWithFormat: @SCIENTIFICFORMAT, value];
	else
		return [NSString stringWithFormat: @DECIMALFORMAT, value];
}
@end
