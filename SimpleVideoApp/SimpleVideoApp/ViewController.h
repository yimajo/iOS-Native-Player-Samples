//
//  ViewController.h
//  SimpleVideoApp
//
//  Created by Tom Abbott on 1/24/13.
//  Copyright (c) 2013 Tom Abbott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCVideo.h"
#import "BCQueuePlayer.h"
#import "BCUIControls.h"
#import "BCPlaylist.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UIView *playerView;
@property (strong, nonatomic) IBOutlet UIView *controlView;
@property (strong, nonatomic) BCQueuePlayer *player;
@property (strong, nonatomic) BCUIControls *controls;

- (void) initializePlayer:(NSArray *)videos;

@end
