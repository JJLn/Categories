//
//  UIImage+Color.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)placeholderImage;

+ (UIImage *)placeholderClearImage;
+ (UIImage *)placeholderDefaultImage;
- (UIColor *)colorAtPoint:(CGPoint )point;
//more accurate method ,colorAtPixel 1x1 pixel
- (UIColor *)colorAtPixel:(CGPoint)point;
//返回该图片是否有透明度通道
- (BOOL)hasAlphaChannel;

+ (UIImage *)placeholderHanderImage;
- (NSInteger)length;
///返回一张灰度图片
+ (UIImage*)getGrayImage:(UIImage*)sourceImage;
+ (UIImage*) imageBlackToTransparent:(UIImage*) image;
//模糊
+ (UIImage *)gaussianBlur:(UIImage *)image;

@end
