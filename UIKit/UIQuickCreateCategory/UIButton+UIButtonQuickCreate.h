//
//  UIButton+UIButtonQuickCreate.h
//  HotYQ
//
//  Created by gm on 15/2/12.
//  Copyright (c) 2015年 hotyq. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  快速创建button
 */
@interface UIButton (UIButtonQuickCreate)
+(UIButton *)backButtonWithTitle:(NSString *)name backgroundImage:(NSString *)image hightLightImage:(NSString *)hight target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvent;
+ (UIButton *)buttonWithTitle:(NSString *)name backgroundImage:(NSString *)imageName hightlightImage:(NSString *)hightlightImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvent;
+ (UIButton *)imageButtonWithTitle:(NSString *)name backgroundImage:(NSString *)imageName hightlightImage:(NSString *)hightlightImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvent inRect:(CGRect)rect;
+ (UIButton *)imageButton:(NSString *)image target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvent inRect:(CGRect)rect;
+ (UIButton *)buttonWithType:(UIButtonType)buttonType title:(NSString*)title titleColor:(UIColor*)titleColor rect:(CGRect)rect backgroundColor:(UIColor *)color  image:(UIImage *)image  target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvent;

+ (UIButton*)titleViewButtonWithTitle:(NSString*)title target:(id)target selector:(SEL)selector;
//+ (UIButton*)buttonWithYellowColor;

@end
