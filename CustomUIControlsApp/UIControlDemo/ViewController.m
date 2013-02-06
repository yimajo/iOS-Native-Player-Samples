//
//  ViewController.m
//  UIControlDemo
//
//  Created by Tom Abbott on 1/30/13.
//  Copyright (c) 2013 Tom Abbott. All rights reserved.
//

#import "ViewController.h"
#import "BCEventLogger.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize mainView;
@synthesize player;

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self initializePlayerWithVideo];
}

- (void)initializePlayerWithVideo{
    //Create a video from URL
    BCVideo *video = [BCVideo videoWithURL:[NSURL URLWithString:@"http://8806a5d9324faf9f31fb-31a5eb2af178214dc2ca6ce50f208bb5.iosr.cf1.rackcdn.com/sled_-_handmade_goods_1280x720.mp4"] properties:nil];
    
    //Initialize with a video
    player = [[BCQueuePlayer alloc] initWithVideo:video];
    
    //Add player to view
    player.view.frame = mainView.frame;
    player.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [mainView addSubview:player.view];
    
    //Add UI Controls
    self.controls = [[CustomUIControls alloc] initWithEventEmitter:player.playbackEmitter view:player.view];
    
    //Play on Player
    [player play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
