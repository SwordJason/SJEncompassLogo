//
//  SJEncompassLogoAnimation.h
//  MultipleWindow
//
//  Created by 薛 迎松 on 2017/6/14.
//  Copyright © 2017年 Encompass Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SJCustomAnimationProtocol.h"

@interface SJEncompassLogoAnimation : NSObject
<SJCustomAnimationProtocol>

@property (nonatomic, assign) UIColor *tintColor; //doesn't apply

@end
