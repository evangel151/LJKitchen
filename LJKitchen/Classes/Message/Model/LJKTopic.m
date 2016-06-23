//
//  LJKTopic.m
//  LJKitchen
//
//  Created by  a on 16/6/23.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKTopic.h"
#import "LJKAuthor.h"


@implementation LJKTopic

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id"};
}


- (CGFloat)cellHeight {
//    CGFloat W = SCREEN_WIDTH - LJKAuthorIconWH - LJKAuthorIcon2CellLeft * 2 - 10;
//    CGFloat contentH = [self.content getSizeWithEstimatedSize:CGSizeMake(W, MAXFLOAT) font:15].height;
    CGFloat contentH = [self detailHeaderHeight];
    if (contentH > 20 || self.is_sticked) {
        _cellHeight = 110;
    } else {
        _cellHeight = 90;
    }
    
    return _cellHeight;
}

- (CGFloat)detailHeaderHeight {
    CGFloat contentH = [self contentHeight];
    
    CGFloat sumH = contentH + LJKAuthorIconWH + LJKAuthorIcon2CellTop * 2 + 10;
    
    return sumH;
}


- (CGFloat)contentHeight {
    CGFloat W = SCREEN_WIDTH - LJKAuthorIconWH - LJKAuthorIcon2CellLeft * 2 - 10;
    CGFloat contentH = [self.content getSizeWithEstimatedSize:CGSizeMake(W, MAXFLOAT) font:15].height;
    return contentH;
}

- (NSString *)latest_comment_time {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *latestDate = [formatter dateFromString:_latest_comment_time];
    NSDateComponents *components = [latestDate intervalToNow];
    
    if (latestDate.isThisYear) {
        if (latestDate.isYesterday) { // 昨天
            formatter.dateFormat = @"昨天 HH:mm";
            return [formatter stringFromDate:latestDate];
        } else if (latestDate.isToday) {// 今天
            
            if (components.hour >= 1) { // 当天内 至少1小时前创建
                return [NSString stringWithFormat:@"%ld小时前",(long)components.hour];
            } else if (components.minute > 1) { // 当天内 距离现在 1小时之内创建
                return [NSString stringWithFormat:@"%ld分钟前",(long)components.minute];
            } else { // 1分钟之内新发
                return @"刚刚";
            }
        } else { // 前天 乃至 今年内的所有日子
            formatter.dateFormat = @"MM-dd HH:mm";
            return [formatter stringFromDate:latestDate];
        }
    } else { // 非今年
        // 设置时间格式
        formatter.dateFormat = @"yyyy-MM-dd HH:mm";
        return [formatter stringFromDate:latestDate];
    }
}

@end
