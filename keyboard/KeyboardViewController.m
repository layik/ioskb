//
//  KeyboardViewController.m
//  keyboard
//
//  Created by layik on 02/04/2019.
//  Copyright © 2019 layik. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()

@property (nonatomic, strong) UIButton *nextKeyboardButton;
@property (atomic) int y;

@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    if(self.y == 0) {
        self.y = self.y + 30;
    } else {
        self.y = self.y + 15;
    }
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.y, 120, 25)];
    label.text = [NSString stringWithFormat:@"%.2f updateViewConstraints", self.view.frame.size.height];
    [label sizeToFit];
    [self.view addSubview:label];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, 120, 25)];
    label.text = [NSString stringWithFormat:@"%.2f should be 310", self.view.frame.size.height];
    [label sizeToFit];
    [self.view addSubview:label];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.y = 0;
    
    UIView *keysView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    NSLayoutConstraint *keyboardHeightConstraint = [NSLayoutConstraint
                                                    constraintWithItem:self.view
                                                    attribute:NSLayoutAttributeHeight
                                                    relatedBy:NSLayoutRelationEqual
                                                    toItem:nil
                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:0.0
                                                    constant:310];
    [keyboardHeightConstraint setPriority:UILayoutPriorityDefaultHigh];
    [self.view addConstraints:@[keyboardHeightConstraint]];
    
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.nextKeyboardButton setTitle:NSLocalizedString(@"Next Keyboard", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
    [self.nextKeyboardButton sizeToFit];
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    
    [keysView addSubview:self.nextKeyboardButton];
    
    NSLayoutConstraint *nextKeyboardButtonLeftSideConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:keysView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *nextKeyboardButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:keysView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [keysView addConstraints:@[nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint]];
    
    keysView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:keysView];
}

- (void)dealloc {
    self.nextKeyboardButton = nil;
}

@end
