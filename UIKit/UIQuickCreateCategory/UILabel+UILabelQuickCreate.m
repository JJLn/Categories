//
//  UILabel+UILabelQuickCreate.m
//  HotYQ
//
//  Created by gm on 15/2/12.
//  Copyright (c) 2015年 hotyq. All rights reserved.
//

#import "UILabel+UILabelQuickCreate.h"
#import "UIColor+Gradient.h"

@implementation UILabel (UILabelQuickCreate)
+ (UILabel *)labelWithRect:(CGRect)rect tag:(NSUInteger)tag font:(CGFloat)fontSize
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.tag = tag;
    return label;
}

+ (UILabel *)labelWithRect:(CGRect)rect font:(CGFloat)fontSize textColor:(UIColor *)color
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    return label;
}

+ (UILabel *)labelWithRect:(CGRect)rect font:(CGFloat)fontSize textColor:(UIColor *)color text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    label.text = text;
    return label;
}

+ (UILabel *)labelWithRect:(CGRect)rect font:(CGFloat)fontSize textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    label.text = text;
    label.textAlignment = textAlignment;
    return label;
}

+ (UILabel *)labelWithRect:(CGRect)rect font:(CGFloat)fontSize textColor:(UIColor *)color Tag:(NSUInteger)tag
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    label.tag = tag;
    return label;
}
+ (UILabel *)labelWithRect:(CGRect)rect font:(CGFloat)fontSize textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    label.textAlignment = textAlignment;
    return label;
}

+ (UILabel *)labelWithRect:(CGRect)rect font:(CGFloat)fontSize textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode numberOfLine:(NSInteger)number
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    label.textAlignment = textAlignment;
    label.lineBreakMode = lineBreakMode;
    label.numberOfLines = number;
    return label;
}


+ (UILabel *)labelWithRect:(CGRect)rect fontName:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.text = text;
    label.font = font;
    label.textColor = color;
    label.textAlignment = textAlignment;
    return label;
}
+ (UILabel *)labelWithRect:(CGRect)rect fontName:(UIFont *)font textColor:(UIColor *)color
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.font = font;
    label.textColor = color;
    return label;
}
+ (UILabel *)labelWithRect:(CGRect)rect  textColor:(UIColor *)color
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = color;
    return label;
}

+ (UILabel *)labelWithRect:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    [label setText:text];
    [label setFont:font];
    [label setTextColor:textColor];
    [label setBackgroundColor:bgColor];
    return label;
    
}


+ (UILabel *)labelWithRect:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor lineBreakMode:(NSLineBreakMode)lineBreakMode numberOfLines:(NSInteger)numberOfLines{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    [label setText:text];
    [label setFont:font];
    [label setTextColor:textColor];
    [label setBackgroundColor:bgColor];
    [label setLineBreakMode:lineBreakMode];
    [label setNumberOfLines:numberOfLines];
    return label;
}


/** cell上label
 */
+ (UILabel *)labelWithFont:(CGFloat)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius  borderWidth:(CGFloat)borderWidth borderWidthColor:(UIColor*)borderWidthColor {
    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    [label setFont:[UIFont systemFontOfSize:font]];
    [label setTextColor:textColor];
    label.layer.cornerRadius = cornerRadius;
    label.layer.borderColor = borderWidthColor.CGColor;
    label.layer.masksToBounds = YES;
    label.layer.borderWidth = borderWidth;
    [label setBackgroundColor:bgColor];
    
    return label;
}




//jzj

/**
 *  等级
 */
+ (UILabel *)labelWithDegree
{
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:10];
    label.layer.cornerRadius=3;
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.borderWidth=0.3;
    label.layer.borderColor = [UIColor color_ffb440].CGColor;
    label.textColor = [UIColor color_ffb440];
    label.layer.masksToBounds = YES;
    
    
    return label;
}


/**
 *  度数
 */
+ (UILabel *)labelWithLevel
{
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:10];
    label.layer.cornerRadius=3;
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.borderWidth=0.5;
    label.layer.borderColor = [UIColor color_3fa9f5].CGColor;
    label.textColor = [UIColor color_3fa9f5];
    label.layer.masksToBounds = YES;
    
    
    return label;
}

+ (UILabel *) redManLabel{
    UILabel *label = [[UILabel alloc] init];
    label.height = ceil(45*0.5);
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = 3;
    label.layer.masksToBounds = YES;
    label.layer.borderWidth = 0.5;
    label.hidden = YES;
    label.font = FONT(12);
    label.textColor = [UIColor color_808080];
    label.layer.borderColor = [UIColor color_808080].CGColor;
    return label;

}


+ (UILabel *) redManRoleLabel{
    UILabel *label = [[UILabel alloc] init];
    label.height = ceil(45*0.5);
    label.textAlignment = NSTextAlignmentCenter;
//    [label addCornerRadius:3.0];
    label.layer.cornerRadius = 3.0;
    label.layer.masksToBounds = YES;
    label.hidden = YES;
    label.font = FONT(12);
    label.textColor = [UIColor color_808080];
    label.backgroundColor = [UIColor color_f2f2f2];
    return label;
    
}




+ (UILabel *) stateLabel{
    UILabel *label = [[UILabel alloc] init];
//    label.text = text;
    label.backgroundColor = [UIColor defaultRedColor];
    label.textColor = [UIColor whiteColor];

    label.size = CGSizeMake(14, 14);
    label.textAlignment = NSTextAlignmentCenter;
    [label addCornerRadius:3.0];
    label.layer.masksToBounds = YES;
    label.font = FONT(10);
    return label;
    
}



@end
