//
//  NSData+Util.h
//  IOA
//
//  Created by sy on 2019/5/29.
//  Copyright © 2019 sy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Util)
+(NSData *)convertHexStrToData:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
