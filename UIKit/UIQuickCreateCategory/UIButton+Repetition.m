//
//  UIButton+Repetition.m
//  button
//
//  Created by 王建 on 15/8/26.
//  Copyright (c) 2015年 sjtd. All rights reserved.
//

#import "UIButton+Repetition.h"
#import <objc/runtime.h>

//@interface UIButton (Repetition)


//@end
@implementation UIButton (Repetition)
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_acceptEventTime = "UIControl_acceptEventTime";
- (NSTimeInterval )cjr_acceptEventInterval{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setCjr_acceptEventInterval:(NSTimeInterval)cjr_acceptEventInterval{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(cjr_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval )cjr_acceptEventTime{
    return [objc_getAssociatedObject(self, UIControl_acceptEventTime) doubleValue];
}

- (void)setCjr_acceptEventTime:(NSTimeInterval)cjr_acceptEventTime{
    objc_setAssociatedObject(self, UIControl_acceptEventTime, @(cjr_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load{
    //获取着两个方法
    Method systemMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    SEL sysSEL = @selector(sendAction:to:forEvent:);
    
    Method myMethod = class_getInstanceMethod(self, @selector(cjr_sendAction:to:forEvent:));
    SEL mySEL = @selector(cjr_sendAction:to:forEvent:);
    
    //添加方法进去
    BOOL didAddMethod = class_addMethod(self, sysSEL, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
    
    //如果方法已经存在了
    if (didAddMethod) {
        class_replaceMethod(self, mySEL, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }else{
        method_exchangeImplementations(systemMethod, myMethod);
        
    }
    
    //----------------以上主要是实现两个方法的互换,load是gcd的只shareinstance，果断保证执行一次
    
}

- (void)cjr_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (NSDate.date.timeIntervalSince1970 - self.cjr_acceptEventTime < self.cjr_acceptEventInterval) {
        return;
    }
    
    if (self.cjr_acceptEventInterval > 0) {
        self.cjr_acceptEventTime = NSDate.date.timeIntervalSince1970;
    }
    
    [self cjr_sendAction:action to:target forEvent:event];
}
@end
//@interface ALViewController ()
//@property (nonatomic, strong) UIButton *;
//@end
//
//@implementation AutoLayoutViewController
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.suggessBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.suggessBtn addTarget:self action:@selector(clickWithInterval:) forControlEvents:UIControlEventTouchUpInside];
//    self.suggessBtn.cjr_acceptEventInterval = 5.0f;
//}
//
//- (void)clickWithInterval:(UIButton *)suButton{
//    NSLog(@"打印出来－－"):
//}
//@end
