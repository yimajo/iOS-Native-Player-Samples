//
//  ViewController.m
//  SimpleVideoApp
//
//  Created by Tom Abbott on 1/24/13.
//  Copyright (c) 2013 Tom Abbott. All rights reserved.
//

#import "ViewController.h"
#import "BCVideo.h"
#import "BCQueuePlayer.h"
#import "BCUIControls.h"
#import "BCPlaylist.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Array to hold our videos
    NSArray *videos;
    
    //MP4 Video
    BCVideo *mp4Video = [BCVideo videoWithURL:[NSURL URLWithString:@"http://cf9c36303a9981e3e8cc-31a5eb2af178214dc2ca6ce50f208bb5.r97.cf1.rackcdn.com/bigger_badminton_600.mp4"] properties:nil];
    
    //MOV Video
    BCVideo *movVideo = [BCVideo videoWithURL:[NSURL URLWithString:@"http://cf9c36303a9981e3e8cc-31a5eb2af178214dc2ca6ce50f208bb5.r97.cf1.rackcdn.com/craigslistjoe-tlr1_h480p.mov"] properties:nil];
    
    //HLS Video
    BCVideo *hlsVideo = [BCVideo videoWithURL:[NSURL URLWithString:@"http://bcoveliveios-i.akamaihd.net/hls/live/205917/zprodwindow24h/master.m3u8"] properties:nil];
    
    videos = [NSArray arrayWithObjects:
              mp4Video,
              movVideo,
              hlsVideo,
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
    
    //Play on Player
    [self.player play];
    
}

@end
