//
//  SJCustomeAnimationView.m
//  MultipleWindow
//
//  Created by 薛 迎松 on 2017/6/14.
//  Copyright © 2017年 Encompass Technologies. All rights reserved.
//

#import "SJCustomAnimationView.h"

@implementation SJCustomAnimationView

- (instancetype)initWithCustomAnimator:(id<SJCustomAnimationProtocol>)animator
{
    if (self = [super init]) {
        _animator = animator;
        
        self.layer.sublayers = nil;
        self.userInteractionEnabled = NO;
        self.hidden = YES;
    }
    return self;
}

- (void)setupAnimation
{
    [self stopAnimating];
    [self.animator setupAnimationInLayer:self.layer withSize:CGSizeMake(35, 35)];
}

- (void)startAnimating
{
    if (!self.layer.sublayers) {
        [self setupAnimation];
    }
    
    self.layer.speed = 1.0f;
    self.hidden = NO;
    _isAnimating = YES;
    [self.animator startAnimation];
}

- (void)stopAnimating {
    if(_isAnimating)
    {
        _isAnimating = NO;
        
        if (self.animator) {
            [self.animator stopAnimation];
        }
        
        self.hidden = YES;
    }
}

- (void)setProgress:(CGFloat)progress
{
    if (progress > 1) {
        progress = 1;
    }
    else if(progress < 0)
    {
        progress = 0;
    }
    
    if (!self.layer.sublayers) {
        [self setupAnimation];
    }
    
    self.hidden = NO;
    _isAnimating = YES;
    
    [self.animator startAnimation];
    [self.animator setProgress:progress];
}

- (CGFloat)progress
{
    return [self.animator progress];
}

- (void)setSize:(CGSize)size
{
    _size = size;
    
    if (self.isAnimating) {
        [self stopAnimating];
        [self setupAnimation];
        [self startAnimating];
    }
}

- (void)setTintColor:(UIColor *)tintColor
{
    self.animator.tintColor = tintColor;
    
    if (self.isAnimating)
    {
        [self stopAnimating];
        [self setupAnimation];
        [self startAnimating];
    }
}

- (UIColor *)tintColor
{
    return self.animator.tintColor;
}

@end
