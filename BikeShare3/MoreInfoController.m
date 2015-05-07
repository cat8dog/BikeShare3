#import "MoreInfoController.h"

@interface MoreInfoController ()

@end

@implementation MoreInfoController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"More Info";
        self.tabBarItem.image = [UIImage imageNamed:@"More Info"];
    }
    return self;
}

- (void)passDataForward {
    MoreInfoController *moreInfoController = [[MoreInfoController alloc]init];
    moreInfoController.info = _label.text;
    [self.navigationController pushViewController:moreInfoController animated:YES];
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    
    
    
    
}

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
