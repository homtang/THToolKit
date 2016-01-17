//
//  NSURL+THToolKit.h
//  TBRun
//
//  Created by viico_mac on 14/12/27.
//  Copyright (c) 2014年 Hao Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (THToolKit)

+ (NSDictionary *)th_parseURLQueryString:(NSString *)queryString;
+ (NSDictionary *)th_parseURLString:(NSString *)urlString;
+ (NSString *)th_hostFromURLString:(NSString *)urlString;
+ (NSString *)th_queryStringFromURLString:(NSString *)urlString;

@end
