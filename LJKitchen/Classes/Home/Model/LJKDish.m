//
//  LJKDish.m
//  LJKitchen
//
//  Created by  a on 16/6/15.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKDish.h"
#import "LJKAuthor.h"
#import "LJKPicture.h"
#import "LJKComment.h"
#import "LJKEvents.h"

/** LJKComment, LJKAuthor, LJKPicture, LJKDiggUsers, LJKEvents; */


@implementation LJKDish

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id"};
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"extra_pic" : [LJKPicture class],
             @"events" : [LJKEvents class],
             @"latest_comments" : [LJKComment class]};
}

- (CGFloat)dishCellHeight {
    
    CGFloat dishNameLabelMaxY = SCREEN_WIDTH + 100;
    CGFloat totalMarginHeight = 80 + 30;
    
    if (self.desc.length) {
        CGFloat descHeight = [self.desc boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 75, MAXFLOAT)
                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]}
                                                     context:nil].size.height;
        
        _dishCellHeight = dishNameLabelMaxY + descHeight + totalMarginHeight;
    } else {
        _dishCellHeight = dishNameLabelMaxY + totalMarginHeight;
    }
    
    return _dishCellHeight;
}

- (CGFloat)commentViewHeight {
    CGFloat commentCountMaxY = 30;
    CGFloat marginTop = 15;
    CGFloat marginMid = 10;
    CGFloat marginBottom = 20;
    
    
    if (self.latest_comments.count) { // 如果有评论
        
        // 计算第一条评论高度
        LJKComment *firstComment = self.latest_comments[self.latest_comments.count - 1];
        NSString *firstCommentString = [NSString stringWithFormat:@"%@：%@", firstComment.author.name, firstComment.txt];
        CGFloat firstCommentHeight = [firstCommentString boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 80, MAXFLOAT)
                                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                                   attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}
                                                                      context:nil].size.height;
        _commentViewHeight = marginTop + firstCommentHeight + marginBottom;
        
        // 如果有1条以上评论
        if (self.latest_comments.count > 1) {
            
            // 计算第二条评论高度
            LJKComment *secondComment = self.latest_comments[self.latest_comments.count - 2];
            NSString *secondCommentString = [NSString stringWithFormat:@"%@：%@", secondComment.author.name, secondComment.txt];
            CGFloat secondCommentHeight = [secondCommentString boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 80, MAXFLOAT)
                                                                            options:NSStringDrawingUsesLineFragmentOrigin
                                                                         attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}
                                                                            context:nil].size.height;
            _commentViewHeight = marginTop + firstCommentHeight + marginMid + secondCommentHeight + marginBottom;
            
            
            
            // 如果有2条以上评论
            if (self.latest_comments.count > 2) {
                
                // 加上评论总数Label高度
                _commentViewHeight = commentCountMaxY + marginTop + firstCommentHeight + marginMid + secondCommentHeight + marginBottom;
            }
        }
        
    } else { // 如果没有评论
        _commentViewHeight = marginBottom;
    }
    
    return _commentViewHeight;
}

@end
