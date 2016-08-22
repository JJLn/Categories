//
//  NSDate+HYQFormatter.m
//  GGPickerView
//
//  Created by __无邪_ on 15/8/5.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "NSDate+HYQFormatter.h"
@implementation NSDate (HYQFormatter)

//去时间戳
+ (NSString *)date1970
{

    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    return  [NSString stringWithFormat:@"%f", a];//转为字符型
    
    
}


+ (NSString *)getStrdate1970
{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    return  [NSString stringWithFormat:@"%.0f", ceil(a)];//转为字符型
    
    
}
- (NSDate*)dateFromUnixTimestamp:(NSTimeInterval)timestamp {
    return [NSDate dateWithTimeIntervalSince1970:timestamp];
}
+ (NSString *)dateFromStr:(NSString *)str
{
        NSString *_str = [NSString stringWithFormat:@"%@",str];
    if ([_str isEqualToString:@""] || !_str) {
        return @"";
    }

    if (_str.length < 13) {
        
        _str = [NSString stringWithFormat:@"%13f",[[NSDate date] timeIntervalSinceReferenceDate]];
    }
    _str  = [_str substringToIndex:10];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    
    NSTimeInterval timer  = [_str integerValue];

    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timer];
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"confromTimespStr =  %@",confromTimespStr);
    return confromTimespStr;
}

+ (NSString *)ifToDaydateFromStr:(NSString *)str
{
    NSString *_str = [NSString stringWithFormat:@"%@",str];
    if ([_str isEqualToString:@""] || !_str) {
        return @"";
    }
    
    if (_str.length < 13) {
        
        _str = [NSString stringWithFormat:@"%13f",[[NSDate date] timeIntervalSinceReferenceDate]];
    }
    _str  = [_str substringToIndex:10];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    
    NSTimeInterval timer  = [_str integerValue];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timer];
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"confromTimespStr =  %@",confromTimespStr);
    
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    NSString *toData =  confromTimespStr;

    if ([confromTimespStr rangeOfString:locationString].location != NSNotFound) {
//        NSLog(@"这个字符串中有\n");
        confromTimespStr = [confromTimespStr substringFromIndex:10];
        toData = [NSString stringWithFormat:@"今天%@",confromTimespStr];
    }
    

    
    
    return toData;
}
+ (NSString *)dateFromStr:(NSString *)str formatter:(NSString *)formatterStr{
    NSString *_str = [NSString stringWithFormat:@"%@",str];
    if ([_str isEqualToString:@""] || !_str) {
        return @"";
    }
    
    if (_str.length < 13) {
        
        _str = [NSString stringWithFormat:@"%13f",[[NSDate date] timeIntervalSinceReferenceDate]];
    }
    _str  = [_str substringToIndex:10];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatterStr];
    
    NSTimeInterval timer  = [_str integerValue];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timer];
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"confromTimespStr =  %@",confromTimespStr);
    return confromTimespStr;
}
+ (NSString *)dateMMSSFromStr:(NSString *)str
{
    NSString *_str = [NSString stringWithFormat:@"%@",str];
    if ([_str isEqualToString:@""] || !_str) {
        return @"";
    }
    
    if (_str.length < 13) {
        
        _str = [NSString stringWithFormat:@"%13f",[[NSDate date] timeIntervalSinceReferenceDate]];
    }
    _str  = [_str substringToIndex:10];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSTimeInterval timer  = [_str integerValue];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timer];
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"confromTimespStr =  %@",confromTimespStr);
    
    
    
    
       return confromTimespStr;
}
+ (NSString *)dateYYMMDDFromStr:(NSString *)str
{
    NSString *_str = [NSString stringWithFormat:@"%@",str];
    if ([_str isEqualToString:@""] || !_str) {
        return @"";
    }
    
    if (_str.length < 13) {
        
        _str = [NSString stringWithFormat:@"%13f",[[NSDate date] timeIntervalSinceReferenceDate]];
    }
    _str  = [_str substringToIndex:10];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YY-MM-dd"];
    
    NSTimeInterval timer  = [_str integerValue];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timer];
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}

+ (NSString *)dateMMSSDOTFromStr:(NSString *)str  ms:(NSString *)millisecond
{
    NSString *_str = [NSString stringWithFormat:@"%@",str];
    if ([_str isEqualToString:@""] || !_str) {
        return @"";
    }
    if (_str.length < 13) {
        _str = [NSString stringWithFormat:@"%13f",[[NSDate date] timeIntervalSinceReferenceDate]];
    }
    _str  = [_str substringToIndex:10];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];

    NSTimeInterval timer  = [_str integerValue];

    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timer];
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
//    return confromTimespStr;
    return [NSString stringWithFormat:@"%@.%@", confromTimespStr, millisecond];
}

- (BOOL)isThisYear{
    NSString *yearStr = FQAHStringFromDate(@"yyyy", self);
    NSString *thisYear = FQAHStringFromDate(@"yyyy", [NSDate date]);
    if ([yearStr isEqualToString:thisYear]) {
        return YES;
    }
    return NO;
}

- (NSString *)yearString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    return [dateFormatter stringFromDate:self];
}
+ (NSDate *)dateFromString:(NSString *)string formatter:(NSString *)formatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSDate *curDate = [dateFormatter dateFromString:string];
    
    return curDate;
}

+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter; //设置时间和日期的格式
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}


+ (NSDate *)tomorrow{
    return [[NSDate date] dateByAddingTimeInterval:3600 * 24];
}


+ (NSDate *)nextHour{
    return [[NSDate date] dateByAddingTimeInterval:3600];
}

- (NSString *)description{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMddHH:mmss"; //设置时间和日期的格式
    NSString *dateString = [dateFormatter stringFromDate:self];
    return dateString;
}

@end
