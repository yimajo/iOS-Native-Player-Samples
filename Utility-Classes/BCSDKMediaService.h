//
//  BCSDKMediaService.h
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 4/11/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import "BCMediaService.h"

/**
 * A custom SDK Media Service to handle the
 * additional values coming back from the media API
 */
@interface BCSDKMediaService : BCMediaService

/**
 * We are overriding makeVideoWithJSON to handle any
 * additional media API fields we want to set on the
 * video properties
 */
-(BCVideo *)makeVideoWithJSON:(NSDictionary *)json;

@end
