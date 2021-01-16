//
//  NSDate+Util.m
//  IOAforPD
//
//  Created by sy on 2018/11/30.
//  Copyright © 2018 sy. All rights reserved.
//

#import "NSDate+Util.h"

@implementation NSDate (Util)
- (NSString *)transformToFuzzyDate {
    NSDate *nowDate = [NSDate date];
    
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //  通过已定义的日历对象，获取某个时间点的NSDateComponents表示，并设置需要表示哪些信息（NSYearCalendarUnit, NSMonthCalendarUnit, NSDayCalendarUnit等）
    NSDateComponents *nowDateComponents = [greCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear fromDate:nowDate];
    NSDateComponents *selfDateComponents = [greCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear fromDate:self];
    
    NSDateComponents *weeDateComponents = [[NSDateComponents alloc] init];
    [weeDateComponents setCalendar:[NSCalendar currentCalendar]];
    weeDateComponents.year = selfDateComponents.year;
    weeDateComponents.month = selfDateComponents.month;
    weeDateComponents.day = selfDateComponents.day;
    weeDateComponents.hour = 0;
    weeDateComponents.minute = 0;
    weeDateComponents.second = 0;
    
    NSDate *weeDate = [weeDateComponents date];
    NSInteger timeInterval = [nowDate timeIntervalSinceDate:weeDate];
    
    //小时：分钟
    NSString *lastComponents = nil;
    NSInteger hour = selfDateComponents.hour;
    
    if (selfDateComponents.minute < 10) {
        lastComponents = [NSString stringWithFormat:@"%li:0%li", (long)hour, (long)selfDateComponents.minute];
    } else {
        lastComponents = [NSString stringWithFormat:@"%li:%li", (long)hour, (long)selfDateComponents.minute];
    }
    
    NSUInteger selfTnterval = [nowDate timeIntervalSinceDate:self];
    if (selfTnterval < 3 * 60) {//三分钟内
        return @"刚刚";
    } else if (selfTnterval < 60 * 60) {//一小时内
        NSString *dateString = [NSString stringWithFormat:@"%lu分钟前", selfTnterval / 60];
        return dateString;
    } else if (selfTnterval < 24 * 60 * 60 && nowDateComponents.day == selfDateComponents.day) {//24小时内
        NSString *dateString = [NSString stringWithFormat:@"%lu小时前", selfTnterval / (60 * 60)];
        return dateString;
    } else if (timeInterval < 48 * 60 * 60) {//48小时内
        NSString *dateString = [NSString stringWithFormat:@"昨天 %@", lastComponents];
        return dateString;
    } else if (nowDateComponents.year == selfDateComponents.year && nowDateComponents.weekOfYear == selfDateComponents.weekOfYear) {//在一年中的同一个周中
        NSArray *weekdays = @[@"temp", @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
        NSString *dateString = weekdays[selfDateComponents.weekday];
        return dateString;
    } else if ([self timeIntervalSince1970] == 0) {
        return nil;
    } else {
        if (nowDateComponents.year == selfDateComponents.year) {//同一年不展示年份
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"M月d日"];
            NSString *dateString = [dateFormatter stringFromDate:self];
            return dateString;
        } else {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy/M/d"];
            NSString *dateString = [dateFormatter stringFromDate:self];
            return dateString;
        }
    }
}
+ (NSString *)time_dateToString:(NSDate *)date{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString* string=[dateFormat stringFromDate:date];
    return string;
}
+(NSString *)time_dateToyyyy_M_d:(NSDate *)date{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
       [dateFormat setDateFormat:@"yyyy年M月d日"];
       NSString* string=[dateFormat stringFromDate:date];
       return string;
}
+ (NSString *)time_dateSecondToString:(NSDate *)date{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"HH:mm"];
    NSString* string=[dateFormat stringFromDate:date];
    return string;
}
+(NSString *)time_yyyy_MM:(NSDate *)date{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM"];
    NSString* string=[dateFormat stringFromDate:date];
    return string;
}
+(NSString *)time_yyyy:(NSDate *)date{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy"];
    NSString* string=[dateFormat stringFromDate:date];
    return string;
}
+(NSString *)yyyy_MM:(NSDate *)date{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy/MM"];
    NSString* string=[dateFormat stringFromDate:date];
    return string;
}
+(NSString *)currentDate{
    NSDate *date = [NSDate date];
    return [self time_dateToString:date];
}
+(NSString *)currentTimeDate{
    NSDate *date = [NSDate date];
    return [self getdate_timeToString:date];
}
+(NSString *)currentTimeS{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString* string=[dateFormat stringFromDate:[NSDate date]];
    return string;
}
//获取当前时间桌
+(NSInteger)getNowTimeTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
//    //设置时区,这个对于时间的处理有时很重要
//
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//
//    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
//    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
    

    return timeSp;
    
}
+(NSInteger)cacalTimeChaStartTime:(NSInteger)startTime withEndTime:(NSInteger)endTime{
    NSInteger cha = endTime - startTime;
    return cha;
}
//  转化时间
+(NSString *)timeWithTimeIntervalString:(NSInteger)time
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:time];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
//  转化时间
+(NSString *)timeWithNormalTimeIntervalString:(NSInteger)time
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:time];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+(NSInteger)timeSwitchTimestampMiao:(NSString *)formatTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue]*1000;
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    return timeSp;
}
#pragma mark - 将某个时间转化成 时间戳

