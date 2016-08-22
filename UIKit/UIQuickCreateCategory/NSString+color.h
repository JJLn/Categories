//
//  NSString+color.h
//  HotYQ
//
//  Created by 王建 on 15/8/17.
//  Copyright (c) 2015年 hotyq. All rights reserved.
/*
                                            
 
 
 关键字 换颜色

 
 
 */

#import <Foundation/Foundation.h>

//#pragma mark _originalStr 原始字符串
//#pragma mark _str         换颜色的关键词
//#pragma mark _color       关键词颜色
//# return NSMutableAttributedString
//label.attributedText = attributedString
@interface NSString (color)
+ (NSMutableAttributedString *) originalStr:(NSString*)_originalStr colorWithStr:(NSString *)_str secondStr:(NSString *)second color:(UIColor *)_color secondCorlor:(UIColor *)secondColor;
+ (NSMutableAttributedString *) filterNilOriginalStr:(NSString*)_originalStr colorWithStr:(NSString *)_str secondStr:(NSString *)second color:(UIColor *)_color secondCorlor:(UIColor *)secondColor;




+ (NSMutableAttributedString *)orgStr:(NSString *)org color:(UIColor *)color font:(UIFont *)font text:(NSString *)text;

+ (NSMutableAttributedString *)originalStr:(NSString*)_originalStr lastStr:(NSString *)lastStr color:(UIColor *)_color colorWithStr:(NSString *)_str;


+ (NSMutableAttributedString *)originalStr:(NSString*)_originalStr lastStr:(NSString *)lastStr lastStr1:(NSString *)lastStr1  colorWithStr:(NSString *)_str  colorWithStr:(NSString *)_str1;
@end
