//
//  LJKConst.h
//  LJKitchen
//
//  Created by  a on 16/6/12.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <Foundation/Foundation.h>


/**  首页cell 模板 */
typedef enum {
    LJKCellTemplateTopic = 1,           // 帖子
    LJKCellTemplateRecipeList = 2,      // 菜单
    LJKCellTemplateUnknow = 3,          // 未知
    LJKCellTemplateDish = 4,            // 作品
    LJKCellTemplateRecipe = 5,          // 菜谱
    LJKCellTemplateWeeklyMagazine = 6   // 周刊
} LJKCellTemplate;


/** 项目内通用常量 */
/** 下厨房 - 标题距离屏幕左边的间距 */
UIKIT_EXTERN CGFloat const LJKRecipeCellMarginTitle;
/** 下厨房 - 大标题距离屏幕左边的间距 */
UIKIT_EXTERN CGFloat const LJKRecipeCellMarginFirstTitle;
/** 下厨房 - 描述与标题之间的间距 */
UIKIT_EXTERN CGFloat const LJKRecipeCellMarginTitle2Desc;
/** 下厨房 - 底部标题距离底部容器的距离 */
UIKIT_EXTERN CGFloat const LJKRecipeCellMarginTitle2Top;
/** 下厨房 - 菜单 - 标题距离顶部导航的间距 */
UIKIT_EXTERN CGFloat const LJKRecipeListViewMarginHeadTitle;
/** 下厨房 - 菜单 - 标题距离作者名字的间距 */
UIKIT_EXTERN CGFloat const LJKRecipeListViewMarginHeadTitle2Name;

/** 下厨房 - 头像宽高 */
UIKIT_EXTERN CGFloat const LJKAuthorIconWH;
/** 下厨房 - 复合头像宽高(社区用) */
UIKIT_EXTERN CGFloat const LJKAuthorIconsWH;
/** 下厨房 - 头像距离cell顶部的距离 */
UIKIT_EXTERN CGFloat const LJKAuthorIcon2CellTop;
/** 下厨房 - 头像距离cell左边的距离 */
UIKIT_EXTERN CGFloat const LJKAuthorIcon2CellLeft;

/** 下厨房 - 顶部导航视图高度（流行菜谱、关注动态） */
UIKIT_EXTERN CGFloat const LJKHomeHeader_TopNav_Height;
/** 下厨房 - 导航按钮高度（排行榜、看视频、买买买、菜谱分类） */
UIKIT_EXTERN CGFloat const LJKHomeHeader_CenterNav_Height;
/** 下厨房 - 导航按钮高度（scrollView 滚动条） */
UIKIT_EXTERN CGFloat const LJKHomeHeader_BottomNav_Height;
/** 下厨房 - 新用户优惠 */
UIKIT_EXTERN CGFloat const LJKHomeHeader_NewAuthor_Height;

/** 下厨房 - 菜单 - 作者名字高度 */
UIKIT_EXTERN CGFloat const LJKRecipeListViewHeightAuthorName;
/** 下厨房 - 菜单 - “收藏按钮”高度 */
UIKIT_EXTERN CGFloat const LJKRecipeListViewHeightCollectButton;
/** 下厨房 - 菜单 - 专家图标宽高 */
UIKIT_EXTERN CGFloat const LJKRecipeListViewHeightExpertIcon;

/** 商品界面 - 加入购物车 - 商品分类最小高度 */
UIKIT_EXTERN CGFloat const LJKGoodsKindsCategoryViewMinusHeight;
