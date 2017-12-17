//
//  BYAlertContainerController.h
//  BYAlertController
//
//  Created by hcbarry on 2017/12/17.
//  Copyright © 2017年 hcbarry. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BYAlertContainerController;

@protocol BYAlertContainerControllerDelegate

- (void)controller:(BYAlertContainerController *)controller dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion;

@end

@interface BYAlertContainerController : UIViewController

@property (assign, nonatomic) id<BYAlertContainerControllerDelegate> delegate;

@end
