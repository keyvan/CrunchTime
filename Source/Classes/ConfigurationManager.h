#import <Foundation/NSObject.h>

@interface ConfigurationManager: NSObject 
{
	BOOL notationSetting; // true=scientific notation, false=decimal notation
	int baseSetting; // set to base of number (i.e. base 10, base 16, base 2)
}

+(ConfigurationManager*) sharedInstance;
-(void) setNotation: (BOOL) v;
-(void) toggleNotation;
-(void) setBase: (int) n;
-(BOOL) getNotation;
-(int) getBase;

@end
