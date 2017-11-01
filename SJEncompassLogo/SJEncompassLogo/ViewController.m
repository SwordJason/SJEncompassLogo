//
//  ViewController.m
//  SJEncompassLogo
//
//  Created by 薛 迎松 on 2017/11/1.
//  Copyright © 2017年 Encompass Technologies. All rights reserved.
//

#import "ViewController.h"
#import "SJCustomAnimationView.h"
#import "SJEncompassLogoAnimation.h"

@interface ViewController ()
@property (nonatomic, strong) SJCustomAnimationView *animationView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    SJCustomAnimationView *animationView = [[SJCustomAnimationView alloc] initWithCustomAnimator:[SJEncompassLogoAnimation new]];
    animationView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:animationView];
    self.animationView = animationView;

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:animationView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:animationView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:animationView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:animationView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:animationView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [animationView startAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
