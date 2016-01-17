//
//  UINavigationItem+THToolKit.h
//  THToolKitDemo
//
//  Created by viico_mac on 15/3/16.
//  Copyright (c) 2015年 HomTang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (THToolKit)

- (void)th_setLeftBarButtonItem:(UIBarButtonItem *)leftItem offset:(CGFloat)offset;
- (void)th_setRightBarButtonItem:(UIBarButtonItem *)rightItem offset:(CGFloat)offset;

@end
