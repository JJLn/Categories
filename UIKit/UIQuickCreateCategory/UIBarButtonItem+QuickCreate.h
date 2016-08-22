//
//  UIBarButtonItem+QuickCreate.h
//  HYQuan
//
//  Created by J on 15/12/17.
//  Copyright © 2015年 fqah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (QuickCreate)

+ (UIBarButtonItem*)buttonWithTitle:(NSString*)title image:(NSString*)image backgroundImage:(UIImage*)backImage target:(id)target selector:(SEL)selector;

@end
