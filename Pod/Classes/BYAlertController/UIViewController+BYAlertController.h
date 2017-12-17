//
//  UIViewController+BYAlertController.h
//  BYAlertController
//
//  Created by hcbarry on 2017/12/17.
//  Copyright © 2017年 hcbarry. All rights reserved.
//

#import "BYAlertController.h"

@interface UIViewController (BYAlertController)

- (void)presentAlertController:(BYAlertController *)controller animated:(BOOL)animated completion:(void (^)(void))completion;

@end
