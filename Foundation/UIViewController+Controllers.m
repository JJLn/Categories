//
//  UIViewController+Controllers.m
//  QianNiu
//
//  Created by wangjian on 16/5/10.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import "UIViewController+Controllers.h"
#import <objc/runtime.h>

@implementation UIViewController (Controllers)

+ (void)load
{
    /** 获取原始setBackgroundColor方法 */
    Method originalM = class_getInstanceMethod([self class], @selector(viewWillAppear:));
    
    /** 获取自定义的pb_setBackgroundColor方法 */
    Method exchangeM = class_getInstanceMethod([self class], @selector(sdviewWillAppear:));
    
    /** 交换方法 */
    method_exchangeImplementations(originalM, exchangeM);
    
    Method originalMethod = class_getInstanceMethod([self class], @selector(viewWillDisappear:));
    /** 获取自定义的pb_setBackgroundColor方法 */
    Method exchangeMethod = class_getInstanceMethod([self class], @selector(sdviewWillDisappear:));
    /** 交换方法 */
    method_exchangeImplementations(originalMethod, exchangeMethod);
    
    
   }

-(void)sdviewWillAppear:(BOOL)animated {
    
    [self sdviewWillAppear:animated];

    NSLog(@"in------%@------",[self class]);
}

- (void)sdviewWillDisappear:(BOOL)animated
{
    [self sdviewWillDisappear:animated];

}
@end
