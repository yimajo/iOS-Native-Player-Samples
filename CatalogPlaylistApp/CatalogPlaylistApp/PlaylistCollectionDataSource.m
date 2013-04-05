//
//  PlaylistCollectionDataSource.m
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 2/7/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import "PlaylistCollectionDataSource.h"
#import "BCPlaylist.h"
#import "BCCatalog.h"
#import "BCVideo.h"
#import "BCError.h"

#import "BCVideo+SDKDictionaryHelper.h"

@implementation PlaylistCollectionDataSource

// TODO: move configuring to new method
-(id)initAndLoadPlaylist
{
    if(self = [super init])
    {
        //Let everyone know we are loading a playlist...
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PlaylistLoading" object:nil];
        
        /*
         * Initialize a BCCatalog from you read token (make sure it is the URL Access)
         * This can be found by going to https://videocloud.brightcove.com/admin/api
         */
        self.catalog = [[BCCatalog alloc] initWithToken:@"nFCuXstvl910WWpPnCeFlDTNrpXA5mXOO9GPkuTCoLKRyYpPF1ikig.."];
        
        //Options:
        NSDictionary *options = @{@"video.fields" : @"tags,cuePoints,geoFilterExclude"};
        
        /*
         * Find a playlist by ID, this ID can be found in the video cloud interface, or you could use a reference ID
         */
        [self.catalog findPlaylistByID:@"2149006311001" options:options callBlock:^(BCError *error, BCPlaylist *bcPlaylist) {
            
            if (!error)
            {
                //Save a reference to the playlist, and notify that the playlist is loaded!
                self.playlist = bcPlaylist;
                [[NSNotificationCenter defaultCenter] postNotificationName:@"PlaylistLoaded" object:self];
            }
            else
            {
                //We got an error - alert the user
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Can't load playlist :("
                                                                message:error.localizedDescription
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
        }];
    }
    
    return self;
}

#pragma mark Implementation methods for UIColllectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"videoCell" forIndexPath:indexPath];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    UILabel *title = (UILabel *)[cell viewWithTag:2];
    UILabel *duration = (UILabel *)[cell viewWithTag:3];
    
    BCVideo *video = [self.playlist.videos objectAtIndex:indexPath.item];
    
    //Title
    title.text = [video getName];
    
    //Duration
    NSNumber *videoDuration = [video getDuration];
    duration.text = [self makeReadable:videoDuration];
    
    //Image
    NSURL *videoStill = [video getVideoStillURL];
    NSData *image = [[NSData alloc] initWithContentsOfURL:videoStill];
    imageView.image = [[UIImage alloc] initWithData:image];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.playlist.count;
}

#pragma mark Utility methods

/**
 * Utility method to take a number in milliseconds and make it readable
 */
-(NSString *)makeReadable:(NSNumber *)number
{
    long time = number.longValue;
    if (time < 1)
    {
        return @"00:00";
    }
    
    NSInteger hours = floor(time / 60.0f / 60.0f / 1000.0f);
    NSInteger minutes = (NSInteger)(time / 60 / 1000.0f) % 60;
    NSInteger seconds = (NSInteger)(time / 1000.0f) % 60;
    
    NSString *ret;
    if (hours > 0)
    {
        ret = [NSString stringWithFormat:@"%d:%.2d:%.2d", hours, minutes, seconds];
    }
    else
    {
        ret = [NSString stringWithFormat:@"%.2d:%.2d", minutes, seconds];
    }
    
    return ret;

}
@end
