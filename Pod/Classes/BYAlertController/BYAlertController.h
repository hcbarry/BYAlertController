//
//  BYAlertController.h
//  BYAlertController
//
//  Created by hcbarry on 2017/12/17.
//  Copyright © 2017年 hcbarry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYAlertContainerController.h"

typedef NS_ENUM(NSInteger, BYAlertControllerStyle) {
    BYAlertControllerStyleActionSheet = 0
};

@interface BYAlertController : UIViewController <BYAlertContainerControllerDelegate>

+ (instancetype)controllerWithContainer:(BYAlertContainerController *)container style:(BYAlertControllerStyle)style;
- (instancetype)initWithContainer:(BYAlertContainerController *)container style:(BYAlertControllerStyle)style;

@property (strong, nonatomic) UIColor *backgroundColor;

@end
