//
//  PlaylistCollectionDataSource.m
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 2/7/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import "PlaylistCollectionDataSource.h"

@implementation PlaylistCollectionDataSource

@synthesize playlist;

-(id)initAndLoadPlaylist{
    if(self = [super init]){
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PlaylistLoading" object:self];
        
        self.catalog = [[BCCatalog alloc] initWithToken:@"nFCuXstvl910WWpPnCeFlDTNrpXA5mXOO9GPkuTCoLKRyYpPF1ikig.."];
        
        [self.catalog findPlaylistByID:@"2149006311001" options:nil callBlock:^(BCError *error, BCPlaylist *bcPlaylist) {
            if(!error){
                playlist = bcPlaylist;
                [[NSNotificationCenter defaultCenter] postNotificationName:@"PlaylistLoaded" object:self];
            }else{
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }
    return self;
}

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
    
    BCVideo *video = [playlist.videos objectAtIndex:indexPath.item];
    //Title
    title.text = [video.properties objectForKey:@"name"];
    //Duration
    NSNumber *videoDuration = [video.properties objectForKey:@"duration"];
    duration.text = [self makeReadable:videoDuration];
    //Image
    NSURL *videoStill = [video.properties objectForKey:@"videoStillURL"];
    NSData *image = [[NSData alloc] initWithContentsOfURL:videoStill];
    imageView.image = [[UIImage alloc] initWithData:image];
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return playlist.count;
}
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
    
    NSString *ret = nil;
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
