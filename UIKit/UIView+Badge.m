//
//  UIView+Badge.m
//  iOS知识点
//
//  Created by 孙婷婷 on 16/5/6.
//  Copyright © 2016年 suntingting. All rights reserved.
//

#import "UIView+Badge.h"
#import "Masonry.h"

@implementation UIView (Badge)
/**
 * text 文本
 * borderColor 边界颜色
 * textColor 文本颜色
 * fontSize 文本大小
 * size 边界大小
 * fillColor 填充颜色
*/
- (void)addBadgeWithText:(NSString *)text BorderColor:(UIColor *)borderColor textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize Size:(CGSize)size fillColor:(UIColor *)fillColor
{
    UILabel *label = [[UILabel alloc]init];
    if (![text isEqualToString:@""]) {
        label.text = text;
    }
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.backgroundColor = [UIColor clearColor].CGColor;
    label.layer.backgroundColor = fillColor.CGColor;
    label.layer.masksToBounds = YES;
    label.layer.borderColor = borderColor.CGColor;
    label.layer.borderWidth = 1;
    label.layer.cornerRadius = size.width / 2;
    if (textColor != nil) {
        label.textColor = textColor;
    }
    if (fontSize > 0) {
        UIFont *font = [UIFont systemFontOfSize:fontSize];
        label.font = font;
    }
    
    [self addSubview:label];
    
    if ([self isKindOfClass:[UIButton class]]) {
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
            make.centerX.mas_equalTo(self.frame.origin.x + self.frame.size.width + size.width);
            make.centerY.mas_equalTo(self.frame.origin.y + self.frame.size.height - size.height / 2);
        }];
    }else if([self isKindOfClass:[UILabel class]]){
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
            make.centerX.mas_equalTo(self.frame.origin.x + self.frame.size.width + 2 * size.width);
            make.centerY.mas_equalTo(self.frame.origin.y + self.frame.size.height - size.height / 2);
        }];
    }else{
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
            make.centerX.mas_equalTo(self.frame.origin.x + self.frame.size.width + 2 * size.width);
            make.centerY.mas_equalTo(self.frame.origin.y + self.frame.size.height - size.height / 2);
        }];
    }
}

- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}



@end
