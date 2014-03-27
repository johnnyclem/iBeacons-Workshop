//
//  ALColorsViewController.m
//  AirLocate
//
//  Created by John Clem on 3/25/14.
//  Copyright (c) 2014 Apple. All rights reserved.
//

#import "ArtGalleryViewController.h"
#import "Painting.h"

#define ESTIMOTE_PROXIMITY_UUID [[NSUUID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"]

@interface ArtGalleryViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *paintingView;
@property (nonatomic, weak) IBOutlet UITextView *paintingInfoTextView;

@property (nonatomic, strong) NSMutableArray *beacons;
@property (nonatomic, strong) NSArray *paintings;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLBeaconRegion *beaconRegion;

@end

@implementation ArtGalleryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _beacons = [[NSMutableArray alloc] init];

    _paintings = @[[Painting monaLisa], [Painting lastSupper], [Painting starryNight]];

    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;

    _beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID
                                                       identifier:@"org.codefellows.artGallery"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [_locationManager startRangingBeaconsInRegion:_beaconRegion];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [_locationManager stopRangingBeaconsInRegion:_beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    if (beacons.count) {
        
        CLBeacon *closestBeacon;
        Painting *closestPainting;
        
        for (CLBeacon *beacon in beacons) {
            if (beacon.accuracy > 0) {
                closestBeacon = beacon;
                break;
            }
        }
        
        switch (closestBeacon.minor.integerValue) {
            case 48956:
                closestPainting = _paintings[0];
                break;
            case 48996:
                closestPainting = _paintings[1];
                break;
            case 5370:
                closestPainting = _paintings[2];
                break;
        }
        
        _paintingView.image         = closestPainting.image;
        _paintingInfoTextView.text  = closestPainting.text;

    }
    
}

@end
