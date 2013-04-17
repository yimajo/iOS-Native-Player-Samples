//
//  BCVideo+SDKDictionaryHelper.m
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 4/4/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import "BCVideo+SDKDictionaryHelper.h"

NSString * const kBCSDKNameKey = @"name";
NSString * const kBCSDKVideoIdKey = @"videoID";
NSString * const kBCSDKReferenceIdKey = @"referenceID";
NSString * const kBCSDKShortDescriptionKey = @"shortDescription";
NSString * const kBCSDKVideoStillURLKey = @"videoStillURL";
NSString * const kBCSDKPubIdKey = @"pubID";
NSString * const kBCSDKDurationKey = @"duration";

@implementation BCVideo (SDKDictionaryHelper)

-(NSString *)getName
{
    return [self.properties objectForKey:kBCSDKNameKey];
}
-(NSString *)getVideoID
{
    return [self.properties objectForKey:kBCSDKVideoIdKey];
}
-(NSString *)getReferenceID
{
    return [self.properties objectForKey:kBCSDKReferenceIdKey];
}
-(NSString *)getShortDescription
{
    return [self.properties objectForKey:kBCSDKShortDescriptionKey];
}
-(NSURL *)getVideoStillURL
{
    return [self.properties objectForKey:kBCSDKVideoStillURLKey];
}
-(NSString *)getPubID
{
    return [self.properties objectForKey:kBCSDKPubIdKey];
}
-(NSNumber *)getDuration
{
    return [self.properties objectForKey:kBCSDKDurationKey];
}

@end
