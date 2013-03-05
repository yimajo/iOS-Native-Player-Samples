//
//  ViewController.h
//  AppleLookAlike
//
//  Created by Tom Abbott on 2/12/13.
//  Copyright (c) 2013 Brightcove. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCQueuePlayer;
@class BCVideo;
@class EmulatedControls;

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) BCQueuePlayer *player;
@property (strong, nonatomic) BCVideo *video;
@property (strong, nonatomic) EmulatedControls *controls;

@end
