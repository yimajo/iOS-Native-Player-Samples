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

@implementation MovieViewController


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
    
    ////////////////////////////////////////////////////
    //AirPlayが有効かどうかをairPlayVideoActiveメソッドを実行して判断
    ////////////////////////////////////////////////////
    //
    //[self.player airPlayVideoActive];
    //
    //airPlayVideoActiveメソッドは例外が発生し正常に実行できない。例外は下記
    //2013-05-23 11:26:41.762 CatalogPlaylistApp[229:907] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[BCQueueDisplay airPlayVideoActive]: unrecognized selector sent to instance 0x1d574b40'
    ////////////////////////////////////////////////////
    
    ////////////////////////////////////////////////////
    //AirPlayが有効かどうかをBCEventEnableAirPlayイベントを取得し判断
    ////////////////////////////////////////////////////
    [self.player.playbackEmitter on:BCEventEnableAirPlay callBlock:^(BCEvent *event) {
        NSLog(@"BCEventEnableAirPlayは実行される?");
    }];
    ////////////////////////////////////////////////////
}

@end
