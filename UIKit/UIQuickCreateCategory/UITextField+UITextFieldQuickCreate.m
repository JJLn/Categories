//
//  UITextField+UITextFieldQuickCreate.m
//  HotYQ
//
//  Created by gm on 15/2/12.
//  Copyright (c) 2015年 hotyq. All rights reserved.
//

#import "UITextField+UITextFieldQuickCreate.h"

@implementation UITextField (UITextFieldQuickCreate)
+ (id)textField:(CGRect)rect textBorderStyle:(UITextBorderStyle)textBorderStyle font:(UIFont *)font textColor:(UIColor *)textColor withDelegate:(id<UITextFieldDelegate>)sender{
    UITextField *textField = [[UITextField alloc] initWithFrame:rect];
    [textField setBorderStyle:textBorderStyle];
    [textField setFont:font];
    [textField setTextColor:textColor];
    [textField setDelegate:sender];
    return textField;
}

+ (UITextView *)textViewWithRect:(CGRect)rect font:(CGFloat)fontSize text:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)color textEditable:(BOOL)editable dataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes
{
    UITextView * textView = [[UITextView alloc] initWithFrame:rect];
    textView.font = [UIFont systemFontOfSize:fontSize];
    textView.backgroundColor = [UIColor clearColor];
    textView.text = text;
    textView.textAlignment = textAlignment;
    textView.textColor = color;
    textView.editable = editable;
    textView.dataDetectorTypes = dataDetectorTypes;
    return textView;
}

+ (UITextView *)textViewWithRect:(CGRect)rect font:(CGFloat)fontSize text:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)color textEditable:(BOOL)editable
{
    UITextView * textView = [[UITextView alloc] initWithFrame:rect];
    textView.font = [UIFont systemFontOfSize:fontSize];
    textView.backgroundColor = [UIColor clearColor];
    textView.text = text;
    textView.textAlignment = textAlignment;
    textView.textColor = color;
    textView.editable = editable;
    return textView;
}

+ (UITextView *)textViewWithRect:(CGRect)rect font:(CGFloat)fontSize text:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)color
{
    UITextView * textView = [[UITextView alloc] initWithFrame:rect];
    textView.font = [UIFont systemFontOfSize:fontSize];
    textView.backgroundColor = [UIColor clearColor];
    textView.text = text;
    textView.textAlignment = textAlignment;
    textView.textColor = color;
    return textView;
    
}


+ (UITextField*)textFieldWithFrame:(CGRect)frame Text:(NSString*)text BackGroundColor:(UIColor*)backColor delegate:(id)delegate{
    
    UITextField * textField = [[UITextField alloc]initWithFrame:frame];
    
    textField.backgroundColor = backColor;
    textField.enablesReturnKeyAutomatically = YES;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.delegate = delegate;
    textField.text = text;
    [textField becomeFirstResponder];
    
    return textField;
    
}

+ (UITextField*)textFieldWithFrame:(CGRect)frame leftViewPading:(CGFloat)pading PlaceHolder:(NSString*)placeHolder placeHolderFont:(UIFont*)placeHolderFont cornerRadius:(CGFloat)cornerRadius borderWithColor:(UIColor*)borderWithColor delegate:(id)delegate{

    UITextField * textField = [[UITextField alloc]initWithFrame:frame];
    textField.layer.borderWidth = 0.5;
    textField.layer.borderColor = borderWithColor.CGColor;
    textField.layer.cornerRadius = cornerRadius;
    textField.backgroundColor = [UIColor whiteColor];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.enablesReturnKeyAutomatically = YES;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.delegate = delegate;
    textField.placeholder = placeHolder;
    [textField becomeFirstResponder];
    textField.font = placeHolderFont;
    UIView* VIew = [[UIView alloc]initWithFrame:CGRectMake(0, 0, pading, frame.size.height)];
    textField.leftView = VIew;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    return textField;

    
}

@end
