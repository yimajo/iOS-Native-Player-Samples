//
//  ViewController.h
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 2/6/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaylistCollectionDataSource.h"
#import "MovieViewController.h"

@interface ViewController : UICollectionViewController

@property (strong, nonatomic) UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UICollectionView *playlistView;
@property (strong, nonatomic) PlaylistCollectionDataSource *dataSource;

- (void)finishLoadingPlaylist:(NSNotification *)notification;

@end
