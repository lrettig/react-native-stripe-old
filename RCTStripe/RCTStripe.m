#import <Stripe/Stripe.h>

#import "RCTStripe.h"
#import "RCTLog.h"

//@interface RCTStripe () <PKPaymentAuthorizationViewControllerDelegate>
//@end

@implementation RCTStripe

- (id)init
{
  if ((self = [super init])) {
      // init code here
//      [self beginApplePay];
      UILabel *myLabel = [[UILabel alloc] init];
      [myLabel setText:@"Hello world"];
      [self addSubview:myLabel];
  }

  return self;
}

- (void)beginApplePay {
//    self.applePaySucceeded = NO;
//    self.applePayError = nil;
    
    NSString *merchantId = @"merchant.com.breezebrand.lanerettig";
    
    PKPaymentRequest *paymentRequest = [Stripe paymentRequestWithMerchantIdentifier:merchantId];
    if ([Stripe canSubmitPaymentRequest:paymentRequest]) {
//        [paymentRequest setRequiredShippingAddressFields:PKAddressFieldPostalAddress];
//        [paymentRequest setRequiredBillingAddressFields:PKAddressFieldPostalAddress];
//        paymentRequest.shippingMethods = [self.shippingManager defaultShippingMethods];
//        paymentRequest.paymentSummaryItems = [self summaryItemsForShippingMethod:paymentRequest.shippingMethods.firstObject];
        PKPaymentAuthorizationViewController *auth = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:paymentRequest];
        auth.delegate = self;
        if (auth) {
            UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
            UIViewController *rootViewController = keyWindow.rootViewController;
            [rootViewController presentViewController:auth animated:YES completion:nil];
//            [self presentViewController:auth animated:YES completion:nil];
        } else {
            NSLog(@"Apple Pay returned a nil PKPaymentAuthorizationViewController - make sure you've configured Apple Pay correctly, as outlined at https://stripe.com/docs/mobile/apple-pay");
        }
    }
}

- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller
                       didAuthorizePayment:(PKPayment *)payment
                                completion:(void (^)(PKPaymentAuthorizationStatus))completion {
    [[STPAPIClient sharedClient] createTokenWithPayment:payment
                                             completion:^(STPToken *token, NSError *error) {
                                                 RCTLog(@"Got token: %@", token);
//                                                 [self createBackendChargeWithToken:token
//                                                                         completion:^(STPBackendChargeResult status, NSError *error) {
//                                                                             if (status == STPBackendChargeResultSuccess) {
//                                                                                 self.applePaySucceeded = YES;
//                                                                                 completion(PKPaymentAuthorizationStatusSuccess);
//                                                                             } else {
//                                                                                 self.applePayError = error;
//                                                                                 completion(PKPaymentAuthorizationStatusFailure);
//                                                                             }
//                                                                         }];
                                             }];
}

//- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller {
//    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
//    UIViewController *rootViewController = keyWindow.rootViewController;
//    [rootViewController dismissViewControllerAnimated:YES completion:^{
//        RCTLog(@"payment authorization VC did finish");
////        if (self.applePaySucceeded) {
////            [self paymentSucceeded];
////        } else if (self.applePayError) {
////            [self presentError:self.applePayError];
////        }
////        self.applePaySucceeded = NO;
////        self.applePayError = nil;
//    }];
//}

- (void)layoutSubviews
{
    [super layoutSubviews];
    RCTAssert(self.subviews.count == 1, @"we should only have exactly one subview");
//    RCTAssert([self.subviews lastObject] == _loginButton, @"our only subview should be a fbsdkloginbutton");
//    _loginButton.frame = _loginButton.bounds;
}

- (void)insertReactSubview:(UIView *)view atIndex:(NSInteger)atIndex
{
    RCTLogError(@"FBLoginButton does not support subviews");
    return;
}

- (void)removeReactSubview:(UIView *)subview
{
    RCTLogError(@"FBLoginButton does not support subviews");
    return;
}

- (NSArray *)reactSubviews
{
    return @[];
}

@end
