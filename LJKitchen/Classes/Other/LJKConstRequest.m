//
//  LJKConstRequest.m
//  LJKitchen
//
//  Created by  a on 16/6/16.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKConstRequest.h"

#pragma mark - 首页
#pragma mark 使用webView展示
/** 下厨房 - 排行榜 */
NSString * const LJKRequestKitchenRankingList = @"http://www.xiachufang.com/page/top-list/";
/** 下厨房 - 菜谱分类 */
NSString * const LJKRequestKitchenRecipeCategory = @"http://www.xiachufang.com/page/app-category/";

#pragma mark 普通展示
/** 下厨房 - 导航数据 */
NSString * const LJKRequestKitchenNav = @"http://api.xiachufang.com/v2/init_page_v5.json?version=5.1.1&timezone=Asia%2FShanghai&api_sign=8436824b4ec402b228bf20028d49c9b5&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=7UnwJ-JkQ36hbfrMRoL0fA";
/** 下厨房 - 关注动态 */
NSString * const LJKRequestKitchenFeeds = @"http://api.xiachufang.com/v2/account/feeds_v3.json?offset=0&origin=iphone&api_sign=5682ea5db42972d13cc17bc1401000fe&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=10&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";

/** 下厨房 - 首页Cell数据 */
NSString * const LJKRequestKitchenCell = @"http://api.xiachufang.com/v2/issues/list.json?cursor=&api_key=07397197043fafe11ce5c65c10febf84&size=2&sk=EhUpkVYBSoOT9qAapL0BUw&api_sign=51332747ce48a674bcf0397392410b74&_ts=1465544264.130416&origin=iphone&version=5.5.0&timezone=Asia%2FShanghai&location_code=156320900000000&nonce=F5533FD9-6417-4335-962D-D92D5319250C";
/** 下厨房 - 首页Cell - 上拉加载更多数据 */
NSString * const LJKRequestKitchenCellMore = @"http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=069310ae4fc0b866207dba71320f1c13&sk=7UnwJ-JkQ36hbfrMRoL0fA&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";

/** 下厨房 - 三餐基本信息(晚餐) */
NSString * const LJKRequestKitchenSupper = @"http://api.xiachufang.com/v2/events/show.json?id=100131208&sk=EhUpkVYBSoOT9qAapL0BUw&api_sign=fc3bea5063ae11b5678a511fafbaee63&_ts=1466594953.675698&origin=iphone&api_key=07397197043fafe11ce5c65c10febf84&location_code=156320900000000&version=5.5.0&nonce=964A8984-A928-4236-A749-6E3E68341103";
/** 下厨房 - 三餐作品信息(collectionCell)(晚餐) */
NSString * const LJKRequestKitchenSupperDishes = @"http://api.xiachufang.com/v2/events/100131208/dishes_order_by_hot_v2.json?api_sign=de3babff780130551cabd96e16e7ee46&limit=18&sk=EhUpkVYBSoOT9qAapL0BUw&timestamp=1466601380&nonce=BC718253-163F-467A-AB0B-C27F040388E7&api_key=07397197043fafe11ce5c65c10febf84&version=5.5.0&_ts=1466601381.014687&dish_size=360w_360h&offset=0&location_code=156320900000000&detail=true&origin=iphone";

/** 下厨房 - 社区 */
NSString * const LJKRequestCommunity = @"http://api.xiachufang.com/v2/social/init_page.json?origin=iphone&longitude=114.918727&api_sign=bcd62c6e9e0c9b70f1c60719c0b96082&sk=7UnwJ-JkQ36hbfrMRoL0fA&latitude=22.806659&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
/** 下厨房 - 社区(帖子)  */
NSString * const LJKRequestTopic = @"http://api.xiachufang.com/v2/forums/2/topics.json?offset=0&origin=iphone&api_sign=2057b55a66e4d86a9284232741762f0e&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=20&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
