//
//  ViewController.m
//  LoadingIndicatorSampleApp
//
//  Created by Tom Abbott on 4/2/13.
//  Copyright (c) 2013 Brightcove. All rights reserved.
//

#import "ViewController.h"
#import "BCVideo.h"
#import "BCQueuePlayer.h"
#import "BCUIControls.h"
#import "BCPlaylist.h"
#import "BCEventLogger.h"
#import "BCEvent.h"
#import "BCSDKActivityIndicator.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Array to hold our videos
    NSArray *videos;
    
    //MOV Video
    BCVideo *movVideo = [BCVideo videoWithURL:[NSURL URLWithString:@"http://cf9c36303a9981e3e8cc-31a5eb2af178214dc2ca6ce50f208bb5.r97.cf1.rackcdn.com/craigslistjoe-tlr1_h480p.mov"] properties:nil];
    
    videos = [NSArray arrayWithObjects:
              movVideo,
              nil];
    
    [self configurePlayer:videos];
    
}

- (void)configurePlayer:(NSArray *)videos
{
    //Create a playlist
    BCPlaylist *playlist = [[BCPlaylist alloc] initWithVideos:videos];
    
    //Initialize with a playlist
    self.player = [[BCQueuePlayer alloc] initWithPlaylist:playlist];
    
    //Add player to view
    self.player.view.frame = self.playerView.frame;
    self.player.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.playerView addSubview:self.player.view];
    
    //Add UI Controls
    self.controls  = [[BCUIControls alloc] initWithEventEmitter:self.player.playbackEmitter andView:self.controlView];
    self.logger = [[BCEventLogger alloc] initWithEventEmitter:self.player.playbackEmitter];
    self.activityIndicator = [[BCSDKActivityIndicator alloc] initWithEventEmitter:self.player.playbackEmitter andView:self.playerView];
    
    //Play on Player
    //[self.player play];
    
}

@end
