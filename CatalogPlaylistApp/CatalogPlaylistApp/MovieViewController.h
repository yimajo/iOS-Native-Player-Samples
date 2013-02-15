//
//  MovieViewController.h
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 2/11/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCVideo;
@class BCQueuePlayer;

@interface MovieViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *playerView;

@property (nonatomic, strong) BCVideo *video;
@property (nonatomic, strong) BCQueuePlayer *player;

@end
