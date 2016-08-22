//
//  UIImageView+BottomLinearShadow.h
//  HelloWorld
//
//  Created by gm on 15/5/21.
//  Copyright (c) 2015年 gm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (BottomLinearShadow)

+ (UIView *)addShadowWithColor:(UIColor *)color frame:(CGRect)frame;

@end
