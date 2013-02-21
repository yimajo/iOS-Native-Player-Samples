//
//  ViewController.m
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 2/6/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import "ViewController.h"
#import "PlaylistCollectionDataSource.h"
#import "MovieViewController.h"
#import "BCPlaylist.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // TODO: remove in dealloc 'namespace'
    //Set up notifications for understanding when the datasource is loaded
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishLoadingPlaylist:) name:@"PlaylistLoaded" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showSpinner:) name:@"PlaylistLoading" object:nil];
    
    //Load Playlist
    self.dataSource = [[PlaylistCollectionDataSource alloc] initAndLoadPlaylist];
}

/**
 * When the playlist is loaded, set the data source of the collection view
 */
- (void)finishLoadingPlaylist:(NSNotification *)notification
{
    if ([[notification name] isEqualToString:@"PlaylistLoaded"])
    {
        self.playlistView.dataSource = self.dataSource;
        [self hideSpinner];
    }
}

/**
 * Utility method to create/show the spinner
 */
- (void)showSpinner:(NSNotification *)notification
{
    if (!self.spinner)
    {
        self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.spinner.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
        [self.view addSubview:self.spinner];
    }
    
    [self.spinner startAnimating];
}

/**
 * Utility method to hide the spinner
 */

- (void)hideSpinner
{
    if (self.spinner)
    {
        [self.spinner stopAnimating];
    }
}

/**
 * Prepare to transfer to the next View Controller by setting the selected movie
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showMovie"])
    {
        //Get the video from selected index
        NSIndexPath *selectedIndex = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        BCPlaylist *playlist = [(PlaylistCollectionDataSource *) self.collectionView.dataSource playlist];
        BCVideo *video = [playlist.videos objectAtIndex:selectedIndex.item];
        
        //Set the video for the next VC
        MovieViewController *mvc = [segue destinationViewController];
        mvc.video = video;
    }
}

@end
