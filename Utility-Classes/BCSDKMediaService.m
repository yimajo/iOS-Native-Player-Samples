//
//  BCSDKMediaService.m
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 4/11/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import "BCSDKMediaService.h"
#import "BCVideo.h"
#import "BCEvent.h"

@implementation BCSDKMediaService

-(BCVideo *)makeVideoWithJSON:(NSDictionary *)json
{
    //To streamline the creation of the video, we want super to create it first
    BCVideo *video = [super makeVideoWithJSON:json];
    
    //Initialize new properties based on the existing video properties
    NSMutableDictionary *properties = [[NSMutableDictionary alloc] initWithDictionary:video.properties];
    
    //This is where we can populate any other parameter for the video object, for example we can add longDescription
    if ([json objectForKey:@"longDescription"] && ![[json objectForKey:@"longDescription"] isEqual:[NSNull null]]) {
        [properties setValue:[json objectForKey:@"longDescription"] forKey:@"longDescription"];
    }
    
    //Return a newly created video with the new properties
    return [[BCVideo alloc] initWithRenditionSets:video.renditionSets properties:properties];
}

@end
