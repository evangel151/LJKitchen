//
//  LJKBasicCell.m
//  LJKitchen
//
//  Created by  a on 16/6/10.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKBasicCell.h"
#import <Masonry.h>

@interface LJKBasicCell ()


@end

@implementation LJKBasicCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"BasicCell";
    LJKBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LJKBasicCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LJKBasicCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//
//    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(16, 24));
//        make.centerY.equalTo(self.contentView);
//        make.right.equalTo(self.mas_right).offset(-20);
//    }];
//
//    [self.titleLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(200, self.height)).priorityHigh();
//        make.top.equalTo(self.mas_top);
//        make.left.equalTo(self.mas_left).offset(20);
//        make.bottom.equalTo(self.mas_bottom);
//        
//    }];
//}

@end
