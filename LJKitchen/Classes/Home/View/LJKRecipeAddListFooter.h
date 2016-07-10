//
//  LJKRecipeAddListFooter.h
//  LJKitchen
//
//  Created by  a on 16/7/10.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LJKRecipeAddListFooter : UITableViewHeaderFooterView
/** FooterView上控件点击事件回调 */
@property (nonatomic, copy) void (^footerActionBlock)();
@end
