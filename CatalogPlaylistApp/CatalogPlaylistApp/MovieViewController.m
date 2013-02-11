//
//  MovieViewController.m
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 2/11/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import "MovieViewController.h"
#import "BCEventLogger.h"
@interface MovieViewController ()
@property (strong, nonatomic) BCEventLogger* logger;
@end

@implementation MovieViewController

@synthesize video;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.player = [[BCQueuePlayer alloc] initWithVideo:self.video];
    self.player.view.frame = self.playerView.frame;
    self.player.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    
    [self.playerView addSubview:self.player.view];
    
    //Logging
    self.logger = [[BCEventLogger alloc] initWithEventEmitter:self.player.playbackEmitter];
    //Play on player
    [self.player play];
	 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
