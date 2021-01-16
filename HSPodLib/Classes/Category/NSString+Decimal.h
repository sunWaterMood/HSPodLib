//
//  NSString+Decimal.h
//  IOAforPD
//
//  Created by sy on 2018/11/30.
//  Copyright © 2018 sy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Decimal)
+(NSString *)toBinarySystemWithDecimalSystem:(NSString *)decimal;
+(NSString *)getUIType:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
