//
//  BCSDKActivityIndicator.m
//  LoadingIndicatorSampleApp
//
//  Created by Tom Abbott on 4/2/13.
//  Copyright (c) 2013 Brightcove. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>

#import "BCSDKActivityIndicator.h"
#import "BCRegisteringEventEmitter.h"
#import "BCEvent.h"

@implementation BCSDKActivityIndicator

/**
 *For initialization, we need to can super and then set up the spinner
 *and add it to the view.
 *
 */
-(id)initWithEventEmitter:(id<BCEventEmitterProtocol>)eventEmitter andView:(UIView *)view
{
    //Call super, to handle the initialization of the component
    if(self = [super initWithEventEmitter:eventEmitter])
    {
        //Set up the spinner
        self.spinner = [[UIActivityIndicatorView alloc] init];
        self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.spinner.center = CGPointMake(view.frame.size.width / 2.0, view.frame.size.height / 2.0);
        
        //Add it to the view
        [view addSubview:self.spinner];
    }
    
    //Got to return self of course!
    return self;
}

/**
 * This is where the magic happens.
 * We want to display the spinner between 'did play' and the first progress. 
 */
-(void)setupEventListeners
{
    //Need a weak reference for block code
    __weak BCSDKActivityIndicator *weakSelf = self;
    
    //For video did play.
    [self.emitter on:BCEventVideoDidPlay callBlock:^(BCEvent *event) {
        [weakSelf.spinner startAnimating];
        
        //Set up a 'once' listener to stpo the animation on the first progress tick
        [weakSelf.emitter once:BCEventVideoProgress callBlock:^(BCEvent *event) {
            [weakSelf.spinner stopAnimating];
        }];
    }];
}

//This component isn't emitting any events.
+(NSArray *)allowedEmits{
    return @[];
}

//This component is listening to two events.
+(NSArray *)allowedListeners{
    return @[BCEventVideoDidPlay, BCEventVideoProgress];
}
@end
