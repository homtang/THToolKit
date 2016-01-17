//
//  UINavigationItem+THToolKit.m
//  THToolKitDemo
//
//  Created by viico_mac on 15/3/16.
//  Copyright (c) 2015年 HomTang. All rights reserved.
//

#import "UINavigationItem+THToolKit.h"

@implementation UINavigationItem (THToolKit)

- (void)th_setLeftBarButtonItem:(UIBarButtonItem *)leftItem offset:(CGFloat)offset {
    UIBarButtonItem *separator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    separator.width = offset;
    if (leftItem) {
        [self setLeftBarButtonItems:@[separator, leftItem]];
    }
    else {
        [self setLeftBarButtonItems:@[separator]];
    }
}

- (void)th_setRightBarButtonItem:(UIBarButtonItem *)rightItem offset:(CGFloat)offset {
    UIBarButtonItem *separator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    separator.width = offset;
    if (rightItem) {
        [self setRightBarButtonItems:@[rightItem, separator]];
    }
    else {
        [self setRightBarButtonItems:@[separator]];
    }
}

@end
