//
//  UITextField+UITextFieldQuickCreate.h
//  HotYQ
//
//  Created by gm on 15/2/12.
//  Copyright (c) 2015年 hotyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (UITextFieldQuickCreate)
+ (id)textField:(CGRect)rect textBorderStyle:(UITextBorderStyle)textBorderStyle font:(UIFont *)font textColor:(UIColor *)textColor withDelegate:(id<UITextFieldDelegate>)sender;
+ (UITextView *)textViewWithRect:(CGRect)rect font:(CGFloat)fontSize text:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)color textEditable:(BOOL)editable dataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes;
+ (UITextView *)textViewWithRect:(CGRect)rect font:(CGFloat)fontSize text:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)color textEditable:(BOOL)editable;
+ (UITextView *)textViewWithRect:(CGRect)rect font:(CGFloat)fontSize text:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)color;


+ (UITextField*)textFieldWithFrame:(CGRect)frame Text:(NSString*)text BackGroundColor:(UIColor*)backColor delegate:(id)delegate;

+ (UITextField*)textFieldWithFrame:(CGRect)frame leftViewPading:(CGFloat)pading PlaceHolder:(NSString*)placeHolder placeHolderFont:(UIFont*)placeHolderFont cornerRadius:(CGFloat)cornerRadius borderWithColor:(UIColor*)borderWithColor delegate:(id)delegate;
@end
