//
//  ViewController.h
//  UIControlDemo
//
//  Created by Tom Abbott on 1/30/13.
//  Copyright (c) 2013 Tom Abbott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCVideo.h"
#import "BCQueuePlayer.h"
#import "CustomUIControls.h"


@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) BCQueuePlayer *player;
@property (strong, nonatomic) CustomUIControls *controls;

- (void)initializePlayerWithVideo;

@end
