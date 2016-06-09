//
//  UIButton+Extension.h
//  LJKitchen
//
//  Created by  a on 16/6/9.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
              backgroundColor:(UIColor *)backgroundColor
                     fontSize:(CGFloat)fontSize
                       target:(id)target
                       action:(SEL)action;
@end
