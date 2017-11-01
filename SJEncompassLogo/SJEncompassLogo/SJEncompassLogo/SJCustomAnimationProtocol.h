//
//  SJCustomAnimationProtocol.h
//  MultipleWindow
//
//  Created by 薛 迎松 on 2017/6/14.
//  Copyright © 2017年 Encompass Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SJCustomAnimationProtocol

@required
- (void)setupAnimationInLayer:(CALayer *)layer withSize:(CGSize)size;

- (void)startAnimation;
- (void)stopAnimation;

@optional
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) UIColor *tintColor;

@end
