//
//  ViewController.m
//  Be The Beacon
//
//  Created by John Clem on 3/25/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#define THE_EASY_UUID [[NSUUID alloc] initWithUUIDString:@"46003A0A-862B-40C4-9C5F-D1F43FF7E9BB"]
#define CODE_FELLOWS_REGION_ID @"org.codefellows.the_easy"

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize the beacon region
    _myBeaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:THE_EASY_UUID
                                                         identifier:CODE_FELLOWS_REGION_ID];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _startButton.titleLabel.text = @"Start";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleBroadcast:(id)sender
{
    // Get the beacon data to advertise
    _myBeaconData = [_myBeaconRegion peripheralDataWithMeasuredPower:nil];
    
    // Start the peripheral manager
    _peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                                 queue:nil
                                                               options:nil];
    
}

#pragma mark - CBPeripheralManagerDelegate

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager*)peripheral
{
    UIColor *nextColor;
    
    if (peripheral.state == CBPeripheralManagerStatePoweredOn)
    {
        // Bluetooth is on
        nextColor = [UIColor colorWithRed:102.f/255.f green:204.f/255.f blue:153.f/255.f alpha:1.f];
        // Update our status label
        self.statusLabel.text = @"Broadcasting...";
        self.startButton.titleLabel.text = @"Stop";
        // Start broadcasting
        [self.peripheralManager startAdvertising:self.myBeaconData];
    }
    else if (peripheral.state == CBPeripheralManagerStatePoweredOff)
    {
        nextColor = [UIColor colorWithRed:204.f/255.f green:114.f/255.f blue:103.f/255.f alpha:1.f];

        // Update our status label
        self.statusLabel.text = @"Stopped";
        self.startButton.titleLabel.text = @"Start";
        // Bluetooth isn't on. Stop broadcasting
        [self.peripheralManager stopAdvertising];
    }
    else if (peripheral.state == CBPeripheralManagerStateUnsupported)
    {
        nextColor = [UIColor darkGrayColor];
        self.statusLabel.text = @"Unsupported Device";
        self.startButton.titleLabel.text = @"Disabled";
    }
    
    [UIView animateWithDuration:0.4 animations:^{
        self.view.backgroundColor = nextColor;
    }];
}

@end
