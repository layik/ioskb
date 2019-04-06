//
//  KeyboardViewController.m
//  keyboard
//
//  Created by Ziqiao Chen on 9/14/15.
//  Copyright (c) 2015 Ziqiao Chen. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()

@property (nonatomic, strong) UIButton *nextKeyboardButton;
@property (nonatomic, strong) UIView *keysView;
@property (nonatomic, strong) NSLayoutConstraint *keyboardHeightConstraint;

@end

@implementation KeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.keysView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    self.keyboardHeightConstraint = [NSLayoutConstraint constraintWithItem:self.view
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:0.0
                                                                  constant:310];
    [self.keyboardHeightConstraint setPriority:UILayoutPriorityDefaultHigh];
    [self.view addConstraints:@[self.keyboardHeightConstraint]];
    
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.nextKeyboardButton setTitle:NSLocalizedString(@"Next Keyboard", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
    [self.nextKeyboardButton sizeToFit];
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    
    [self.keysView addSubview:self.nextKeyboardButton];
    
    NSLayoutConstraint *nextKeyboardButtonLeftSideConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.keysView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *nextKeyboardButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.keysView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self.keysView addConstraints:@[nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint]];
    
    self.keysView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:self.keysView];
}

- (void)dealloc {
    
    self.keysView = nil;
    self.keyboardHeightConstraint = nil;
    self.nextKeyboardButton = nil;
}

@end
