//
//  CustomUIControls.m
//  CustomUIControlsApp
//
//  Created by Tom Abbott on 1/30/13.
//  Copyright (c) 2013 Tom Abbott. All rights reserved.
//

#import "CustomUIControls.h"
#import "BCEvent.h"
#import "BCRegisteringEventEmitter.h"
#import "BCQueueDisplay.h"
#import "BCPlayerView.h"
#import "VideoUtils.h"

@implementation CustomUIControls

#pragma mark Important Methods to Override

/**
 Setup Event Listeners is a method that get called automatically on initialization when the emitter is set up.
 It is a great place to create listeners for your component
 */
- (void)setupEventListeners
{
    //set up a weak reference to self
    __weak typeof (self) weakself = self;
    
    //When the video plays, enable/disable buttons
    [self.emitter on:BCEventVideoDidPlay callBlock:^(BCEvent *event) {
        [weakself.playButton setEnabled:NO];
        [weakself.pauseButton setEnabled:YES];
        
        //Show Controls
        [weakself.emitter emit:BCEventShowControls];
    }];
    
    //When the video pauses, enable/disable buttons
    [self.emitter on:BCEventPaused callBlock:^(BCEvent *event) {
        [weakself.playButton setEnabled:YES];
        [weakself.pauseButton setEnabled:NO];
    }];
    
    //When the video duration is set, set the durationLabel
    [self.emitter on:BCEventVideoDurationChanged callBlock:^(BCEvent *event) {
        AVPlayerItem *item = [event.details objectForKey:@"playerItem"];
        
        if (CMTIME_IS_VALID(item.duration))
        {
            weakself.duration = item.duration;
            weakself.durationLabel.text = [VideoUtils makeTimeReadable:CMTimeGetSeconds(weakself.duration)];
        }
        
    }];
    
    //When the video progresses, update the time played and progress bar
    [self.emitter on:BCEventVideoProgress callBlock:^(BCEvent *event) {
        AVPlayerItem *item = [event.details objectForKey:@"playerItem"];
        NSTimeInterval time = CMTimeGetSeconds(item.currentTime);
        
        //Label
        weakself.timeLabel.text = [VideoUtils makeTimeReadable:time];
        
        //Progress bar
        weakself.progressView.progress = time / CMTimeGetSeconds(weakself.duration);
        
    }];
       
    //When last video is queue has played...
    [self.emitter on:BCEventVideoDidEnd callBlock:^(BCEvent *event) {
        
        [weakself.pauseButton setEnabled:NO];
        [weakself.playButton setEnabled:NO];
        [weakself.progressView setProgress:0.0];
        [weakself.durationLabel setText:@"00:00"];
        [weakself.timeLabel setText:@"00:00"];
        
        //hide controls
        [weakself.emitter emit:BCEventHideControls];
        
    }];
    
    //Hide controls
    [self.emitter on:BCEventHideControls callBlock:^(BCEvent *event) {
        [weakself.controlsView setHidden:YES];
    }];
    
    //Show controls
    [self.emitter on:BCEventShowControls callBlock:^(BCEvent *event) {
        [weakself.controlsView setHidden:NO];
    }];
}

+ (NSArray *)allowedListeners
{
    return [NSArray arrayWithObjects:
            BCEventHideControls, // respond by hiding the controls
            BCEventShowControls, // respond by showing the controls
            BCEventVideoProgress, // respond by advancing the slider
            BCEventVideoDurationChanged, // respond to duration changes
            BCEventVideoDidEnd, // respond by resetting the controls
            BCEventVideoDidPlay, // respond by changing buttons
            BCEventPaused, // respond by changing buttons
            nil];
}

+ (NSArray *)allowedEmits
{
    return [NSArray arrayWithObjects:
            BCEventPlay, // to indicate that playback should begin or resume
            BCEventPause, // to indicate that playback should halt
            BCEventShowControls, // to indicate that the controls should show
            BCEventHideControls, // to indicate that the controls should hide
            nil];
}

#pragma mark Class Implementation Methods

- (id)initWithEventEmitter:(BCEventEmitter *)eventEmitter view:(UIView *)view
{
    if(self = [super initWithEventEmitter:eventEmitter])
    {
        [[NSBundle mainBundle] loadNibNamed:@"UIControls" owner:self options:nil];
        self.masterColor = UIColorFromRGB(0x0099CC);
        
        [self configureControlView:view];
    }
    
    return self;
}

- (void) configureControlView:(UIView *)view
{
    //Position and center
    self.controlsView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin);
    self.controlsView.center = CGPointMake(view.bounds.size.width/2, view.bounds.size.height-self.controlsView.frame.size.height);

    //Border Radius
    self.controlsView.layer.cornerRadius = 10.f;
    self.controlsView.layer.masksToBounds = YES;
    [self outlineObject:self.controlsView];
    
    //Play Button
    [self outlineObject:self.playButton];
    [self.playButton setTitleColor:self.masterColor forState:UIControlStateNormal];
    [self.playButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    
    //Pause Button
    [self outlineObject:self.pauseButton];
    [self.pauseButton setTitleColor:self.masterColor forState:UIControlStateNormal];
    [self.pauseButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    
    //Add View
    [view addSubview:self.controlsView];
}

- (void)outlineObject:(UIView *)view
{
    view.layer.borderWidth = 2.0f;
    view.layer.borderColor = self.masterColor.CGColor;
}

- (IBAction)playButtonTouchUpInside:(id)sender
{
    [self.emitter emit:BCEventPlay];
}

- (IBAction)pauseButtonTouchUpInside:(id)sender
{
    [self.emitter emit:BCEventPause];
}

@end
