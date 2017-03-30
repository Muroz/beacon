//
//  ViewController.h
//  beacons
//
//  Created by Diego Zuluaga on 2017-03-27.
//  Copyright © 2017 Diego Zuluaga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
//@property (strong, nonatomic) CLBeaconRegion *myBeaconRegion;
//@property (strong, nonatomic) CLLocationManager *locationManager;

@end

