//
//  BYAlertController.m
//  BYAlertController
//
//  Created by hcbarry on 2017/12/17.
//  Copyright © 2017年 hcbarry. All rights reserved.
//

#import "BYAlertController.h"

@interface BYAlertController ()

@property (strong, nonatomic) UIView *dismissalView;
@property (strong, nonatomic) BYAlertContainerController *container;
@property (strong, nonatomic) NSLayoutConstraint *containerTopToSuperviewBottomConstraint;

@end

@implementation BYAlertController

+ (instancetype)controllerWithContainer:(BYAlertContainerController *)container style:(BYAlertControllerStyle)style {
    return [[self alloc] initWithContainer:container style:style];
}

- (instancetype)initWithContainer:(BYAlertContainerController *)container style:(BYAlertControllerStyle)style {
    self = [super init];
    if (self) {
        _container = container;
        _container.delegate = self;
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *dismissalView = [UIView new];
    self.dismissalView = dismissalView;
    [self.view addSubview:dismissalView];
    dismissalView.translatesAutoresizingMaskIntoConstraints = NO;
    [dismissalView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)]];
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:dismissalView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0],
                                [NSLayoutConstraint constraintWithItem:dismissalView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0],
                                [NSLayoutConstraint constraintWithItem:dismissalView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0],
                                [NSLayoutConstraint constraintWithItem:dismissalView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:0],
                                ]];
    
    UIView *containerView = self.container.view;
    containerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addChildViewController:self.container];
    [self.view addSubview:containerView];
    [self.container didMoveToParentViewController:self];
    
    NSLayoutConstraint *containerBottomToSuperviewBottomConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
    containerBottomToSuperviewBottomConstraint.priority= UILayoutPriorityDefaultHigh;
    self.containerTopToSuperviewBottomConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
    [self.view addConstraints:@[
                                containerBottomToSuperviewBottomConstraint,
                                self.containerTopToSuperviewBottomConstraint,
                                [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0],
                                [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:0]
                                ]];
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    [UIView animateWithDuration:flag ? 0.3f : 0 animations:^{
        self.containerTopToSuperviewBottomConstraint.active = YES;
        self.view.backgroundColor = [UIColor clearColor];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [super dismissViewControllerAnimated:NO completion:completion];
    }];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - BYAlertContainerControllerDelegate

- (void)controller:(BYAlertContainerController *)controller dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    [self dismissViewControllerAnimated:flag completion:completion];
}

@end

@implementation UIViewController (BYAlertController)

- (void)presentAlertController:(BYAlertController *)controller animated:(BOOL)animated completion:(void (^)(void))completion {
    [self presentViewController:controller animated:NO completion:^{
        [UIView animateWithDuration:animated ? 0.3f : 0 animations:^{
            controller.containerTopToSuperviewBottomConstraint.active = NO;
            controller.view.backgroundColor = controller.backgroundColor;
            [controller.view layoutIfNeeded];
        }];
    }];
}

@end
