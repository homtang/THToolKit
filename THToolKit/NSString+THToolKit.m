//
//  NSString+THToolKit.m
//  TBRun
//
//  Created by viico_mac on 14/12/3.
//  Copyright (c) 2014年 Hao Tang. All rights reserved.
//

#import "NSString+THToolKit.h"

@implementation NSString (THToolKit)

- (CGSize)th_sizeWithFont:(UIFont *)font width:(CGFloat)width {
    CGSize stringSize = CGSizeZero;
    NSString *theString = self;
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    
    // Fix iOS8 problem
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) {
        if (self.length > 2) {
            if ([[self substringFromIndex:self.length - 2] isEqualToString:@"\r\n"]) {
                theString = [self substringToIndex:self.length - 2];
            }
        } else if ([self isEqualToString:@"\r\n"]) {
            theString = @"";
        }
    }
    
    if ([theString respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        stringSize = [theString boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                             options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
        stringSize=[theString sizeWithFont:font
                         constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                             lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    }
    return stringSize;
}

- (BOOL)th_isNumber {
    NSString *numberRegex = @"^\\d+$";
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    if ([phonePredicate evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

- (NSString *)th_stringByStrippingHTML {
    NSRange range;
    NSString *result = self;
    while ((range = [result rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        result = [result stringByReplacingCharactersInRange:range withString:@""];
    return result;
}

@end
