//
//  ViewController.m
//  iBeacons Jukebox
//
//  Created by John Clem on 3/26/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "ViewController.h"
#import "MDAudioFile.h"
#import "MDAudioPlayerController.h"

@interface ViewController ()

@property (nonatomic, strong) MDAudioPlayerController *audioPlayer;

@end

@implementation ViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
	_fileArray = [[NSMutableArray alloc] initWithObjects:
                 [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"],
				 [[NSBundle mainBundle] pathForResource:@"2" ofType:@"mp3"],
				 [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"], nil];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleBlackTranslucent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_fileArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
	cell.textLabel.text = [[NSString stringWithFormat:@"%@", [self.fileArray objectAtIndex:indexPath.row]] lastPathComponent];
	
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSMutableArray *songs = [[NSMutableArray alloc] init];
	
	for (NSString *song in _fileArray)
	{
		MDAudioFile *audioFile = [[MDAudioFile alloc] initWithPath:[NSURL fileURLWithPath:song]];
		[songs addObject:audioFile];
	}
	
	_audioPlayer = [[MDAudioPlayerController alloc] initWithSoundFiles:songs atPath:[[NSBundle mainBundle] bundlePath] andSelectedIndex:indexPath.row];
	[self presentViewController:_audioPlayer animated:YES completion:nil];
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



@end
