//
//  UIButton+Repetition.h
//  button
//
//  Created by 王建 on 15/8/26.
//  Copyright (c) 2015年 sjtd. All rights reserved.
/*
 给button 添加一个延时点击  防止段时间内多次点击
 */

#import <UIKit/UIKit.h>

@interface UIButton (Repetition)

@property (nonatomic, assign) NSTimeInterval cjr_acceptEventInterval;// 可以用这个给重复点击加间隔
//@property (nonatomic, assign) NSTimeInterval cjr_acceptEventInterval;// 可以用这个给重复点击加间隔

@property (nonatomic, assign) NSTimeInterval cjr_acceptEventTime;

@end
