//
//  SecondViewController.m
//  Dealz
//
//  Created by Keir SM on 2017-03-28.
//  Copyright © 2017 Keir SM. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface MapViewController (){
    CLLocationManager *myLocationManager;
}

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Create Location Manager
    myLocationManager = [[CLLocationManager alloc] init];
    //Request authorization to use location
    if ([myLocationManager respondsToSelector: @selector(requestWhenInUseAuthorization)]) {
        [myLocationManager requestWhenInUseAuthorization];
    }
    
    //Getting bounds of screen and setting the frame of the mapView to their values
    CGRect screen = [[UIScreen mainScreen] bounds];
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:screen ];
    
    //Choosing map type
    mapView.mapType = MKMapTypeStandard;
    //Enabling user location, scroll, and zoom.
    mapView.showsUserLocation = YES;
    mapView.scrollEnabled = "YES";
    mapView.zoomEnabled = "YES";
    //Set map delegate
    mapView.delegate = self;
    
    [self.view addSubview:mapView];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion mapRegion;
    //Center on userLocation
    mapRegion.center = mapView.userLocation.coordinate;
    //How much to zoom
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    
    [mapView setRegion:mapRegion animated: YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
