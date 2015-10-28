#import "HomeViewController.h"

#import "ViewControllerOne.h"
#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"

#import "CarbonKit.h"

@interface HomeViewController () <CarbonTabSwipeDelegate>
{
	CarbonTabSwipeNavigation *tabSwipe;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	UIColor *color = self.navigationController.navigationBar.barTintColor;
	NSArray *names = @[@"ONE", @"TWO", @"THREE"];
	tabSwipe = [[CarbonTabSwipeNavigation alloc] createWithRootViewController:self tabNames:names tintColor:color switcher:YES delegate:self];
	[tabSwipe setIndicatorHeight:.0f]; // default 3.f
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[tabSwipe setTranslucent:NO]; // remove translucent
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[tabSwipe setTranslucent:YES]; // add translucent
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

# pragma mark - Carbon Tab Swipe Delegate
// required
- (UIViewController *)tabSwipeNavigation:(CarbonTabSwipeNavigation *)tabSwipe viewControllerAtIndex:(NSUInteger)index {
	
	if (index == 0) {
		ViewControllerOne *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerOne"];
		[[viewController view] setBackgroundColor:[UIColor lightGrayColor]];
		return viewController;
	} else if (index == 1) {
		ViewControllerTwo *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerTwo"];
		[[viewController view] setBackgroundColor:[UIColor lightGrayColor]];
		return viewController;
	} else {
		ViewControllerThree *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerThree"];
		viewController.tabSwipeNavigation = tabSwipe;
		return viewController;
	}
}

// optional
- (void)tabSwipeNavigation:(CarbonTabSwipeNavigation *)tabSwipe didMoveAtIndex:(NSInteger)index {
	NSLog(@"Current tab: %d", (int)index);
}

@end