+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue]*1000;
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    return timeSp;
}
+(NSDate *)timeConverDate:(NSString *)timeString forFormat:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:timeString]; //------------将字符串按formatter转成nsdate
    return date;
}
+(NSDate *)timeStringConvertToDate:(NSString *)formatTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    return date;
}
+(NSDate *)timeStringConvertToyyyy_MM_dd:(NSString *)formatTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    return date;
}
+(NSDate *)timeDateConvertToyyyy_M_d:(NSString *)formatTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年M月d日"]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    return date;
}

+(NSInteger)timeSwitchTimestampSecond:(NSString *)formatTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue]*1000;
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    return timeSp;
}
//当前时间的前几天，几个月，几年
+(NSString *)calcDateFor:(NSInteger)day withDate:(NSDate *)date{
//    NSDate * mydate = [NSDate date];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    NSString *currentDateStr = [dateFormatter stringFromDate:date];
//    DebugLog(@"---当前的时间的字符串 =%@",currentDateStr);
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:date];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:0];
    
    [adcomps setMonth:0];
    
    [adcomps setDay:day];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:date options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    return beforDate;
}
+(NSString *)calcDateForHour:(NSInteger)hour withDate:(NSDate *)date{
    //    NSDate * mydate = [NSDate date];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    //    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    //    DebugLog(@"---当前的时间的字符串 =%@",currentDateStr);
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:date];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:0];
    
    [adcomps setMonth:0];
    
    [adcomps setDay:0];
    [adcomps setHour:hour];
    
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:date options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    return beforDate;
}
+(NSString *)calcDateForMinute:(NSInteger)minute withDate:(NSDate *)date{
    //    NSDate * mydate = [NSDate date];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    //    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    //    DebugLog(@"---当前的时间的字符串 =%@",currentDateStr);
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:date];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:0];
    
    [adcomps setMonth:0];
    
    [adcomps setDay:0];
    [adcomps setHour:0];
    [adcomps setMinute:minute];
    
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:date options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    return beforDate;
}

