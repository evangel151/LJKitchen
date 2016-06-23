//
//  UILabel+Extension.h
//  LJKitchen
//
//  Created by  a on 16/6/19.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

+ (UILabel *)labelWithTextColor:(UIColor *)textColor
                backgroundColor:(UIColor *)backgroundColor
                       fontSize:(CGFloat)fontSize
                          lines:(NSUInteger)lines
                  textAlignment:(NSTextAlignment)textAlignment;

/** 在给定范围内设置属性字体 */
- (void)setAttributeTextWithString:(NSString *)string range:(NSRange)range;

/** 在导航条下方插入一个label提示框 */
+ (void)showMessage:(NSString *)string atNavController:(UINavigationController *)navController;
@end
