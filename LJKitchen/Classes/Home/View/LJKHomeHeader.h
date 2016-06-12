//
//  LJKHomeHeader.h
//  LJKitchen
//
//  Created by  a on 16/6/12.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

/** 顶部导航视图点击事件 */
typedef NS_ENUM(NSInteger, viewDidClickedAction) {
    // 顶部
    viewDidClickedActionPopRecipeView = 0,          // 流行菜谱
    viewDidClickedActionFeedsView = 1,              // 关注动态
    
    // 中部
    viewDidClickedActionTopListButton = 2,          // 排行榜
    viewDidClickedActionVideoButton = 3,            // 看视频
    viewDidClickedActionBuyButton = 4,              // 买买买
    viewDidClickedActionRecipeCategoryButton = 5,   // 菜谱分类
    
    // 底部
    viewDidClickedActionBreakfast = 6,              // 早餐
    viewDidClickedActionLunch = 7,                  // 午餐
    viewDidClickedActionSupper = 8                  // 晚餐
    
};

/** 事件点击Block */
typedef void (^viewDidClickedBlock)();

#import <UIKit/UIKit.h>

@interface LJKHomeHeader : UIView
@property (nonatomic, copy) viewDidClickedBlock clickBlock;
@end
