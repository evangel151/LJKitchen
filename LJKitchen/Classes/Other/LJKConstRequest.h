//
//  LJKConstRequest.h
//  LJKitchen
//
//  Created by  a on 16/6/16.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <Foundation/Foundation.h>

/**** 下厨房__首页__Header各控件网络请求 ******/
/** 下厨房 - 排行榜 */
UIKIT_EXTERN NSString * const LJKRequestKitchenRankingList;
/** 下厨房 - 菜谱分类 */
UIKIT_EXTERN NSString * const LJKRequestKitchenRecipeCategory;
/** 下厨房 - 导航数据 */
UIKIT_EXTERN NSString * const LJKRequestKitchenNav;
/** 下厨房 - 导航数据 */
UIKIT_EXTERN NSString * const LJKRequestKitchenFeeds;
/** 下厨房 - 三餐基本信息(早餐) */
UIKIT_EXTERN NSString * const LJKRequestKitchenSupper;
/** 下厨房 - 三餐作品信息(collectionCell)(早餐) */
UIKIT_EXTERN NSString * const LJKRequestKitchenSupperDishes;

/****      下厨房__首页__本体  *********/
/** 下厨房 - 首页Cell数据 */
UIKIT_EXTERN NSString * const LJKRequestKitchenCell;
/** 下厨房 - 首页Cell - 上拉加载更多数据 */
UIKIT_EXTERN NSString * const LJKRequestKitchenCellMore; // 与LJKRequestKitchenCell 相同


/****      下厨房__信箱__社区  *********/
/** 下厨房 - 社区 */
UIKIT_EXTERN NSString * const LJKRequestCommunity;
/** 下厨房 - 社区(帖子)  */
UIKIT_EXTERN NSString * const LJKRequestTopic;


/** 下厨房 - 个人信息  */
UIKIT_EXTERN NSString * const LJKAuthorInfo;
/** 下厨房 - 个人信息  */
UIKIT_EXTERN NSString * const LJKAuthorDish;






