//
//  RCTStripeManager.m
//  RCTStripe
//
//  Created by Lane Rettig on 1/14/16.
//  Copyright © 2016 Lane Rettig. All rights reserved.
//

#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import "RCTLog.h"

#import "RCTStripe.h"
#import "RCTStripeManager.h"

@implementation RCTStripeManager
{
    RCTStripe *_stripe;
}

@synthesize bridge = _bridge;

- (UIView *)view
{
    _stripe = [[RCTStripe alloc] init];
    return _stripe;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

@end
