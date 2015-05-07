#import <Foundation/Foundation.h>
#import "HTTPCommunication.h"

@interface StationManager : NSObject

@property (strong, nonatomic) HTTPCommunication *http;

// Stations method
-(void)getStationsOnSuccess:(void (^)(NSArray *stations))success;

@end
