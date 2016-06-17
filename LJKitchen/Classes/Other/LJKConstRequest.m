//
//  LJKConstRequest.m
//  LJKitchen
//
//  Created by  a on 16/6/16.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKConstRequest.h"

/** 下厨房 - 排行榜 */
NSString * const LJKRequestKitchenRankingList = @"http://www.xiachufang.com/page/top-list/";


/** 下厨房 - 菜谱分类 */
NSString * const LJKRequestKitchenRecipeCategory = @"http://www.xiachufang.com/page/app-category/";

/** 下厨房 - 导航数据 */
NSString * const LJKRequestKitchenNav = @"http://api.xiachufang.com/v2/init_page_v5.json?version=5.1.1&timezone=Asia%2FShanghai&api_sign=8436824b4ec402b228bf20028d49c9b5&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=7UnwJ-JkQ36hbfrMRoL0fA";
/** 下厨房 - 关注动态 */
NSString * const LJKRequestKitchenFeeds = @"http://api.xiachufang.com/v2/account/feeds_v3.json?offset=0&origin=iphone&api_sign=5682ea5db42972d13cc17bc1401000fe&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=10&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";