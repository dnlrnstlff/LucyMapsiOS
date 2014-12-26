//
//  RootViewController.m
//  LUCY MAP FRAMEWORK
//
//  Created by Daniel-Ernest Luff.
//

#import "RootViewController.h"
#import "MyAnnotation.h"
#import "UserProfileVC.h"


@implementation RootViewController

@synthesize mapView,userProfileVC,Label;


#pragma mark -
#pragma mark View lifecycle

- (void)gotoLocation
{
    // start off by default in Peakirk
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 52.644866;
    newRegion.center.longitude = -0.273724;
    newRegion.span.latitudeDelta = 0.872;
    newRegion.span.longitudeDelta = 0.863;
	
    [self.mapView setRegion:newRegion animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];

	
	CLLocation *userLoc = mapView.userLocation.location;
    CLLocationCoordinate2D userCoordinate = userLoc.coordinate;
	
	NSLog(@"user latitude = %f",userCoordinate.latitude);
	NSLog(@"user longitude = %f",userCoordinate.longitude);
	
	mapView.delegate=self;
	
	NSMutableArray* annotations=[[NSMutableArray alloc] init];
	
	CLLocationCoordinate2D theCoordinate1;
    theCoordinate1.latitude = 52.642377;
    theCoordinate1.longitude = -0.273404;
	
	CLLocationCoordinate2D theCoordinate2;
    theCoordinate2.latitude = 52.645426;
    theCoordinate2.longitude = -0.274941;
	
	CLLocationCoordinate2D theCoordinate3;
    theCoordinate3.latitude = 52.644065;
    theCoordinate3.longitude = -0.273605;
	
	CLLocationCoordinate2D theCoordinate4;
    theCoordinate4.latitude = 52.643727;
    theCoordinate4.longitude = -0.272903;
	
	MyAnnotation* myAnnotation1=[[MyAnnotation alloc] init];

	myAnnotation1.coordinate=theCoordinate1;
	myAnnotation1.title=@"Peakirk Train Station";
	myAnnotation1.subtitle=@"Closed In 1961";
	
	MyAnnotation* myAnnotation2=[[MyAnnotation alloc] init];
	
	myAnnotation2.coordinate=theCoordinate2;
	myAnnotation2.title=@"St. Pega's Church";
	myAnnotation2.subtitle=@"Dedicated to St. Pega";
	
	MyAnnotation* myAnnotation3=[[MyAnnotation alloc] init];
	
	myAnnotation3.coordinate=theCoordinate3;
	myAnnotation3.title=@"The Ruddy Duck";
	myAnnotation3.subtitle=@"Peakirk's Watering Hole";
	
	MyAnnotation* myAnnotation4=[[MyAnnotation alloc] init];
	
	myAnnotation4.coordinate=theCoordinate4;
	myAnnotation4.title=@"Green Acres";
	myAnnotation4.subtitle=@"Home of the Luff Clan";
	
	[mapView addAnnotation:myAnnotation1];
	[mapView addAnnotation:myAnnotation2];
	[mapView addAnnotation:myAnnotation3];
	[mapView addAnnotation:myAnnotation4];
	
	[annotations addObject:myAnnotation1];
	[annotations addObject:myAnnotation2];
	[annotations addObject:myAnnotation3];
	[annotations addObject:myAnnotation4];
	
	NSLog(@"%d",[annotations count]);
	//[self gotoLocation];//to catch perticular area on screen
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	// Walk the list of overlays and annotations and create a MKMapRect that
    // bounds all of them and store it into flyTo.
    MKMapRect flyTo = MKMapRectNull;
	for (id <MKAnnotation> annotation in annotations) {
		NSLog(@"fly to on");
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
        if (MKMapRectIsNull(flyTo)) {
            flyTo = pointRect;
        } else {
            flyTo = MKMapRectUnion(flyTo, pointRect);
			//NSLog(@"else-%@",annotationPoint.x);
        }
    }
    
    // Position the map so that all overlays and annotations are visible on screen.
    mapView.visibleMapRect = flyTo;
	
	
	
	UIBarButtonItem* temp=[[UIBarButtonItem alloc] init];
	temp.title=@"Back";
	self.navigationItem.backBarButtonItem=temp;
	[temp release];
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
	return ((interfaceOrientation == UIInterfaceOrientationPortrait) | UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight);
}
 


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


