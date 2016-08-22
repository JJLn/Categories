//
//  UIImageView+Anmate.m
//  QianNiu
//
//  Created by wangjian on 16/5/17.
//  Copyright © 1016年 wangjian. All rights reserved.
//

#import "UIImageView+Anmate.h"

@implementation UIImageView (Anmate)

- (void)cleckSetImage:(UIImage *)image
{
    UILabel *lab;
    for (UIView * view in self.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            lab = (UILabel *)view;
        }
    }
    lab.hidden = YES;

//    [self spring];
//    [self setImage:image];
    CGRect frame = self.frame;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        [self imageViewControllerBigAnimation:frame];
        self.frame = CGRectMake(frame.origin.x + 10,frame.origin.y +10, 20, 20);
//        lab.frame = CGRectMake(0,0, 20, 20);
        [self setImage:image];
    } completion:^(BOOL finished) {

        [self stopImageViewControllerBigAnimation:image frame:frame];
        [self cleckSetImageFrame:frame];
    }];
}

- (void)cleckSetImageFrame:(CGRect)frame{
    //    [self spring];
    //    [self setImage:image];
//    UILabel *lab;
//    for (UIView * view in self.subviews) {
//        if ([view isKindOfClass:[UILabel class]]) {
//            lab = (UILabel *)view;
//        }
//    }
    

    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        //        [self imageViewControllerBigAnimation:frame];
        self.frame = frame;

    } completion:^(BOOL finished) {
        [self spring];
       
    }];
}

- (void)imageViewControllerBigAnimation:(CGRect)frame{
    
    [UIView beginAnimations:@"imageViewBig" context:nil];
    [UIView setAnimationDuration:1];
    CGAffineTransform newTransform =
    CGAffineTransformConcat(self.transform,  CGAffineTransformInvert(self.transform));
    [self setTransform:newTransform];
    self.alpha = 0.0;
    
    
    [UIView commitAnimations];
    
}
- (void)stopImageViewControllerBigAnimation:(UIImage *)image frame:(CGRect)frame{
    
    

    [UIView beginAnimations:@"imageViewBig" context:nil];
    [UIView setAnimationDuration:1];
    CGAffineTransform newTransform =
    CGAffineTransformConcat(self.transform,  CGAffineTransformInvert(self.transform));
    [self setTransform:newTransform];
    self.alpha = 1.0;
    [self setImage:image];
//    lab.frame = CGRectMake(0,0, 40, 40);
    self.frame = CGRectMake(frame.origin.x + 10,frame.origin.y +10, 20, 20);
    self.center = self.center;
    [UIView commitAnimations];
    
}

- (void)spring{

    CGRect frame = self.frame;
    [UIView animateWithDuration:0.2 // 动画时长
                          delay:0.0 // 动画延迟
         usingSpringWithDamping:1 // 类似弹簧振动效果 0~1
          initialSpringVelocity:0.0 // 初始速度
                        options:UIViewAnimationOptionCurveEaseInOut // 动画过渡效果
                     animations:^{
                         // code...
                         [self setFrame:CGRectMake(frame.origin.x - 5, frame.origin.y - 5, frame.size.width +10   ,frame.size.height +10 )];
                     } completion:^(BOOL finished) {
                         // 动画完成后执行
                         // code...
//                         [self setFrame:frame];
                         [self Stpospring];
                     }];
}
- (void)Stpospring{
    UILabel *lab;
    for (UIView * view in self.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            lab = (UILabel *)view;
        }
    }

    CGRect frame = self.frame;
    [UIView animateWithDuration:0.2 // 动画时长
                          delay:0.0 // 动画延迟
         usingSpringWithDamping:1 // 类似弹簧振动效果 0~1
          initialSpringVelocity:0.5 // 初始速度
                        options:UIViewAnimationOptionCurveEaseInOut // 动画过渡效果
                     animations:^{
                         // code...
                         [self setFrame:CGRectMake(frame.origin.x + 5, frame.origin.y + 5, frame.size.width -10   ,frame.size.height -10 )];
                     } completion:^(BOOL finished) {
                         // 动画完成后执行
                         // code...
//                         [self setFrame:frame];
                         lab.hidden = NO;
                     }];
}

@end
