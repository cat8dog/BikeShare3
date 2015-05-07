#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)
#import "StationManager.h"
#import "Annotation.h"


@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) StationManager *stationManager;
@property (assign, nonatomic) CLLocationCoordinate2D *poopSmiley;
@property (assign, nonatomic) MKMapRect *mapRect;
-(MKMapRect)mapRectThatFits: (MKMapRect *)mapRect;


@end