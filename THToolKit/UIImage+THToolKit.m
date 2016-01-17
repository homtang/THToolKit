//
//  UIImage+Additions.m
//  TBRun
//
//  Created by viico_mac on 14/11/19.
//  Copyright (c) 2014年 Hao Tang. All rights reserved.
//

#import "UIImage+THToolKit.h"

@implementation UIImage (THToolKit)

+ (UIImage *)th_imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)th_imageWithView:(UIView *)view {
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)th_imageWithTintColor:(UIColor *)tintColor
{
    return [self th_imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *)th_imageWithGradientTintColor:(UIColor *)tintColor
{
    return [self th_imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

- (UIImage *)th_imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

+ (UIImage *)th_screenshot
{
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen]) {
            CGContextSaveGState(context);
            
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            
            CGContextConcatCTM(context, [window transform]);
            
            CGContextTranslateCTM(context,
                                  -[window bounds].size.width * [[window layer] anchorPoint].x,
                                  -[window bounds].size.height * [[window layer] anchorPoint].y);
            
            [[window layer] renderInContext:context];
            
            CGContextRestoreGState(context);
        }
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)th_clipImageInRect:(CGRect)rect {
    CGRect clippedRect = CGRectMake(rect.origin.x * self.scale, rect.origin.y * self.scale,
                                    rect.size.width * self.scale, rect.size.height * self.scale);
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], clippedRect);
    UIImage *subImage = [UIImage imageWithCGImage:imageRef
                                            scale:self.scale
                                      orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return subImage;
}

- (UIImage *)th_combineToImage:(UIImage *)image atRect:(CGRect)rect {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [self drawInRect:rect];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}

@end
