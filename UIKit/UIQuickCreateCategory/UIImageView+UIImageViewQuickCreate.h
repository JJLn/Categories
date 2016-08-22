//
//  UIImageView+UIImageViewQuickCreate.h
//  HotYQ
//
//  Created by gm on 15/2/12.
//  Copyright (c) 2015年 hotyq. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  快速创建imageView
 */
@interface UIImageView (UIImageViewQuickCreate)

+ (UIImageView *)imageViewWithRect:(CGRect)rect normalImageName:(NSString *)normalImageName;

+ (UIImageView *)imageViewWithRect:(CGRect)rect normalImageName:(NSString *)normalImageName interactionEnabled:(BOOL)isEnable;

+ (UIImageView *)imageViewWithFrame:(CGRect)rect image:(UIImage *)image userInteraction:(BOOL)isEnabled;

+ (UIImageView *)imageViewWithRect:(CGRect)rect backgroundColor:(UIColor *)color normalImageName:(NSString *)normalImageName interactionEnabled:(BOOL)isEnable alpha:(CGFloat)alpha cornerRadius:(CGFloat)radius;

+ (UIImageView *)imageViewWithRect:(CGRect)rect backgroundColor:(UIColor *)color interactionEnabled:(BOOL)isEnable normalImageName:(NSString *)normalImageName alpha:(CGFloat)alpha;
@end
