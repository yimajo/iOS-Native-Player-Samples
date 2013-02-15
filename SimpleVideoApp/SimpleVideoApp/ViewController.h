//
//  ViewController.h
//  SimpleVideoApp
//
//  Created by Tom Abbott on 1/24/13.
//  Copyright (c) 2013 Tom Abbott. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BCQueuePlayer;
@class BCUIControls;

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *playerView;
@property (strong, nonatomic) IBOutlet UIView *controlView;
@property (strong, nonatomic) BCQueuePlayer *player;
@property (strong, nonatomic) BCUIControls *controls;

- (void) configurePlayer:(NSArray *)videos;

@end
