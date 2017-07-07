//
//  NSString+NullOfString.h
//  Vickey_NCE
//
//  Created by jq on 16/4/28.
//  Copyright © 2016年 jq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NullOfString)

/*
 *  判断字符串是否为nil 或 为NULL
 *  如果是nil NULL Null null  则返回@""
 */
+ (NSString *)NULLToString:(id)str;

@end
