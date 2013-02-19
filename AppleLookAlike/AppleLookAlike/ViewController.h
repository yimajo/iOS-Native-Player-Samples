//
//  ViewController.h
//  AppleLookAlike
//
//  Created by Tom Abbott on 2/12/13.
//  Copyright (c) 2013 Brightcove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCQueuePlayer.h"
#import "BCVideo.h"
#import "AppleControls.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) BCQueuePlayer *player;
@property (strong, nonatomic) BCVideo *video;
@property (strong, nonatomic) AppleControls *controls;
@end
