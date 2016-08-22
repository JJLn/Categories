//
//  UILabel+UILabelQuickCreate.h
//  HotYQ
//
//  Created by gm on 15/2/12.
//  Copyright (c) 2015年 hotyq. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  label快速创建
 */
@interface UILabel (UILabelQuickCreate)
+ (UILabel *)labelWithRect:(CGRect)rect tag:(NSUInteger)tag font:(CGFloat)fontSize;
+ (UILabel *)labelWithRect:(CGRect)rect font:(CGFloat)fontSize textColor:(UIColor *)color;
+ (UILabel *)labelWithRect:(CGRect)rect font:(CGFloat)fontSize textColor:(UIColor *)color text:(NSString *)text;
+ (UILabel *)labelWithRect:(CGRect)rect font:(CGFloat)fontSize textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text;
+ (UILabel *)labelWithRect:(CGRect)rect font:(CGFloat)fontSize textColor:(UIColor *)color Tag:(NSUInteger)tag;
+ (UILabel *)labelWithRect:(CGRect)rect font:(CGFloat)fontSize textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment;
+ (UILabel *)labelWithRect:(CGRect)rect font:(CGFloat)fontSize textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode numberOfLine:(NSInteger)number;
+ (UILabel *)labelWithRect:(CGRect)rect fontName:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text;
+ (UILabel *)labelWithRect:(CGRect)rect fontName:(UIFont *)font textColor:(UIColor *)color;
+ (UILabel *)labelWithRect:(CGRect)rect  textColor:(UIColor *)color;
+ (UILabel *)labelWithRect:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor;
+ (UILabel *)labelWithRect:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor lineBreakMode:(NSLineBreakMode)lineBreakMode numberOfLines:(NSInteger)numberOfLines;

/** cell上label
*/
+ (UILabel *)labelWithFont:(CGFloat)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius  borderWidth:(CGFloat)borderWidth borderWidthColor:(UIColor*)borderWidthColor;

/**
 *  度
 *
 */
+ (UILabel *)labelWithLevel;
/**
 *  等级
 *
 */
+ (UILabel *)labelWithDegree;
+ (UILabel *) redManLabel;
+ (UILabel *) redManRoleLabel;
 
 
//** 状态 热 精*/
+ (UILabel *) stateLabel;
@end


