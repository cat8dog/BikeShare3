#import <UIKit/UIKit.h>

@interface MoreInfoController : UIViewController

@property (retain,nonatomic) NSString *info;
@property (strong, nonatomic) UILabel *label;
-(id)sender:(UIViewController *)passDataForward;

@end

