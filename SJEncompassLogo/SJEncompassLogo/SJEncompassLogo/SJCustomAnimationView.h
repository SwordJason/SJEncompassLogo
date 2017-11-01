//
//  SJCustomeAnimationView.h
//  MultipleWindow
//
//  Created by 薛 迎松 on 2017/6/14.
//  Copyright © 2017年 Encompass Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJCustomAnimationProtocol.h"

@interface SJCustomAnimationView : UIView

@property (nonatomic, strong, readonly) id <SJCustomAnimationProtocol> animator;
- (instancetype)initWithCustomAnimator:(id <SJCustomAnimationProtocol>)animator;

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) UIColor *tintColor;


@property (nonatomic, readonly) BOOL isAnimating;

- (void)startAnimating;
- (void)stopAnimating;

@property (nonatomic, assign) CGFloat progress;

@end
