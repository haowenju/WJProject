//
//  WJFileManager.h
//  也去旅游
//
//  Created by apple on 2017/8/9.
//  Copyright © 2017年 lily. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJFileManager : NSFileManager
// Documents：保存应用运行时生成的需要持久化的数据,如数据库
// Library/Caches：一般存储的是缓存文件，例如图片视频等，此目录下的文件不会再应用程序退出时删除。如广告页
// Library/Preferences：包含应用程序的偏好设置文件。您不应该直接创建偏好设置文件，而是应该使用NSUserDefaults类来取得和设置应用程序的偏好.
// tmp：这个目录用于存放临时文件，保存应用程序再次启动过程中不需要的信息。
+ (NSString *)documentsPath;
+ (NSString *)libraryPath;
+ (NSString *)cachesPath;
+ (NSString *)tmpPath;


//返回是否存在一个文件
+ (BOOL)isExistFileWithFilePath:(NSString*)path;

// 是否需要生成一个文件夹 文件
+ (void)createDirectoryWithPathIfNeed:(NSString *)dirPath;
+ (void)createFileWithPathIfNeed:(NSString *)filePath;

// 拷贝
+ (BOOL)copyFileToDocument:(NSString *)toPath from:(NSString*)fromPath;

// 删除文件
+ (void)deleteFileWithPath:(NSString *)filePath;

// 删除沙盒tmp中的视频文件
+ (void)deleteTmpVideoFile;
@end
