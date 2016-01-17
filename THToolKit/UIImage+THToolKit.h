//
//  UIImage+Additions.h
//  TBRun
//
//  Created by viico_mac on 14/11/19.
//  Copyright (c) 2014年 Hao Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (THToolKit)

+ (UIImage *)th_screenshot;
+ (UIImage *)th_imageWithView:(UIView *)view;
+ (UIImage *)th_imageWithColor:(UIColor *)color;

- (UIImage *)th_imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)th_imageWithGradientTintColor:(UIColor *)tintColor;
- (UIImage *)th_clipImageInRect:(CGRect)rect;
- (UIImage *)th_combineToImage:(UIImage *)image atRect:(CGRect)rect;

@end
