//
//  ViewController.m
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 2/6/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Set up to recieve a notification when the playlist loads
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishLoadingPlaylist:) name:@"PlaylistLoaded" object:nil];
    self.dataSource = [[PlaylistCollectionDataSource alloc] initAndLoadPlaylist];
}

-(void)finishLoadingPlaylist:(NSNotification *)notification
{
    if([[notification name] isEqualToString:@"PlaylistLoaded"]){
        self.playlistView.dataSource = self.dataSource;
    }
}

- (void)showSpinner
{
    if(!self.spinner){
        self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.view addSubview:self.spinner];
    }
    [self.spinner startAnimating];
}

- (void)hideSpinner
{
    if(self.spinner){
        [self.spinner stopAnimating];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"showMovie"]){
        NSIndexPath *selectedIndex = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        BCPlaylist *playlist = [(PlaylistCollectionDataSource *) self.collectionView.dataSource playlist];
        BCVideo *video = [playlist.videos objectAtIndex:selectedIndex.item];
        
        MovieViewController *mvc = [segue destinationViewController];
        mvc.video = video;
    }
}

@end
