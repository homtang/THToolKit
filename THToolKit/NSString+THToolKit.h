//
//  NSString+THToolKit.h
//  TBRun
//
//  Created by viico_mac on 14/12/3.
//  Copyright (c) 2014年 Hao Tang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (THToolKit)

- (CGSize)th_sizeWithFont:(UIFont *)font width:(CGFloat)width;
- (BOOL)th_isNumber;
- (NSString *)th_stringByStrippingHTML;

@end
