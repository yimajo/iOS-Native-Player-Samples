//
//  MovieViewController.m
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 2/11/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import "MovieViewController.h"
#import "BCEventLogger.h"

@implementation MovieViewController

@synthesize video;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Initize Player
    self.player = [[BCQueuePlayer alloc] initWithVideo:self.video];
    
    //Size the player
    self.player.view.frame = self.playerView.frame;
    self.player.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.playerView addSubview:self.player.view];
    
    //Set the nav bar title
    self.navigationItem.title = [video.properties objectForKey:@"name"];
    
    //Play on player
    [self.player play];
	 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
