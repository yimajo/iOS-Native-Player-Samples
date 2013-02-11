//
//  MovieViewController.h
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 2/11/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCVideo.h"
#import "BCQueuePlayer.h"

@interface MovieViewController : UIViewController

@property (nonatomic, strong) BCVideo *video;
@property (nonatomic, strong) BCQueuePlayer *player;
@property (strong, nonatomic) IBOutlet UIView *playerView;

@end
