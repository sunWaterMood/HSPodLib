//
//  NSString+Util.h
//  IOAforPD
//
//  Created by sy on 2018/12/4.
//  Copyright © 2018 sy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Util)
+(BOOL)isString:(NSString *)str;
+ (NSString *)transformPinYinWithString:(NSString *)chinese;
+(NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr;
+(NSString *)getIdentityCardAge:(NSString *)numberStr;
@end

NS_ASSUME_NONNULL_END
