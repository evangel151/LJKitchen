//
//  LJKMyInfo.m
//  LJKitchen
//
//  Created by  a on 16/6/15.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKMyInfo.h"
#import "LJKAuthorDetail.h"
@implementation LJKMyInfo

static LJKAuthorDetail *_myInfo;
static NSString * const kMyInfo = @"myInfo";

+ (LJKAuthorDetail *)info {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kMyInfo];
    _myInfo = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    // 无法获取真实接口，假数据测试用
    if (!_myInfo) {
        _myInfo = [[LJKAuthorDetail alloc] init];
        _myInfo.type        = LJKAuthorTypeMe;
        _myInfo.nfollow     = @"1";
        _myInfo.nfollowed   = @"99999";
        _myInfo.create_time = @"1970-01-01 13:10:10";
        _myInfo.ndishes     = @"520";
        _myInfo.nrecipes    = @"1314";
    }
    return _myInfo;

}

// 更新本地个人信息 
+ (void)updateInfoWithNewInfo:(LJKAuthorDetail *)info {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:info];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:kMyInfo];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
