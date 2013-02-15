//
//  CustomUIControls.h
//  CustomUIControlsApp
//
//  Created by Tom Abbott on 1/30/13.
//  Copyright (c) 2013 Tom Abbott. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import "BCComponent.h"

//Utility macro for converting from Hex to UIColor
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface CustomUIControls : BCComponent

//Top level view of the control
@property (strong, nonatomic) IBOutlet UIView *controlsView;

//Buttons
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *pauseButton;

//Other UI Components
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@property (strong, nonatomic) IBOutlet UILabel *durationLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (assign, nonatomic) CMTime duration;
@property (strong, nonatomic) UIColor *masterColor;

//Actions for the buttons
- (IBAction)playButtonTouchUpInside:(id)sender;
- (IBAction)pauseButtonTouchUpInside:(id)sender;

//Custom init
- (id)initWithEventEmitter:(BCEventEmitter *)eventEmitter view:(UIView *)view;

//Initialization for drawing the control view
- (void)configureControlView:(UIView *)view;

@end
