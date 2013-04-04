//
//  ViewController.h
//  LoadingIndicatorSampleApp
//
//  Created by Tom Abbott on 4/2/13.
//  Copyright (c) 2013 Brightcove. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BCQueuePlayer;
@class BCUIControls;
@class BCEventLogger;
@class BCSDKActivityIndicator;

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *playerView;
@property (strong, nonatomic) IBOutlet UIView *controlView;

@property (strong, nonatomic) BCQueuePlayer *player;
@property (strong, nonatomic) BCUIControls *controls;
@property (strong, nonatomic) BCEventLogger *logger;
@property (strong, nonatomic) BCSDKActivityIndicator *activityIndicator;

- (void) configurePlayer:(NSArray *)videos;

@end