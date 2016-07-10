//
//  LJKFeedsViewCell.h
//  LJKitchen
//
//  Created by  a on 16/7/1.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, DishViewAction) {
    DishViewActionIcon,
    DishViewActionName,
    DishViewActionDigg,
    DishViewActionCommment,
    DishViewActionMore
};


@class LJKDish,LJKReview;
@interface LJKFeedsViewCell : UITableViewCell

@property (nonatomic, assign) LJKShowViewType type;
@property (nonatomic, strong) LJKDish *dish;
@property (nonatomic, strong) LJKReview *review;

/** 图片数据 */
@property (nonatomic, strong) NSArray *imageArray;
/** 存储cell内图片轮播器滚动位置 */
@property (nonatomic, assign) CGFloat imageViewCurrentLocation;
/** cell滚动回调 */
@property (nonatomic, copy) void (^imageViewDidScrolledBlock)();
/** 底部button事件回调 */
@property (nonatomic, copy) void (^actionBlock)();
@end
