//
//  ViewController.m
//  SimpleVideoApp
//
//  Created by Tom Abbott on 1/24/13.
//  Copyright (c) 2013 Tom Abbott. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize mainView;
@synthesize playerView;
@synthesize controlView;
@synthesize player;
@synthesize controls;

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
    BCVideo *hlsVideo = [BCVideo videoWithURL:[NSURL URLWithString:@"http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"] properties:nil];
    
    videos = [NSArray arrayWithObjects:mp4Video, movVideo, hlsVideo, nil];
    
    [self initializePlayer:videos];
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
}

-(void)initializePlayer:(NSArray *)videos
{
    //Create a playlist
    BCPlaylist *playlist = [[BCPlaylist alloc] initWithVideos:videos];
    
    //Initialize with a playlist
    player = [[BCQueuePlayer alloc] initWithPlaylist:playlist];

    //Add player to view
    player.view.frame = playerView.frame;
    player.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [playerView addSubview:player.view];
    
    //Add UI Controls
    controls  = [[BCUIControls alloc] initWithEventEmitter:player.playbackEmitter andView:controlView];
    
    //Play on Player
    [player play];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
