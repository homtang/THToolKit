//
//  NSURL+THToolKit.m
//  TBRun
//
//  Created by viico_mac on 14/12/27.
//  Copyright (c) 2014年 Hao Tang. All rights reserved.
//

#import "NSURL+THToolKit.h"

@implementation NSURL (THToolKit)

+ (NSDictionary *)th_parseURLQueryString:(NSString *)queryString {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSArray *pairs = [queryString componentsSeparatedByString:@"&"];
    for(NSString *pair in pairs) {
        NSArray *keyValue = [pair componentsSeparatedByString:@"="];
        if([keyValue count] == 2) {
            NSString *key = [keyValue objectAtIndex:0];
            NSString *value = [keyValue objectAtIndex:1];
            value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            if(key && value)
                [dict setObject:value forKey:key];
        }
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}

+ (NSDictionary *)th_parseURLString:(NSString *)urlString {
    NSString *queryString = [NSURL th_queryStringFromURLString:urlString];
    return [NSURL th_parseURLQueryString:queryString];
}

+ (NSString *)th_hostFromURLString:(NSString *)urlString {
    NSArray *components = [urlString componentsSeparatedByString:@"?"];
    if (components.count > 0) {
        return components[0];
    }
    return @"";
}

+ (NSString *)th_queryStringFromURLString:(NSString *)urlString {
    NSArray *components = [urlString componentsSeparatedByString:@"?"];
    if (components.count > 1) {
        return components[1];
    }
    return @"";
}

@end
