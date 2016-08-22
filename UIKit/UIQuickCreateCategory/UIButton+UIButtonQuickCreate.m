//
//  UIButton+UIButtonQuickCreate.m
//  HotYQ
//
//  Created by gm on 15/2/12.
//  Copyright (c) 2015年 hotyq. All rights reserved.
//

#import "UIButton+UIButtonQuickCreate.h"
#import "UIButton+UIButton_BackgroundImageButton.h"


@implementation UIButton (UIButtonQuickCreate)
+(UIButton *)backButtonWithTitle:(NSString *)name backgroundImage:(NSString *)image hightLightImage:(NSString *)hight target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvent
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:name forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    button.titleEdgeInsets = UIEdgeInsetsMake(0,0,0,-6);
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:hight] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:controlEvent];
    return button;
    
}


+ (UIButton *)buttonWithTitle:(NSString *)name backgroundImage:(NSString *)imageName hightlightImage:(NSString *)hightlightImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvent
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:name forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:hightlightImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:controlEvent];
    return button;
}


+ (UIButton *)imageButtonWithTitle:(NSString *)name backgroundImage:(NSString *)imageName hightlightImage:(NSString *)hightlightImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvent inRect:(CGRect)rect
{
    UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    imageButton.frame = rect;
    [imageButton setTitle:name forState:UIControlStateNormal];
    imageButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [imageButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [imageButton setBackgroundImage:[UIImage imageNamed:hightlightImage] forState:UIControlStateHighlighted];
    [imageButton addTarget:target action:action forControlEvents:controlEvent];
    return imageButton;
}

+ (UIButton *)imageButton:(NSString *)image target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvent inRect:(CGRect)rect
{
    UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    imageButton.frame = rect;
    [imageButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [imageButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return imageButton;
}

+ (UIButton *)buttonWithType:(UIButtonType)buttonType title:(NSString*)title titleColor:(UIColor*)titleColor rect:(CGRect)rect backgroundColor:(UIColor *)color  image:(UIImage *)image  target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvent
{
    UIButton * button = [UIButton buttonWithType:buttonType];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.frame = rect;
    button.backgroundColor = color;
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:controlEvent];
    return button;
}

+ (UIButton*)buttonWithYellowColor{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = FONT(14);
    button.layer.borderWidth=0.5;
    button.layer.cornerRadius = 3;
    button.layer.masksToBounds = YES;
    button.layer.borderColor = [UIColor color_b3b3b3].CGColor;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor color_333333] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor color_ffb400] forState:UIControlStateSelected];
    [button setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    return button;
}


+ (UIButton*)titleViewButtonWithTitle:(NSString*)title target:(id)target selector:(SEL)selector{

    UIButton * titleButton = [UIButton new];
    [titleButton setImage:[UIImage imageNamed:@"icon_whiteArrow"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"icon_menu_flag"] forState:UIControlStateSelected];
    
    [titleButton setTitle:title forState:UIControlStateNormal];
    CGFloat left = [titleButton.currentTitle widthWithHeight:CGFLOAT_MAX font:FONT(23)];
    
    titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, left, 0, 0);
    titleButton.width = left + 4 + titleButton.currentImage.size.width;
    titleButton.height = 30;
    [titleButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return titleButton;
}
@end
