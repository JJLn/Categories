//
//  UIView+Animation.h
//  HYQuan
//
//  Created by HotYQ on 15/12/22.
//  Copyright (c) 2015年 fqah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)
- (void)animation:(CGRect)frame;
- (void)animationLongTime:(NSInteger)time frame:(CGRect)frame;
- (void)backZero;
@end
