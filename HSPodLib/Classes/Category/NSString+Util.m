//
//  NSString+Util.m
//  IOAforPD
//
//  Created by sy on 2018/12/4.
//  Copyright © 2018 sy. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)
+(BOOL)isString:(NSString *)str{
    if(str == nil) return NO;
    if ([str isEqual:[NSNull null]]) return NO;
    if (str.length <= 0) return NO;
    return YES;
}
+ (NSString *)transformPinYinWithString:(NSString *)chinese
{
     NSString  * pinYinStr = [NSString string];
    if (chinese.length){
        NSMutableString * pinYin = [[NSMutableString alloc]initWithString:chinese];
        //1.先转换为带声调的拼音
        if(CFStringTransform((__bridge CFMutableStringRef)pinYin, NULL, kCFStringTransformMandarinLatin, NO)) {
            NSLog(@"带声调的pinyin: %@", pinYin);
        }
        //2.再转换为不带声调的拼音
        if (CFStringTransform((__bridge CFMutableStringRef)pinYin, NULL, kCFStringTransformStripDiacritics, NO)) {
            NSLog(@"不带声调的pinyin: %@", pinYin);
        }
        //3.去除掉首尾的空白字符和换行字符
        pinYinStr = [pinYin stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        //4.去除掉其它位置的空白字符和换行字符
        pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"去掉空白字符和换行字符的pinyin: %@", pinYinStr);
        [pinYinStr capitalizedString];

    }
    return pinYinStr;
}
//根据身份证号获取生日
+(NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr
{
NSMutableString *result = [NSMutableString stringWithCapacity:0];
NSString *year = nil;
NSString *month = nil;

BOOL isAllNumber = YES;
NSString *day = nil;
if([numberStr length]<14)
return result;

//**截取前14位
NSString *fontNumer = [numberStr substringWithRange:NSMakeRange(0, 13)];

//**检测前14位否全都是数字;
const char *str = [fontNumer UTF8String];
const char *p = str;
while (*p!='\0') {
if(!(*p>='0'&&*p<='9'))
isAllNumber = NO;
p++;
}
if(!isAllNumber)
return result;

year = [numberStr substringWithRange:NSMakeRange(6, 4)];
month = [numberStr substringWithRange:NSMakeRange(10, 2)];
day = [numberStr substringWithRange:NSMakeRange(12,2)];

[result appendString:year];
[result appendString:@"-"];
[result appendString:month];
[result appendString:@"-"];
[result appendString:day];
return result;
}
//根据省份证号获取年龄
+(NSString *)getIdentityCardAge:(NSString *)numberStr
{

NSDateFormatter *formatterTow = [[NSDateFormatter alloc]init];
[formatterTow setDateFormat:@"yyyy-MM-dd"];
NSDate *bsyDate = [formatterTow dateFromString:[self birthdayStrFromIdentityCard:numberStr]];

NSTimeInterval dateDiff = [bsyDate timeIntervalSinceNow];

int age = trunc(dateDiff/(60*60*24))/365;

return [NSString stringWithFormat:@"%d",-age];
}
@end
