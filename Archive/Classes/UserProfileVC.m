//
//  UserProfileVC.m
//  LUCY MAP FRAMEWORK
//
//  Created by Daniel-Ernest Luff.
//

#import "UserProfileVC.h"


@implementation UserProfileVC
@synthesize Label;
- (void)viewDidLoad {
    [super viewDidLoad];
}

/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */


 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
	 interfaceOrientation=UIInterfaceOrientationPortrait;
 return YES;
 }
 

- (void)dealloc {
    [super dealloc];
}
@end
