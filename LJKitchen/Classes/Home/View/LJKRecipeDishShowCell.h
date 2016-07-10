//
//  LJKRecipeDishShowCell.h
//  LJKitchen
//
//  Created by  a on 16/7/10.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJKRecipe,LJKDish,LJKGoods;
@interface LJKRecipeDishShowCell : UITableViewCell


/** 作品模型数据 */
@property (nonatomic, strong) NSMutableArray *dish;
/** 作品模型数据 */
@property (nonatomic, strong) LJKRecipe *recipe;
/** 评价模型数据 */
@property (nonatomic, strong) LJKGoods *goods;

/** CollectionViewCellClickedBlock */
@property (nonatomic, copy) void (^collectionViewCellClickedBlock)(NSInteger index);
/** 点赞按钮点击block */
@property (nonatomic, copy) void (^diggsButtonClickedBlock)(id sender);
/** 刷新回调 */
@property (nonatomic, copy) void (^refreshBlock)();
/** 查看所有作品、评价 */
@property (nonatomic, copy) void (^showAllBlock)();
/** 查看所有作品、评价 */
@property (nonatomic, copy) void (^uploadMyDishBlock)();

@end
