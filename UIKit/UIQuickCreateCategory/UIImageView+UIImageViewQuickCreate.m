//
//  UIImageView+UIImageViewQuickCreate.m
//  HotYQ
//
//  Created by gm on 15/2/12.
//  Copyright (c) 2015年 hotyq. All rights reserved.
//

#import "UIImageView+UIImageViewQuickCreate.h"

@implementation UIImageView (UIImageViewQuickCreate)

+ (UIImageView *)imageViewWithRect:(CGRect)rect normalImageName:(NSString *)normalImageName
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = [UIImage imageNamed:normalImageName];
    imageView.backgroundColor = [UIColor clearColor];
    return imageView;
}

+ (UIImageView *)imageViewWithRect:(CGRect)rect normalImageName:(NSString *)normalImageName interactionEnabled:(BOOL)isEnable
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = [UIImage imageNamed:normalImageName];
    imageView.userInteractionEnabled = isEnable;
    return imageView;
}

+ (UIImageView *)imageViewWithFrame:(CGRect)rect image:(UIImage *)image userInteraction:(BOOL)isEnabled{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    [imageView setImage:image];
    [imageView setUserInteractionEnabled:isEnabled];
    return imageView;
}

+ (UIImageView *)imageViewWithRect:(CGRect)rect backgroundColor:(UIColor *)color normalImageName:(NSString *)normalImageName interactionEnabled:(BOOL)isEnable alpha:(CGFloat)alpha cornerRadius:(CGFloat)radius
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.backgroundColor = color;
    UIImage *image = [UIImage imageNamed:normalImageName];
    imageView.image = image;
    imageView.userInteractionEnabled = isEnable;
    imageView.alpha = alpha;
    imageView.layer.cornerRadius = radius;
    [imageView.layer setMasksToBounds:YES];
    return imageView;
    
}
+ (UIImageView *)imageViewWithRect:(CGRect)rect backgroundColor:(UIColor *)color interactionEnabled:(BOOL)isEnable normalImageName:(NSString *)normalImageName alpha:(CGFloat)alpha
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.backgroundColor = color;
    imageView.image = [UIImage imageNamed:normalImageName];
    imageView.userInteractionEnabled = isEnable;
    imageView.alpha = alpha;
    return imageView;
}

@end
