//
//  LJKHomeHeaderNavButton.h
//  LJKitchen
//
//  Created by  a on 16/6/12.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJKNav;

@interface LJKHomeHeaderNavButton : UIButton

+ (nonnull LJKHomeHeaderNavButton *)buttonWithNav:(nonnull LJKNav *)nav
                                           target:(nullable id)target
                                           action:(nullable SEL)action;


+ (nonnull LJKHomeHeaderNavButton *)buttonWithImageName:(nonnull NSString *)imageName
                                                  title:(nonnull NSString *)title
                                                 target:(nullable id)target
                                                 action:(nullable SEL)action;

@end
