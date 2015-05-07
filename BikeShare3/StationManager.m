#import "StationManager.h"
#import "Annotation.h"

@implementation StationManager



- (instancetype)init
{
    self = [super init];
    if (self) {
        _http = [[HTTPCommunication alloc]init];
    }
    return self;
}

-(void)getStationsOnSuccess:(void (^)(NSArray *stations))success
{
    NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];
    
    [_http retrieveURL:url successBlock:^(NSData *response) {
        NSError *error = nil;
        // deserialze the information we get from the API
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        NSMutableArray *listStations = [[NSMutableArray alloc]init];
        NSArray *stationBeanList = data[@"stationBeanList"];
        for (NSDictionary*dict in stationBeanList) {
            Annotation *annotation = [[Annotation alloc] init];
            NSString *name = dict[@"stationName"];
            annotation.title = name;
            NSNumber *lat = dict[@"latitude"];
            NSNumber *lng = dict[@"longitude"];
            NSNumber *docks = dict[@"totalDocks"];
            annotation.coordinate = CLLocationCoordinate2DMake([lat doubleValue], [lng doubleValue]);
            [listStations addObject:annotation];
        }
        NSLog(@"%@",data);
        if (success)
        {
            success(listStations);
        }
   }];
}
        
@end
