//
//  BCSDKCatalog.m
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 4/11/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import "BCSDKCatalog.h"
#import "BCSDKMediaService.h"
#import "BCEvent.h"

@implementation BCSDKCatalog

- (id)initWithToken:(NSString *)token baseURL:(NSString *)baseURL
{
    if(self = [super initWithToken:token baseURL:baseURL])
    {
        [self setValue:[[BCSDKMediaService alloc]
                        initWithEventEmitter:emitter token:token baseURL:baseURL] forKey:@"mediaService"];
    }
    return self;
}

@end
