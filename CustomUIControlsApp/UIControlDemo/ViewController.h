//
//  ViewController.h
//  UIControlDemo
//
//  Created by Tom Abbott on 1/30/13.
//  Copyright (c) 2013 Tom Abbott. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BCQueuePlayer;
@class CustomUIControls;

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) BCQueuePlayer *player;
@property (strong, nonatomic) CustomUIControls *controls;

- (void)configurePlayerWithVideo;

@end
