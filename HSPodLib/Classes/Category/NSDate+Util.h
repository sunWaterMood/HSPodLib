//
//  NSDate+Util.h
//  IOAforPD
//
//  Created by sy on 2018/11/30.
//  Copyright © 2018 sy. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

/**
 s日期抓字符串
 */
@interface NSDate (Util)
- (NSString *)transformToFuzzyDate;
+ (NSString *)time_dateToString:(NSDate *)date;
+(NSString *)currentDate;
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime;
+(NSString *)calcDateFor:(NSInteger)day withDate:(NSDate *)date;
+(NSString *)timeStampToDate:(NSString *)timestamp;
+ (NSString *)getdate_timeToString:(NSDate *)date;
+(NSString *)calcDateForHour:(NSInteger)hour withDate:(NSDate *)date;
+(NSInteger)timeSwitchTimestampSecond:(NSString *)formatTime;
+(NSString *)currentTimeDate;
+(NSInteger)timeSwitchTimestampMiao:(NSString *)formatTime;
+(NSString *)currentTimeS;
+(NSInteger)getNowTimeTimestamp;
+(NSInteger)cacalTimeChaStartTime:(NSInteger)startTime withEndTime:(NSInteger)endTime;
+(NSString *)timeWithTimeIntervalString:(NSInteger)time;
+(NSString *)getWeakOneDay;
+(NSString *)getWeakLastDay;
+(NSString *)getWeakOneDayTime;
+(NSString *)getWeakLastDayTime;
+(NSString *)timeWithNormalTimeIntervalString:(NSInteger)time;
+(NSString *)timeIntervalMinuateAndMiaoString:(NSInteger)time;
+(BOOL)judgeTimeByStartAndEnd:(NSString *)startStr EndTime:(NSString *)endStr withTime:(NSString *)time;
+(NSInteger)cacalDayDelta:(NSString *)startTime withEndTime:(NSString *)endTime;
+(NSString *)timeIntervalHourAndMinuateAndMiaoString:(NSInteger)time;
+ (NSString *)time_dateSecondToString:(NSDate *)date;
+(NSString *)time_yyyy_MM:(NSDate *)date;
+(NSString *)timeStampMonthDayToDate:(NSString *)timestamp;
+(NSString *)timeStampYearToDate:(NSString *)timestamp;
+(NSString *)yyyy_MM:(NSDate *)date;
+(NSDate *)timeStringConvertToDate:(NSString *)formatTime;
+ (NSString *) getweekDayStringWithDate:(NSDate *) date;
+(NSDate *)getDate:(NSDate *)date afterMinuteTime:(NSInteger)afterTime;
+(NSDate *)timeStringConvertToyyyy_MM_dd:(NSString *)formatTime;
+(NSString *)time_dateToyyyy_M_d:(NSDate *)date;
+(NSDate *)timeDateConvertToyyyy_M_d:(NSString *)formatTime;
+(NSInteger)getWeek:(NSDate *)date;
+(BOOL)isBetweenStartTime:(NSString *)startTime withEndTime:(NSString *)endTime withTime:(NSString *)time;
+(NSString *)time_yyyy:(NSDate *)date;
+(NSString *)calcDateForMinute:(NSInteger)minute withDate:(NSDate *)date;
+(NSDate *)timeConverDate:(NSString *)timeString forFormat:(NSString *)format;
@end

NS_ASSUME_NONNULL_END
