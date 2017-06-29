//
//  FMDBTool.m
//  WOTING
//
//  Created by jq on 2017/2/10.
//  Copyright © 2017年 jq. All rights reserved.
//

#import "FMDBTool.h"

@implementation FMDBTool


+(FMDatabase *)createDatabaseAndTable:(NSString *)tableName{
    
    NSString *fileName = [kDocumentPath stringByAppendingPathComponent:@"WoTing.db"];
    NSLog(@"%@",fileName);
    FMDatabase *database;
    BOOL isOK = false ;
    //yes 打开数据库 No 建表
        
    //根据路径创建数据库
    database = [FMDatabase databaseWithPath:fileName];
    
    if ([database open])
    {
        FMResultSet *rs = [database executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
        while ([rs next])
        {
            // just print out what we've got in a number of formats.
            NSInteger count = [rs intForColumn:@"count"];
            
            if (0 == count)
            {
                isOK = NO;
            }
            else
            {
                isOK = YES;
            }
        }
        if (isOK) {
            
            NSLog(@"打开数据库成功");
        }else if ([tableName isEqualToString:@"XIAZAI"]){
            
            //创表
            NSString *Name = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@Num text, %@ id,  %@BOOL text );",tableName, tableName, tableName, tableName];
            
            BOOL result = [database executeUpdate:Name];
            if (result)
            {
                NSLog(@"创建表成功");
            }
            
        }else{
            //创表
            NSString *Name = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@ id);",tableName, tableName];
            
            BOOL result = [database executeUpdate:Name];
            if (result)
            {
                NSLog(@"创建表成功");
            }
        }
    }
    
    return database;
}

+(FMDatabase *)createXiaZaiAndTableName:(NSString *)tableName {
    
    NSString *fileName = [kDocumentPath stringByAppendingPathComponent:@"WoTing.db"];
    NSLog(@"%@",fileName);
    FMDatabase *database;
    BOOL isOK = false ;
    //yes 打开数据库 No 建表
    
    //根据路径创建数据库
    database = [FMDatabase databaseWithPath:fileName];
    
    if ([database open])
    {
        FMResultSet *rs = [database executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
        while ([rs next])
        {
            // just print out what we've got in a number of formats.
            NSInteger count = [rs intForColumn:@"count"];
            
            if (0 == count)
            {
                isOK = NO;
            }
            else
            {
                isOK = YES;
            }
        }
        if (isOK) {
            
            NSLog(@"打开数据库成功");
        }else{
            //4.创表
            NSString *Name = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' (ContentTimes TEXT, ContentPub TEXT, ContentShareURL TEXT, MediaType TEXT, ContentName TEXT, ContentImg TEXT, ContentId TEXT, PlayCount TEXT, SeqContentId TEXT, SeqContentImg TEXT, SeqContentName TEXT, SeqContentPub TEXT );",tableName];
            
            BOOL result = [database executeUpdate:Name];
            if (result)
            {
                NSLog(@"创建表成功");
            }
        }
    }
    
    return database;
    
}

@end
