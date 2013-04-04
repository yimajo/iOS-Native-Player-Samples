//
//  BCSDKActivityIndicator.h
//  LoadingIndicatorSampleApp
//
//  Created by Tom Abbott on 4/2/13.
//  Copyright (c) 2013 Brightcove. All rights reserved.
//

#import "BCComponent.h"

@interface BCSDKActivityIndicator : BCComponent

@property (strong, nonatomic) UIActivityIndicatorView *spinner;
@property (strong, nonatomic) UIView *view;

- (id)initWithEventEmitter:(BCEventEmitter *)eventEmitter andView:(UIView *)view;

@end
