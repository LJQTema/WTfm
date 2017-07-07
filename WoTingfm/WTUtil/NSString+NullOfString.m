//
//  NSString+NullOfString.m
//  Vickey_NCE
//
//  Created by jq on 16/4/28.
//  Copyright © 2016年 jq. All rights reserved.
//

#import "NSString+NullOfString.h"

@implementation NSString (NullOfString)

+ (NSString *)NULLToString:(id)str {
    
    if (!str || [str isEqual:[NSNull null]]) {
        
        return @"";
    }else {
        
        if ([str isKindOfClass:[NSString class]]) {
            
            NSString *string = (NSString *)str;
            if (!string || string.length <= 0 || [string isEqualToString:@"NULL"] || [string isEqualToString:@"Null"] || [string isEqualToString:@"null"]) {
                
                return @"";
            }
        }else {
            
            return @"";
        }
        
        return str;
    }
}

@end
