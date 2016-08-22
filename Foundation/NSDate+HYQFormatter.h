//
//  NSDate+HYQFormatter.h
//  GGPickerView
//
//  Created by __无邪_ on 15/8/5.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HYQFormatter)

+ (NSDate *)dateFromString:(NSString *)string formatter:(NSString *)formatter;
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter;


+ (NSString *)dateFromStr:(NSString *)str formatter:(NSString *)formatterStr;

+ (NSDate *)tomorrow;

+ (NSDate *)nextHour;

- (NSString *)description;

- (NSString *)yearString;

- (BOOL)isThisYear;

- (NSDate*)dateFromUnixTimestamp:(NSTimeInterval)timestamp;

////时间戳  转时间 yy- mm - dd
+ (NSString *)dateFromStr:(NSString *)str;
+ (NSString *)dateMMSSFromStr:(NSString *)str;
+ (NSString *)dateMMSSDOTFromStr:(NSString *)str  ms:(NSString *)millisecond;
+ (NSString *)dateYYMMDDFromStr:(NSString *)str;
///去时间戳
+ (NSString *)date1970;
+ (NSString *)getStrdate1970;
+ (NSString *)ifToDaydateFromStr:(NSString *)str;
@end
