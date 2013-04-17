//
//  BCVideo+SDKDictionaryHelper.h
//  CatalogPlaylistApp
//
//  Created by Tom Abbott on 4/4/13.
//  Copyright (c) 2013 brightcove. All rights reserved.
//

#import "BCVideo.h"

extern NSString * const kBCSDKNameKey;
extern NSString * const kBCSDKVideoIdKey;
extern NSString * const kBCSDKReferenceIdKey;
extern NSString * const kBCSDKShortDescriptionKey;
extern NSString * const kBCSDKVideoStillURLKey;
extern NSString * const kBCSDKPubIdKey;
extern NSString * const kBCSDKDurationKey;

@interface BCVideo (SDKDictionaryHelper)

-(NSString *)getName;
-(NSString *)getVideoID;
-(NSString *)getReferenceID;
-(NSString *)getShortDescription;
-(NSURL *)getVideoStillURL;
-(NSString *)getPubID;
-(NSNumber *)getDuration;

@end
