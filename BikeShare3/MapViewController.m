#import "MapViewController.h"
#import "MoreInfoController.h"
#import "Annotation.h"


@interface MapViewController ()

@end

@implementation MapViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"MapView";
        self.tabBarItem.image = [UIImage imageNamed:@"MapView"];
        
        
        // self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.stationManager = [[StationManager alloc]init];
    _mapView = [[MKMapView alloc]initWithFrame:self.view.frame];

    [self.view addSubview:_mapView];
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    
    if(IS_OS_8_OR_LATER) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
    _mapView.showsUserLocation = YES;
    _mapView.showsPointsOfInterest = YES;
}

    

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.stationManager getStationsOnSuccess:^(NSArray *stations) {
        for (Annotation *annotation in stations)
        {
            [self.mapView addAnnotation:annotation];
        }
    }];
}

//
//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//    MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"annoView"];
//    
//    if (!view) {
//        view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annoView"];

        
        
//
//    
//        // coordinate
//    CLLocationCoordinate2D location;
//    location.latitude = 43.661149;
//    location.longitude = -79.366648;
//        // annotation
//        Annotation *ann = [[Annotation alloc] initWithPosition:location];
//        ann.title = @"Parliament & Gerrard";
//        ann.subtitle = @"Docks = 27";
//        // add to map
//        [self.mapView addAnnotation:ann];
//  
//   }
//      return view;
// }






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
