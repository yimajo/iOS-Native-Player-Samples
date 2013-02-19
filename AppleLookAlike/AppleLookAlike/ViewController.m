//
//  ViewController.m
//  AppleLookAlike
//
//  Created by Tom Abbott on 2/12/13.
//  Copyright (c) 2013 Brightcove. All rights reserved.
//

#import "ViewController.h"
#import "BCEventLogger.h"
@interface ViewController ()
@property (strong, nonatomic) BCEventLogger *logger;
@end

@implementation ViewController

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
    player.view.frame = CGRectMake(0, 0, self.mainView.frame.size.width, self.mainView.frame.size.height);
    player.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.mainView addSubview:player.view];
    
    //Add UI Controls
    self.controls = [[AppleControls alloc] initWithEventEmitter:player.playbackEmitter view:self.mainView];
    //self.logger = [[BCEventLogger alloc] initWithEventEmitter:player.playbackEmitter];
    
    //Play on Player
    [player play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