+(NSString *)timeStampToDate:(NSString *)timestamp{
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    = [timestamp doubleValue] / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateString  = [formatter stringFromDate: date];
    return dateString;
}
+(NSString *)timeStampMonthDayToDate:(NSString *)timestamp{
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    = [timestamp doubleValue] / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd HH:mm"];
    NSString *dateString  = [formatter stringFromDate: date];
    return dateString;
}
+(NSString *)timeStampYearToDate:(NSString *)timestamp{
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    = [timestamp doubleValue] / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *dateString  = [formatter stringFromDate: date];
    return dateString;
}
+ (NSString *)getdate_timeToString:(NSDate *)date{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString* string=[dateFormat stringFromDate:date];
    return string;
}
+(NSString *)getWeakOneDay{
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:nowDate];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取几天是几号
    NSInteger day = [comp day];
    NSSLog(@"%ld----%ld",(long)weekDay,(long)day);
    // 计算当前日期和本周的星期一和星期天相差天数
    long firstDiff,lastDiff = 0;
    //    weekDay = 1;
    if (weekDay == 1)
    {
        firstDiff = -6;
    }
    else
    {
        firstDiff = [calendar firstWeekday] - weekDay + 1;
    }
    NSSLog(@"firstDiff: %ld   lastDiff: %ld",firstDiff,lastDiff);
    
    // 在当前日期(去掉时分秒)基础上加上差的天数
    NSDateComponents *firstDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay  fromDate:nowDate];
    [firstDayComp setDay:day + firstDiff];
    NSDate *firstDayOfWeek = [calendar dateFromComponents:firstDayComp];
    
    NSSLog(@"=======%@",firstDayComp);
    
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[firstDayOfWeek timeIntervalSince1970]] integerValue]*1000;
    return [NSString stringWithFormat:@"%ld",timeSp];
}
+(NSString *)getWeakOneDayTime{
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:nowDate];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取今天是几号
    NSInteger day = [comp day];
    NSSLog(@"%ld----%ld",(long)weekDay,(long)day);
    // 计算当前日期和本周的星期一和星期天相差天数
    long firstDiff,lastDiff = 0;
    //    weekDay = 1;
    if (weekDay == 1)
    {
        firstDiff = -6;
    }
    else
    {
        firstDiff = [calendar firstWeekday] - weekDay + 1;
    }
    NSSLog(@"firstDiff: %ld   lastDiff: %ld",firstDiff,lastDiff);
    
    // 在当前日期(去掉时分秒)基础上加上差的天数
    NSDateComponents *firstDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay  fromDate:nowDate];
    [firstDayComp setDay:day + firstDiff];
    NSDate *firstDayOfWeek = [calendar dateFromComponents:firstDayComp];
    
    NSSLog(@"=======%@",firstDayComp);
    
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString* string=[dateFormat stringFromDate:firstDayOfWeek];
    return string;
}
+(NSString *)getWeakLastDayTime{
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:nowDate];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取几天是几号
    NSInteger day = [comp day];
    NSSLog(@"%ld----%ld",(long)weekDay,(long)day);
    
    // 计算当前日期和本周的星期一和星期天相差天数
    long firstDiff = 0,lastDiff;
    //    weekDay = 1;
    if (weekDay == 1)
    {
        lastDiff = 0;
    }
    else
    {
        lastDiff = 9 - weekDay;
    }
    NSSLog(@"firstDiff: %ld   lastDiff: %ld",firstDiff,lastDiff);
    
    // 在当前日期(去掉时分秒)基础上加上差的天数
    NSDateComponents *lastDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay   fromDate:nowDate];
    [lastDayComp setDay:day + lastDiff];
    NSDate *lastDayOfWeek = [calendar dateFromComponents:lastDayComp];
    
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString* string=[dateFormat stringFromDate:lastDayOfWeek];
    return string;
}
+(NSString *)getWeakLastDay{
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:nowDate];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取几天是几号
    NSInteger day = [comp day];
    NSSLog(@"%ld----%ld",(long)weekDay,(long)day);

    // 计算当前日期和本周的星期一和星期天相差天数
    long firstDiff = 0,lastDiff;
    //    weekDay = 1;
    if (weekDay == 1)
    {
        lastDiff = 0;
    }
    else
    {
        lastDiff = 9 - weekDay;
    }
    NSSLog(@"firstDiff: %ld   lastDiff: %ld",firstDiff,lastDiff);

    // 在当前日期(去掉时分秒)基础上加上差的天数
    NSDateComponents *lastDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay   fromDate:nowDate];
    [lastDayComp setDay:day + lastDiff];
    NSDate *lastDayOfWeek = [calendar dateFromComponents:lastDayComp];
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[lastDayOfWeek timeIntervalSince1970]] integerValue]*1000;
    return [NSString stringWithFormat:@"%ld",timeSp];
}
+(NSString *)timeIntervalMinuateAndMiaoString:(NSInteger)time
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:time];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+(NSString *)timeIntervalHourAndMinuateAndMiaoString:(NSInteger)time
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:time];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+(BOOL)judgeTimeByStartAndEnd:(NSString *)startStr EndTime:(NSString *)endStr withTime:(NSString *)time
{
    // iOS 生成的时间戳是10位
    NSDate *startDate               = [NSDate dateWithTimeIntervalSince1970:[startStr integerValue] / 1000];
    NSDate *endDate               = [NSDate dateWithTimeIntervalSince1970:[endStr integerValue] / 1000];
    NSDate *timeDate               = [NSDate dateWithTimeIntervalSince1970:[time integerValue] / 1000];

    if ([timeDate compare:startDate] == NSOrderedDescending && [timeDate compare:endDate] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}
+(BOOL)isBetweenStartTime:(NSString *)startTime withEndTime:(NSString *)endTime withTime:(NSString *)time{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate = [dateFormatter dateFromString:startTime];
    NSDate *endDate = [dateFormatter dateFromString:endTime];
    NSDate *date = [dateFormatter dateFromString:time];

   if ([date compare:startDate] == NSOrderedDescending && [date compare:endDate] == NSOrderedAscending) {
       return YES;
   }
   return NO;
}
+(NSInteger)cacalDayDelta:(NSString *)startTime withEndTime:(NSString *)endTime{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate = [dateFormatter dateFromString:startTime];
    NSDate *endDate = [dateFormatter dateFromString:endTime];
    
    //利用NSCalendar比较日期的差异
    NSCalendar *calendar = [NSCalendar currentCalendar];
    /**
     * 要比较的时间单位,常用如下,可以同时传：
     *    NSCalendarUnitDay : 天
     *    NSCalendarUnitYear : 年
     *    NSCalendarUnitMonth : 月
     *    NSCalendarUnitHour : 时
     *    NSCalendarUnitMinute : 分
     *    NSCalendarUnitSecond : 秒
     */
    NSCalendarUnit unit = NSCalendarUnitDay;//只比较天数差异
    //比较的结果是NSDateComponents类对象
    NSDateComponents *delta = [calendar components:unit fromDate:startDate toDate:endDate options:0];
    return delta.day;
}
+ (NSString *) getweekDayStringWithDate:(NSDate *) date{

    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法

    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];

// 1 是周日，2是周一 3.以此类推

NSNumber * weekNumber = @([comps weekday]);

NSInteger weekInt = [weekNumber integerValue];

NSString *weekDayString = @"周一";

switch (weekInt) {

case 1:

{

weekDayString = @"周日";

}

break;

case 2:

{

weekDayString = @"周一";

}

break;

case 3:

{

weekDayString = @"周二";

}

break;

case 4:

{

weekDayString = @"周三";

}

break;

case 5:

{

weekDayString = @"周四";

}

break;

case 6:

{

weekDayString = @"周五";

}

break;

case 7:

{

weekDayString = @"周六";

}

break;

default:

break;

}

return weekDayString;

}

+(NSDate *)getDate:(NSDate *)date afterMinuteTime:(NSInteger)afterTime{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMinute:afterTime];
    NSDate *resultDate = [gregorian dateByAddingComponents:offsetComponents toDate:date options:0];
    return resultDate;
}

+(NSInteger)getWeek:(NSDate *)date{
  NSCalendar *calendar = [NSCalendar currentCalendar];
   [calendar setFirstWeekday:1]; //设置每周的开始是星期日
   NSDateComponents *comps = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                         fromDate:date];
   //时间轴是当前年的第几周
   NSInteger todayIsWeek = [comps weekOfYear];
    return todayIsWeek;
}
@end
