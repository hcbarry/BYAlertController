//
//  BYAlertContainerController.m
//  BYAlertController
//
//  Created by hcbarry on 2017/12/17.
//  Copyright © 2017年 hcbarry. All rights reserved.
//

#import "BYAlertContainerController.h"

@implementation BYAlertContainerController

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    if (self.delegate) {
        [self.delegate controller:self dismissViewControllerAnimated:flag completion:completion];
    } else {
        [super dismissViewControllerAnimated:flag completion:completion];
    }
}

@end
