//
//  LJKPopEvents.h
//  LJKitchen
//
//  Created by  a on 16/6/16.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LJKPopEvent;
@interface LJKPopEvents : NSObject
/** 导航个数 */
@property (nonatomic, assign) NSInteger count;
/** 三餐导航数组 */
@property (nonatomic, strong) NSArray <LJKPopEvent *> *events;
@end
