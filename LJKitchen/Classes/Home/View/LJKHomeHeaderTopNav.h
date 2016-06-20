//
//  LJKHomeHeaderTopNav.h
//  LJKitchen
//
//  Created by  a on 16/6/12.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJKHomeHeaderTopNav : UIImageView

/** 类方法: 返回一个已经添加了标题 + 手势事件的imageView */
+ (nonnull LJKHomeHeaderTopNav *)imageViewWithTitle:(nonnull NSString *)title
                                            target:(nullable id)target
                                            action:(nullable SEL)action;

@end
