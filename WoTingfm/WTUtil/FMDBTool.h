//
//  FMDBTool.h
//  WOTING
//
//  Created by jq on 2017/2/10.
//  Copyright © 2017年 jq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface FMDBTool : NSObject

+(FMDatabase *)createDatabaseAndTable:(NSString *)tableName;     //创建并打开数据库


+(FMDatabase *)createXiaZaiAndTableName:(NSString *)tableName;      //创建下载列表入库
@end

/** 
 
 [Changedict setValue: [NSString NULLToString:dict[@"ContentTimes"]] forKey:@"ContentTimes"];
 [Changedict setValue:[NSString NULLToString:dict[@"ContentPub"]] forKey:@"ContentPub"];
 [Changedict setValue:[NSString NULLToString:dict[@"ContentShareURL"]] forKey:@"ContentShareURL"];
 [Changedict setValue:[NSString NULLToString:dict[@"MediaType"]] forKey:@"MediaType"];
 [Changedict setValue:[NSString NULLToString:dict[@"ContentName"]] forKey:@"ContentName"];
 [Changedict setValue:[NSString NULLToString:dict[@"ContentImg"]] forKey:@"ContentImg"];
 [Changedict setValue:[NSString NULLToString:dict[@"ContentId"]] forKey:@"ContentId"];
 [Changedict setValue:[NSString NULLToString:dict[@"PlayCount"]] forKey:@"PlayCount"];

 [Changedict setValue:[NSString NULLToString:dict[@"SeqInfo"][@"ContentId"]] forKey:@"SeqContentId"];
 [Changedict setValue:[NSString NULLToString:dict[@"SeqInfo"][@"ContentImg"]] forKey:@"SeqContentImg"];
 [Changedict setValue:[NSString NULLToString:dict[@"SeqInfo"][@"ContentName"]] forKey:@"SeqContentName"];
 [Changedict setValue:[NSString NULLToString:dict[@"SeqInfo"][@"ContentPub"]] forKey:@"SeqContentPub"];
 
 */
