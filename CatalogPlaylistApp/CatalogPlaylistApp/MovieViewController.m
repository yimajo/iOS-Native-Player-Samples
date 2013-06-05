//
//  MovieViewController.m
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 2/11/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import "MovieViewController.h"
#import "BCEventLogger.h"
#import "BCVideo.h"
#import "BCQueuePlayer.h"
#import "BCEvent.h"
#import "BCQueueDisplay.h"
#import <AVFoundation/AVPlayer.h>

@interface MovieViewController ()

@property (nonatomic) BOOL flag;

@end

@implementation MovieViewController

- (void)dealloc
{
    [self.player.displayComponent.activePlayer removeObserver:self forKeyPath:@"allowsExternalPlayback"];
}

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
    self.navigationItem.title = [self.video.properties objectForKey:@"name"];
    
    //Play on player
    [self.player play];
    
    //allowsExternalPlaybackの変化をKVOで監視
    [self.player.displayComponent.activePlayer addObserver:self forKeyPath:@"allowsExternalPlayback" options:0 context:nil];

    if (self.player.displayComponent.activePlayer.allowsExternalPlayback == true) {
        //デフォルトYESなのでこちらを通る
        //http://developer.apple.com/library/ios/#documentation/AVFoundation/Reference/AVPlayer_Class/Reference/Reference.html
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"Test"
                                   message:@"YES"
                                  delegate:self
                         cancelButtonTitle:@"Check"
                         otherButtonTitles:nil];
        [alert show];
    } else {
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"Test"
                                   message:@"NO"
                                  delegate:self
                         cancelButtonTitle:@"Check"
                         otherButtonTitles:nil];
        [alert show];
        
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"func %s: object %@, changed keypath %@, change %@", __func__, object, keyPath, change);
}

@end
