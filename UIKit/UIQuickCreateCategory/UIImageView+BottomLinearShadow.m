//
//  UIImageView+BottomLinearShadow.m
//  HelloWorld
//
//  Created by gm on 15/5/21.
//  Copyright (c) 2015年 gm. All rights reserved.
//

#import "UIImageView+BottomLinearShadow.h"

@implementation UIImageView (BottomLinearShadow)

+ (UIImageView *)imageViewWithFrame:(CGRect)rect imageURL:(NSString *)url name:(NSString *)name {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    [imageView sd_setImageWithURL:url.url placeholderImage:nil];
    [imageView setUserInteractionEnabled:YES];
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, imageView.bounds.size.height-20, imageView.frame.size.width, 20)];
    [UIImageView addShadowWithColor:[UIColor blackColor] inView:maskView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 2, imageView.frame.size.width, 20)];
    [nameLabel setText:name];
    [nameLabel setFont:[UIFont systemFontOfSize:10]];
    [nameLabel setTextColor:[UIColor whiteColor]];
    [nameLabel setTextAlignment:NSTextAlignmentCenter];
    [maskView addSubview:nameLabel];
    
    [imageView addSubview:maskView];
    return imageView;
}


+ (void)addShadowWithColor:(UIColor *)color inView:(UIView *)view
{
    [self addGradientLayer:view color:color];
}

+ (void)addGradientLayer:(UIView *)view color:(UIColor *)color
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.layer.bounds;
    
    CGFloat hue, saturation, brightness;
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:nil];
    
    
    NSMutableArray *colorArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 15; i++) {
        [colorArray addObject:(id)[UIColor colorWithHue:hue saturation:saturation brightness:0.2 alpha:(0.09*i)].CGColor];
    }
    
    gradientLayer.colors = colorArray;
    
    gradientLayer.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.1],
                               [NSNumber numberWithFloat:0.2],
                               [NSNumber numberWithFloat:0.3],
                               [NSNumber numberWithFloat:0.4],
                               [NSNumber numberWithFloat:0.5],
                               [NSNumber numberWithFloat:0.6],
                               [NSNumber numberWithFloat:0.7],
                               [NSNumber numberWithFloat:0.8],
                               [NSNumber numberWithFloat:0.9],
                               [NSNumber numberWithFloat:1.0],
                               [NSNumber numberWithFloat:1.1],
                               [NSNumber numberWithFloat:1.2],
                               [NSNumber numberWithFloat:1.5],
                               [NSNumber numberWithFloat:1.5],
                               [NSNumber numberWithFloat:1.5],
                               nil];
    
    view.layer.sublayers = nil;
    [view.layer addSublayer:gradientLayer];
}


+ (UIView *)addShadowWithColor:(UIColor *)color frame:(CGRect)frame
{
    UIView *maskView = [[UIView alloc] initWithFrame:frame];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = maskView.layer.bounds;
    
    CGFloat hue, saturation, brightness;
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:nil];
    
    
    NSMutableArray *colorArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 15; i++) {
        [colorArray addObject:(id)[UIColor colorWithHue:hue saturation:saturation brightness:0.2 alpha:(0.09*i)].CGColor];
    }
    
    gradientLayer.colors = colorArray;
    
    gradientLayer.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.1],
                               [NSNumber numberWithFloat:0.2],
                               [NSNumber numberWithFloat:0.3],
                               [NSNumber numberWithFloat:0.4],
                               [NSNumber numberWithFloat:0.5],
                               [NSNumber numberWithFloat:0.6],
                               [NSNumber numberWithFloat:0.7],
                               [NSNumber numberWithFloat:0.8],
                               [NSNumber numberWithFloat:0.9],
                               [NSNumber numberWithFloat:1.0],
                               [NSNumber numberWithFloat:1.1],
                               [NSNumber numberWithFloat:1.2],
                               [NSNumber numberWithFloat:1.5],
                               [NSNumber numberWithFloat:1.5],
                               [NSNumber numberWithFloat:1.5],
                               nil];
    
    maskView.layer.sublayers = nil;
    [maskView.layer addSublayer:gradientLayer];
    
    return maskView;
}



@end
