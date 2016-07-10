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


+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
           selectedTitleColor:(UIColor *)selectedTitleColor
                     fontSize:(CGFloat)fontSize
            selectedImageName:(NSString *)imageName
                       target:(id)target
                       action:(SEL)action;

+ (UIButton *)buttonWithImageName:(NSString *)normal
                selectedImageName:(NSString *)selected
                           target:(id)target
                           action:(SEL)action;

+ (UIButton *)buttonWithTitleNormal:(NSString *)normalTitle
                      titleSelected:(NSString *)selectedTitle
                         titleColor:(UIColor *)titleColor
          normalBackgroundImageName:(NSString *)normalImage
        selectedBackgroundImageName:(NSString *)selectedImage
                             target:(id)target
                             action:(SEL)action;

+ (UIButton *)buttonWithImageName:(NSString *)enabled
                 disableImageName:(NSString *)disabled
                           target:(id)target
                           action:(SEL)action;

@end
