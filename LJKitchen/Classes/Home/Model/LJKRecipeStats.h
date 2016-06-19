//
//  LJKRecipeStats.h
//  LJKitchen
//
//  Created by  a on 16/6/20.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJKRecipeStats : NSObject
/** 被收藏次数 */
@property (nonatomic, copy) NSString *n_collects;
/** 评论数 */
@property (nonatomic, copy) NSString *n_comments;
/** 做过的人数 */
@property (nonatomic, copy) NSString *n_cooked;
/** 作品数 */
@property (nonatomic, copy) NSString *n_dishes;
/** 最近7天做过人数 */
@property (nonatomic, copy) NSString *n_cooked_last_week;
/** 是否由我制作（作用未知） */
@property (nonatomic, assign) BOOL cooked_by_me;
/** 未知 */
@property (nonatomic, copy) NSString *n_pv;
@end
