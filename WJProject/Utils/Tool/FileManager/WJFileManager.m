//
//  WJFileManager.m
//  也去旅游
//
//  Created by apple on 2017/8/9.
//  Copyright © 2017年 lily. All rights reserved.
//

#import "WJFileManager.h"

@implementation WJFileManager

+ (instancetype)shareWJFileManager
{
    static WJFileManager *manager;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = (WJFileManager*)[WJFileManager defaultManager];
    });
    
    return manager;
}

+ (NSString *)pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSString *)documentsPath {
    return [self pathForDirectory:NSDocumentDirectory];
}
+ (NSString *)libraryPath {
    return [self pathForDirectory:NSLibraryDirectory];
}
+ (NSString *)cachesPath {
    return [self pathForDirectory:NSCachesDirectory];
}
+ (NSString *)tmpPath {
    return NSTemporaryDirectory();
}


+ (BOOL)isExistFileWithFilePath:(NSString*)path
{
    WJFileManager *manager = [WJFileManager shareWJFileManager];
    if ([manager fileExistsAtPath:path] ) {
        return YES;
    }
    return NO;
}


+ (void)createDirectoryWithPathIfNeed:(NSString *)dirPath {
    WJFileManager *manager = [WJFileManager shareWJFileManager];
    if (![manager fileExistsAtPath:dirPath]) {
        NSError *error;
        BOOL rc = [manager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
        if (!rc) {
            NSLog(@"%@", error);
        }
    }
}

+ (void)createFileWithPathIfNeed:(NSString *)filePath {
    WJFileManager *manager = [WJFileManager shareWJFileManager];
    if (![manager fileExistsAtPath:filePath]) {
        [manager createFileAtPath:filePath contents:nil attributes:nil];
    }
}


+ (BOOL)copyFileToDocument:(NSString *)toPath from:(NSString*)fromPath
{
     WJFileManager *manager = [WJFileManager shareWJFileManager];
    BOOL result = NO;
    // 如果不存在则copy文件
    if (![self isExistFileWithFilePath:toPath]) {
        NSError *error;
        result = [manager copyItemAtPath:fromPath toPath:toPath error:&error];
        if (result) {
            NSLog(@"✅copy item success");
        }
        else{
            NSLog(@"❌copy item false : %@",error);
        }
    }else{
        NSLog(@"❗️The Database is already exists");
    }
    return result;
}

+ (void)deleteFileWithPath:(NSString *)filePath {
    WJFileManager *manager = [WJFileManager shareWJFileManager];
    [manager removeItemAtPath:filePath error:nil];
}

+ (void)deleteTmpVideoFile {
    WJFileManager *manager = [WJFileManager shareWJFileManager];
    NSString *tmpPath = [WJFileManager tmpPath];
    NSArray *contents = [manager contentsOfDirectoryAtPath:tmpPath error:nil];
    NSEnumerator *e = [contents objectEnumerator];
    NSString *filename;
    while (filename = [e nextObject]) {
        if ([[filename pathExtension] isEqualToString:@"mp4"] || [[filename pathExtension] isEqualToString:@"MOV"] || [[filename pathExtension] isEqualToString:@"mov"]) {
            [manager removeItemAtPath:[tmpPath stringByAppendingPathComponent:filename] error:nil];
        }
    }
}
@end
