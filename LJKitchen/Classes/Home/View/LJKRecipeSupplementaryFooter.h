//
//  LJKRecipeSupplementaryFooter.h
//  LJKitchen
//
//  Created by  a on 16/7/9.
//  Copyright © 2016年 ycdsq. All rights reserved.
//


typedef NS_ENUM(NSInteger, SupplementaryFooterAction) {
    SupplementaryFooterActionComment,
    SupplementaryFooterActionSameHobby,
    SupplementaryFooterActionReport
};

#import <UIKit/UIKit.h>
@class LJKRecipe;
@interface LJKRecipeSupplementaryFooter : UITableViewHeaderFooterView

@property (nonatomic, strong) LJKRecipe *recipe;

/** FooterView上控件点击事件回调 */
@property (nonatomic, copy) void (^footerActionBlock)();

@end
