//
//  UIView+UIViewQuickCreate.m
//  HotYQ
//
//  Created by gm on 15/2/12.
//  Copyright (c) 2015年 hotyq. All rights reserved.
//

#import "UIView+UIViewQuickCreate.h"
#import "UtilsMacro.h"
@implementation UIView (UIViewQuickCreate)


+ (UIView*)separatorView{//cell分割线
    UIView * SepaView = [[UIView alloc]initWithFrame:CGRectMake(0, 43.5,kScreenWidth, 0.5)];
    SepaView.backgroundColor = [UIColor color_e6e6e6];
    SepaView.backgroundColor = kColor(200, 200, 200);
    return SepaView;
}

@end
