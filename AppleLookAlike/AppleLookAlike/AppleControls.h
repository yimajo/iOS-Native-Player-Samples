//
//  AppleControls.h
//  AppleLookAlike
//
//  Created by Tom Abbott on 2/12/13.
//  Copyright (c) 2013 Brightcove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "BCComponent.h"
#import "BCEvent.h"
#import "BCEventEmitter.h"
#import "BCRegisteringEventEmitter.h"
#import "VideoUtils.h"

@interface AppleControls : BCComponent

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UIView *controlsView;

@property (strong, nonatomic) IBOutlet UIToolbar *bottomToolbar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *playPauseButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *skipBackwardsButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *skipForwardButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *resizeButton;
@property (strong, nonatomic) IBOutlet UISlider *volumeSlider;


- (IBAction)playPauseButtonPressed:(id)sender;
- (IBAction)skipForwardButtonPressed:(id)sender;
- (IBAction)skipBackwardsButtonPressed:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;
- (IBAction)resizeButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UIToolbar *topToolbar;

@property (strong, nonatomic) UIBarButtonItem *doneButton;
@property (strong, nonatomic) UIBarButtonItem *ratioButton;
@property (strong, nonatomic) UILabel *timePlayed;
@property (strong, nonatomic) UILabel *timeLeft;
@property (strong, nonatomic) UISlider *scrubber;
@property (nonatomic) bool isPaused;
@property (nonatomic) bool isScrubbing;
@property (assign, nonatomic) CMTime duration;
@property (strong, nonatomic) NSTimer *timer;

- (id)initWithEventEmitter:(BCEventEmitter *)eventEmitter view:(UIView *)view;
- (void) applyTextStyles:(UILabel *)label;
- (void) handleTimer;
@end
