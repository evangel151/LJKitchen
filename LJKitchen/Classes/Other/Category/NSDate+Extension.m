//
//  NSDate+Extension.m
//  LJKitchen
//
//  Created by  a on 16/6/24.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)
- (NSDateComponents *)intervalToDate:(NSDate *)date {

    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit
                       fromDate:self
                         toDate:date
                        options:0];
}

- (NSDateComponents *)intervalToNow {
    
    return [self intervalToDate:[NSDate date]];
}

/** 是否为今年 -> 可判断 今年/其他年 */
- (BOOL)isThisYear {
    NSCalendar *calendar =  [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSInteger now = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];

    return now == selfYear;
}
/** 是否为今天 */
- (BOOL)isToday {
    NSCalendar *calendar =  [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *today = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfDay = [calendar components:unit fromDate:self];
    
    return today.day == selfDay.day && today.month == selfDay.month && today.year == selfDay.year;
}
/** 是否为昨天 */
- (BOOL)isYesterday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *nowString = [formatter stringFromDate:[NSDate date]];
    NSDate *nowDate = [formatter dateFromString:nowString];
    NSString *selfString = [formatter stringFromDate:self];
    NSDate *selfDate = [formatter dateFromString:selfString];
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    // 比较两者之间的差值  符合 3个条件的才是昨天
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}


//+ (NSString *)timeToRequiredStyleWithText:(NSString *)text {
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
//    NSDate *latestDate = [formatter dateFromString:text];
//    NSDateComponents *components = [latestDate intervalToNow];
//    
//    if (latestDate.isThisYear) {
//        if (latestDate.isYesterday) { // 昨天
//            formatter.dateFormat = @"昨天 HH:mm";
//            return [formatter stringFromDate:latestDate];
//        } else if (latestDate.isToday) {// 今天
//            
//            if (components.hour >= 1) { // 当天内 至少1小时前创建
//                return [NSString stringWithFormat:@"%ld小时前",(long)components.hour];
//            } else if (components.minute > 1) { // 当天内 距离现在 1小时之内创建
//                return [NSString stringWithFormat:@"%ld分钟前",(long)components.minute];
//            } else { // 1分钟之内新发
//                return @"刚刚";
//            }
//        } else { // 前天 乃至 今年内的所有日子
//            formatter.dateFormat = @"MM-dd HH:mm";
//            return [formatter stringFromDate:latestDate];
//        }
//    } else { // 非今年
//        // 设置时间格式
//        formatter.dateFormat = @"yyyy-MM-dd HH:mm";
//        return [formatter stringFromDate:latestDate];
//    }
//}

@end
