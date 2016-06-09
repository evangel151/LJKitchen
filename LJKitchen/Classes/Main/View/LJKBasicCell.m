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
@property (weak, nonatomic) IBOutlet UIImageView *arrowView;

@end

@implementation LJKBasicCell





+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"Cell";
    LJKBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LJKBasicCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LJKBasicCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.size.mas_equalTo(CGSizeMake(16, 24)).priorityHigh();
        make.centerY.equalTo(self.mas_centerY).priorityHigh();
        make.right.equalTo(self.mas_right).offset(-20);
    }];

    [self.titleLabelView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.size.mas_equalTo(CGSizeMake(200, self.height)).priorityHigh();
        make.top.equalTo(self.mas_top).priorityHigh();
        make.left.equalTo(self.mas_left).offset(20).priorityHigh();
        make.bottom.equalTo(self.mas_bottom).priorityHigh();
        
    }];
    
}

@end
