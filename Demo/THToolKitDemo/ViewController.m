//
//  ViewController.m
//  THToolKitDemo
//
//  Created by viico_mac on 15/1/12.
//  Copyright (c) 2015年 HomTang. All rights reserved.
//

#import "ViewController.h"
#import "THToolKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                 style:UIBarButtonItemStyleBordered
                                                                target:self
                                                                action:nil];
    [self.navigationItem th_setLeftBarButtonItem:leftItem offset:12];
}

@end
