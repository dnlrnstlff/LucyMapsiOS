//
//  RootViewController.h
//  LUCY MAP FRAMEWORK
//
//  Created by Daniel-Ernest Luff.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "UserProfileVC.h"

@interface RootViewController : UIViewController<MKMapViewDelegate> {
	
	IBOutlet MKMapView* mapView;
	IBOutlet UserProfileVC* userProfileVC;
    IBOutlet UILabel *Label;
    
	
}
@property(nonatomic,retain)	IBOutlet MKMapView* mapView;
@property(nonatomic,retain) IBOutlet UserProfileVC* userProfileVC;
@property(nonatomic,retain) IBOutlet UILabel *Label;
@property (nonatomic, readonly) CLLocationCoordinate2D *coordinate;
@end
