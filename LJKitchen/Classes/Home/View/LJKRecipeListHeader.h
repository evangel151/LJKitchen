//
//  LJKRecipeListHeader.h
//  LJKitchen
//
//  Created by  a on 16/7/5.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, recipeHeaderAction) {
    RecipeHeaderActionAuthorName, // 姓名
    RecipeHeaderActionCollected   // 收藏
};

@class LJKRecipeList;
@interface LJKRecipeListHeader : UIView
/** header点击事件 */
@property (nonatomic, copy) void (^recipeHeaderActionBlock)();

/** 菜单 */
@property (nonatomic, strong) LJKRecipeList *recipeList;

@end
