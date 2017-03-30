//
//  ViewController.m
//  beacons
//
//  Created by Diego Zuluaga on 2017-03-27.
//  Copyright © 2017 Diego Zuluaga. All rights reserved.
//

//#import "ViewController.h"
//@interface ViewController ()

//#define proximityUUID  @"B5B182C7-EAB1-4988-AA99-B5C1517OO8D9"

//@end

//@implementation ViewController

//- (void)viewDidLoad {
   // [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //initialize location manager and set ourselves as the delegate
 //   self.locationManager = [[CLLocationManager alloc] init];
 //   self.locationManager.delegate = self;
    
   // if (IS_IOS_8)
     //   [self.locationManager requestAlwaysAuthorization];
    
    //create a NSUUID with the same UUID as the broadcasting beacon
//    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"B5B182C7-EAB1-4988-AA99-B5C1517OO8D9"];
    
    //Setup a new region with that UUID and same identifier as the broadcasting beacon
    //self.myBeaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"HMSensors" ];
//    self.myBeaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:proximityUUID identifier:@"HMSensors"];
    
    //Tell location manager to start monitoring for the beacon region
//    [self.locationManager startMonitoringForRegion:self.myBeaconRegion];
//    [self.locationManager startRangingBeaconsInRegion:(CLBeaconRegion *)self.myBeaconRegion];
//}


//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
//}

//-(void) locationManager:(CLLocationManager *)manager didEnterRegion:(nonnull CLRegion *)region{
//    NSLog(@"its working");
    //[self.locationManager startRangingBeaconsInRegion:self.myBeaconRegion];
//    NSLog(@"Entering %@", region.identifier);
//}

//-(void) locationManager: (CLLocationManager*) manager didExitRegion:(nonnull CLRegion *)region{
//     NSLog(@"Exiting %@", region.identifier);
//    [self.locationManager stopRangingBeaconsInRegion:self.myBeaconRegion];
//    self.statusLabel.text = @"No";
//}

//-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(nonnull NSArray<CLBeacon *> *)beacons inRegion:(nonnull CLBeaconRegion *)region {
    //beacon found
 //   self.statusLabel.text = @"beacon found!";
    
    //CLBeacon *foundBeacon = [beacons firstObject];
 //   NSLog(@"FOUND");
    //if ([beacons count] > 0)
   // {
     //   CLBeacon *aBeacon = [beacons firstObject];
       // self.statusLabel.text = [aBeacon.proximityUUID UUIDString];
       // NSString *tmpString = @"";
       // for (aBeacon in beacons)
       // {
           // int major = [aBeacon.major intValue];
         //   int minor = [aBeacon.minor intValue];
          //  int rssi = (int)aBeacon.rssi;
          //  NSLog(@"%@", aBeacon);
           // tmpString = [tmpString stringByAppendingFormat:@"%15d%15d%15d\n", major, minor, rssi];
       // }
        //self.outputTextView.text = tmpString;
    //}

    //you can retrieve the beacon data from its properties
    // NSString *uuid = foundBeacon.proximity.UUID.UUIDString;
//}
//@end


#import "ViewController.h"
#define myUUID  @"B5B182C7-EAB1-4988-AA99-B5C1517008D9"
//@"74278BDA-B644-4520-8F0C-720EAF059935"

@interface ViewController ()

@property (strong, nonatomic) CLLocationManager *locManager;
@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (weak, nonatomic) IBOutlet UILabel *outputTextView;

@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Custom initialization
    self.locManager = [[CLLocationManager alloc] init];
    self.locManager.delegate = self;
   // if (IS_IOS_8)
     //   [self.locManager requestAlwaysAuthorization];
    // UUID_ESTIMOTE or UUID_HMSENSOR
    NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString:@"B5B182C7-EAB1-4988-AA99-B5C1517008D9"];
    NSLog(@"%@",proximityUUID);
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:proximityUUID identifier:@"HMSensors"];
    [self.locManager startMonitoringForRegion:self.beaconRegion];
    [self.locManager startRangingBeaconsInRegion:(CLBeaconRegion *)self.beaconRegion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark <CLLocationManagerDelegate>

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    NSLog(@"Entering %@", region.identifier);
    //    [self.locManager startRangingBeaconsInRegion:(CLBeaconRegion *)region];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    NSLog(@"Exiting %@", region.identifier);
    [self.locManager stopRangingBeaconsInRegion:(CLBeaconRegion *)region];
    self.statusLabel.text = @"n/a";
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    NSLog(@"found something");
    if ([beacons count] > 0)
    {
        CLBeacon *aBeacon = [beacons firstObject];
        self.statusLabel.text = [aBeacon.proximityUUID UUIDString];
        NSString *tmpString = @"";
        for (aBeacon in beacons)
        {
            int major = [aBeacon.major intValue];
            int minor = [aBeacon.minor intValue];
            int rssi = (int)aBeacon.rssi;
            NSLog(@"%@", aBeacon);
            tmpString = [tmpString stringByAppendingFormat:@"%15d%15d%15d\n", major, minor, rssi];
        }
        self.outputTextView.text = tmpString;
    }
}
@end
