//
//  UIBarButtonItem+QuickCreate.m
//  HYQuan
//
//  Created by J on 15/12/17.
//  Copyright © 2015年 fqah. All rights reserved.
//

#import "UIBarButtonItem+QuickCreate.h"

@implementation UIBarButtonItem (QuickCreate)

+ (UIBarButtonItem*)buttonWithTitle:(NSString*)title image:(NSString*)image backgroundImage:(UIImage*)backImage target:(id)target selector:(SEL)selector{

    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    return item;
}


@end
