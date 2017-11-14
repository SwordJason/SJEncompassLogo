//
//  SJEncompassLogoAnimation.m
//  MultipleWindow
//
//  Created by 薛 迎松 on 2017/6/14.
//  Copyright © 2017年 Encompass Technologies. All rights reserved.
//

#import "SJEncompassLogoAnimation.h"

@interface SJEncompassLogoAnimation()

@property (nonatomic, weak) CALayer *animationLayer;

@end

@implementation SJEncompassLogoAnimation

- (void)setupAnimationInLayer:(CALayer *)layer withSize:(CGSize)size
{
    //Preset Parameter
    CGFloat radiusBigPercent = 1.0;
    CGFloat interAngle = 0.4*(M_PI_4); // from 0.0 -> 1.0
    CGFloat radiusOffsetPercent = 0.1; // from 0.1 -> 0.5
    
    CGPoint viewCenter = CGPointMake(CGRectGetMidX(layer.bounds), CGRectGetMidY(layer.bounds));
    
    CGFloat actualSize = MIN(size.width, size.height);
    if (CGPointEqualToPoint(viewCenter, CGPointZero)) {
        viewCenter = CGPointMake(actualSize, actualSize);
    }
    
    CGFloat halfOrignalSize = actualSize * 0.5f;
    CGPoint bigCenter = CGPointMake(0-halfOrignalSize, 0-halfOrignalSize);
    CGFloat bigRadius = MIN(viewCenter.x, viewCenter.y) * radiusBigPercent;
    CGFloat smallOffset = bigRadius*radiusOffsetPercent*sqrt(2);
    CGPoint smallCenter = CGPointMake(viewCenter.x + smallOffset, viewCenter.y-smallOffset);
    CGPoint interPoint1 = CGPointMake(viewCenter.x + bigRadius * sin(interAngle+M_PI_4), viewCenter.y - bigRadius*cos(interAngle+M_PI_4));
    CGPoint interPoint2 = CGPointMake(viewCenter.x + bigRadius * sin(M_PI_4-interAngle), viewCenter.y - bigRadius*cos(M_PI_4 - interAngle));
    CGFloat smallRadius = sqrtf(pow(interPoint1.x-smallCenter.x, 2) + pow(interPoint1.y-smallCenter.y, 2));
    
    CGFloat smallAngle = atan(fabs((interPoint1.y-smallCenter.y)/(interPoint1.x-smallCenter.x)) );
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:interPoint1];
    [bezierPath addArcWithCenter:viewCenter radius:bigRadius startAngle:(M_PI*7/4 + interAngle) endAngle:(M_PI*7/4 - interAngle) clockwise:YES];
    [bezierPath addLineToPoint:interPoint2];
    [bezierPath addArcWithCenter:smallCenter radius:smallRadius startAngle:(M_PI*7/4 - smallAngle) endAngle:(M_PI*7/4 + smallAngle) clockwise:NO];
    [bezierPath addClip];
    
    CAShapeLayer *bgEncompassLayer = [CAShapeLayer layer];
    bgEncompassLayer.path = bezierPath.CGPath;
    bgEncompassLayer.fillColor = [UIColor blackColor].CGColor;
    bgEncompassLayer.position = bigCenter;
    [layer addSublayer:bgEncompassLayer];
    
    CGPoint encompassCenter = CGPointMake(0, 0);
    CGFloat encompassRadius = smallRadius * 0.85;
    CGFloat encompassMinRadius = encompassRadius*0.3;

    UIBezierPath *encompassPath = [UIBezierPath bezierPath];
    [encompassPath moveToPoint:CGPointMake(encompassCenter.x, encompassCenter.y - encompassRadius)];
    [encompassPath addQuadCurveToPoint:CGPointMake(encompassCenter.x, encompassCenter.y+encompassRadius) controlPoint:CGPointMake(encompassCenter.x+encompassMinRadius, encompassCenter.y)];
    [encompassPath addQuadCurveToPoint:CGPointMake(encompassCenter.x, encompassCenter.y-encompassRadius) controlPoint:CGPointMake(encompassCenter.x-encompassMinRadius, encompassCenter.y)];
    
    CAShapeLayer *encompassLayer = [CAShapeLayer layer];
    encompassLayer.path = encompassPath.CGPath;
    encompassLayer.fillColor = [UIColor redColor].CGColor;
    encompassLayer.position = CGPointMake(bigRadius*2-smallRadius-halfOrignalSize, smallRadius-halfOrignalSize);
    encompassLayer.transform = CATransform3DMakeRotation(M_PI*0.25, 0, 0, 1);
    [layer addSublayer:encompassLayer];
    self.animationLayer = encompassLayer;
}

- (void)setProgress:(CGFloat)progress
{
    CFTimeInterval pausedTime = [self.animationLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.animationLayer.speed = 0.0f;
    self.animationLayer.timeOffset = pausedTime + progress;
}

- (CGFloat)progress
{
    return self.animationLayer.timeOffset;
}

- (void)startAnimation
{
    NSTimeInterval beginTime = CACurrentMediaTime();

    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.duration = 1.0f;
    rotationAnimation.beginTime = beginTime - (rotationAnimation.duration * M_PI/4);
    
    rotationAnimation.fromValue = [NSNumber numberWithFloat:M_PI*0.25];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.25];
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.animationLayer addAnimation:rotationAnimation forKey:@"animation"];
}

- (void)stopAnimation
{
    [self.animationLayer removeAnimationForKey:@"Rotate"];
}
@end
