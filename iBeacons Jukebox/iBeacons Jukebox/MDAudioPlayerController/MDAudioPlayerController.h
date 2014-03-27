//
//  AudioPlayer.h
//  MobileTheatre
//
//  Created by Matt Donnelly on 27/03/2010.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
#import "MDAudioFile.h"

#define FOUR_INCH_SCREEN  ([[UIScreen mainScreen] bounds].size.height == 568)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

@protocol MDAudioPlayerControllerDelegate;

@interface MDAudioPlayerController : UIViewController <AVAudioPlayerDelegate, UITableViewDelegate, UITableViewDataSource>
{
	NSMutableArray		*soundFiles;
	NSString			*soundFilesPath;
	NSUInteger			selectedIndex;
	
	AVAudioPlayer		*player;
	
	CAGradientLayer		*gradientLayer;
	
	UIButton			*playButton;
	UIButton			*pauseButton;
	UIButton			*nextButton;
	UIButton			*previousButton;
	UIButton			*toggleButton;
	UIButton			*repeatButton;
	UIButton			*shuffleButton;
	UILabel				*currentTime;
	UILabel				*duration;
	UILabel				*titleLabel;
	UILabel				*artistLabel;
	UILabel				*albumLabel;
	UILabel				*indexLabel;
	UISlider			*volumeSlider;
	UISlider			*progressSlider;
	
	UITableView			*songTableView;
	
	UIButton			*artworkView;
	UIImageView			*reflectionView;
	UIView				*containerView;
	UIView				*overlayView;
	
	NSTimer				*updateTimer;
	
	BOOL				interrupted;
	BOOL				repeatAll;
	BOOL				repeatOne;
	BOOL				shuffle;
}

@property (nonatomic, weak)  id <MDAudioPlayerControllerDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *soundFiles;
@property (nonatomic, strong) NSString *soundFilesPath;

@property (nonatomic, strong) AVAudioPlayer *player;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *pauseButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *previousButton;
@property (nonatomic, strong) UIButton *toggleButton;
@property (nonatomic, strong) UIButton *repeatButton;
@property (nonatomic, strong) UIButton *shuffleButton;

@property (nonatomic, strong) UILabel *currentTime;
@property (nonatomic, strong) UILabel *duration;
@property (nonatomic, strong) UILabel *indexLabel;;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *artistLabel;
@property (nonatomic, strong) UILabel *albumLabel;

@property (nonatomic, strong) UISlider *volumeSlider;
@property (nonatomic, strong) UISlider *progressSlider;

@property (nonatomic, strong) UITableView *songTableView;

@property (nonatomic, strong) UIButton *artworkView;
@property (nonatomic, strong) UIImageView *reflectionView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *overlayView;

@property (nonatomic, strong) NSTimer *updateTimer;

@property (nonatomic, assign) BOOL interrupted;
@property (nonatomic, assign) BOOL repeatAll;
@property (nonatomic, assign) BOOL repeatOne;
@property (nonatomic, assign) BOOL shuffle;

- (MDAudioPlayerController *)initWithSoundFiles:(NSMutableArray *)songs atPath:(NSString *)path andSelectedIndex:(int)index;
- (void)dismissAudioPlayer;
- (void)showSongFiles;
- (void)showOverlayView;

- (BOOL)canGoToNextTrack;
- (BOOL)canGoToPreviousTrack;

- (void)play;
- (void)previous;
- (void)next;
- (void)volumeSliderMoved:(UISlider*)sender;
- (IBAction)progressSliderMoved:(UISlider*)sender;

- (void)toggleShuffle;
- (void)toggleRepeat;

@end


@protocol MDAudioPlayerControllerDelegate <NSObject>
@required
@optional
- (void) audioPlayer:(MDAudioPlayerController*)player
     didBeginPlaying:(MDAudioFile*)audio;

- (void) audioPlayer:(MDAudioPlayerController*)player
      didStopPlaying:(MDAudioFile*)audio;

- (void) audioPlayerDidClose:(MDAudioPlayerController*)player;
@end