//
//  NSString+String.h
//  wg
//
//  Created by h on 2017/8/17.
//  Copyright © 2017年 wggyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (String)
/**获得字符串的大小*/

-(CGSize)getSizeOfStringWihtFont:(int)fontSize addMaxSize:(CGSize)maxSize;
-(CGSize)getSizeOfStringWihtBoldFont:(int)fontSize addMaxSize:(CGSize)maxSize;
/**
 字典 to json
 
 
 */
+(NSString *)HS_JSONString:(NSDictionary *)dict;

/**
 json to 字典


 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/**
 *  MD5加密, 32位 小写
 *
 *  @param str 传入要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)MD5ForLower32Bate:(NSString *)str;

/**
 *  MD5加密, 32位 大写
 *
 *  @param str 传入要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)MD5ForUpper32Bate:(NSString *)str;

/**
 *  MD5加密, 16位 小写
 *
 *  @param str 传入要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)MD5ForLower16Bate:(NSString *)str;

/**
 *  MD5加密, 16位 大写
 *
 *  @param str 传入要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)MD5ForUpper16Bate:(NSString *)str;
//转十六进制
+(NSString *)ToHex:(long long int)tmpid;
+(NSString *) pinyinFirstLetter:(NSString*)sourceString;
+(NSString *)hashFormString:(NSString *)str;
@end
