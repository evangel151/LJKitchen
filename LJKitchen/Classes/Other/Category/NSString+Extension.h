//
//  NSString+Extension.h
//  LJKitchen
//
//  Created by  a on 16/6/23.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/** 类方法:根据给定文字 + 宽度 + 字号 返回size  */
+ (CGSize)getSizeWithString:(NSString*)string
                      width:(CGFloat)width
                       font:(CGFloat)font;

- (CGSize)getSizeWithEstimatedSize:(CGSize)estimatedSize
                              font:(CGFloat)font;



@end