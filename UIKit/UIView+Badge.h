//
//  UIView+Badge.h
//  iOS知识点
//
//  Created by 孙婷婷 on 16/5/6.
//  Copyright © 2016年 suntingting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Badge)
/**
 * text 文本
 * borderColor 边界颜色
 * textColor 文本颜色
 * fontSize 文本大小
 * size 边界大小
 * isFill 是否填充，YES填充边界颜色
*/
- (void)addBadgeWithText:(NSString *)text BorderColor:(UIColor *)borderColor textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize Size:(CGSize)size fillColor:(UIColor *)fillColor;


- (void)removeAllSubviews;

@end
