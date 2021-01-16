//
//  NSData+Util.m
//  IOA
//
//  Created by sy on 2019/5/29.
//  Copyright © 2019 sy. All rights reserved.
//

#import "NSData+Util.h"

@implementation NSData (Util)
+(NSData *)convertHexStrToData:(NSString *)str{
    if (!str || [str length] == 0) {
        return nil;
    }
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0){
        range = NSMakeRange(0, 2);
    } else range = NSMakeRange(0, 1);
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        range.location += range.length;
        range.length = 2;
    }
//    NSSLog(@"hexdata: %@", hexData);
    NSMutableData *data = [[NSMutableData alloc]init];
    if (4 - hexData.length > 0) {
        for (NSInteger i = 0; i < 4 - hexData.length; i++) {
            Byte dataByte[] = {0x00};
            [data appendBytes:dataByte length:1];
        }
    }
    [data appendData:hexData];
    return data;
}
@end