#pragma mark MKMapViewDelegate
/*
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    return [kml viewForOverlay:overlay];
}
*/
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
	NSLog(@"welcome into the map view annotation");
	
	// if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
	// try to dequeue an existing pin view first
	static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
	MKPinAnnotationView* pinView = [[[MKPinAnnotationView alloc]
									 initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier] autorelease];
	pinView.animatesDrop=YES;
	pinView.canShowCallout=YES;
	pinView.pinColor=MKPinAnnotationColorPurple;
	
	
	UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	[rightButton setTitle:annotation.title forState:UIControlStateNormal];
	[rightButton addTarget:self
					action:@selector(showDetails:)
		  forControlEvents:UIControlEventTouchUpInside];
	pinView.rightCalloutAccessoryView = rightButton;
	
	UIImageView *profileIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profile.png"]];
	pinView.leftCalloutAccessoryView = profileIconView;
	[profileIconView release];
	
	
	return pinView;
}

-(IBAction)showDetails:(id)sender{
    //Must load the view before the annotations update the label with the correct label text!
    [UIView beginAnimations:@"Curl Page Down" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
                           forView:self.view cache:YES];
    //Adjust the Subview by butting up to status bar
    self.userProfileVC.view.frame = CGRectMake(0, 0, 320, 480);
    //Add userProfileVC as a subview
    [self.view addSubview:userProfileVC.view];
    [UIView commitAnimations];
    
    NSLog(@"Annotation Click");
    self.userProfileVC.title=((UIButton*)sender).currentTitle;
    if([((UIButton*)sender).currentTitle isEqualToString:@"Peakirk Train Station"])
        self.userProfileVC.Label.text= @"Peakirk railway station served the parish of Peakirk in Cambridgeshire. The station building was converted into a private residence in the early 1990s. It is notable for having few external alterations, excluding a recent extension. Many of the original features are intact, though the platform and good yards have been removed and been replaced with housing.";
    else if([((UIButton*)sender).currentTitle isEqualToString:@"St. Pega's Church"])
        self.userProfileVC.Label.text= @"Pega belonged to one of the great noble families of Mercia, the daughter of Penwalh of Mercia. She and lived as an anchoress at Peakirk (Pega's church) in the modern county of Cambridgeshire, not far from Guthlac's hermitage at Crowland. When Guthlac realized that his end was near in 714, he invited her to his funeral. For this she sailed down the River Welland, curing a blind man from Wisbech on the way. She inherited Guthlac's psalter and scourge, both of which, it was claimed, she later gave to Crowland Abbey. She went on pilgrimage to Rome and died there c.719. Ordericus Vitalis claimed that her relics survived in an unnamed Roman church in his day, and that miracles took place there. It's said her heart was returned here and was kept as a reliquary in the church, contained in a heart stone the broken remains of which, smashed by Cromwell's troops, can be seen in the south aisle window. Her feast day is January 8.";
    else if([((UIButton*)sender).currentTitle isEqualToString:@"The Ruddy Duck"])
        self.userProfileVC.Label.text= @"Andy & Sue Ruddy welcome you to, The Ruddy Duck Public House and Restaurant! Situated in the quiet picturesque village of Peakirk, near Peterborough. The Ruddy Duck is a traditional English pub offering homemade food, served in our cosy bar or restaurant, real ales (Cask Marque approved) and a warm friendly atmosphere.";
    else if([((UIButton*)sender).currentTitle isEqualToString:@"Green Acres"])
        self.userProfileVC.Label.text= @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin porta justo sed lacus pulvinar, a fringilla tortor bibendum. Duis gravida suscipit ligula sit amet venenatis. Aenean eget turpis tristique, rutrum nisi id, condimentum tellus. Phasellus dapibus adipiscing ante, eget tempus diam. Ut auctor iaculis magna. Ut faucibus vel lacus eleifend mattis. Integer tincidunt tempus risus vitae laoreet. Ut eget pulvinar sapien, in placerat leo.";
    [self.navigationController pushViewController:self.userProfileVC animated:YES];
}
- (void)dealloc {
    [Label release];
    [super dealloc];
}
@end
