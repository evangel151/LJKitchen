//
//  NSString+Extension.m
//  LJKitchen
//
//  Created by  a on 16/6/23.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (CGSize)getSizeWithString:(NSString*)string
                      width:(CGFloat)width
                       font:(CGFloat)font {
    
    CGSize size = [string boundingRectWithSize:CGSizeMake(width,MAXFLOAT)
                                    options:NSStringDrawingUsesLineFragmentOrigin
                                 attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]}
                                    context:nil].size;

    
    return size;
}


- (CGSize)getSizeWithEstimatedSize:(CGSize)estimatedSize
                              font:(CGFloat)font {
    CGSize size = [self boundingRectWithSize:estimatedSize
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]}
                                           context:nil].size;
    return size;
}




@end
