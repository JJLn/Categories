//
//  UIView+Animation.m
//  HYQuan
//
//  Created by HotYQ on 15/12/22.
//  Copyright (c) 2015年 fqah. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

- (void)animation:(CGRect)frame
{
    [UIView beginAnimations:@"move" context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    [self setFrame:frame];
    if (frame.size.height == 0) {
       [UIView setAnimationDidStopSelector:@selector(backZero)];  
    }
   
    [UIView commitAnimations];
}
- (void)animationLongTime:(NSInteger)time frame:(CGRect)frame
{
    [UIView beginAnimations:@"move" context:nil];
    [UIView setAnimationDuration:time];
    [UIView setAnimationDelegate:self];
    [self setFrame:frame];
    if (frame.size.height == 0) {
        [UIView setAnimationDidStopSelector:@selector(backZero)];
    }
    
    [UIView commitAnimations];
}

- (void)backZero
{

}
@end
