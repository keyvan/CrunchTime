#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>

@interface CrunchTimeNumber: NSObject 
{
    double value;
}

-(CrunchTimeNumber*) initWithString: (NSString*) s;
-(CrunchTimeNumber*) initWithValue: (double) v;
-(double) getValue;
-(NSString*) toString;
@end
