//
//  LJKBasic2Cell.m
//  LJKitchen
//
//  Created by  a on 16/6/11.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKBasic2Cell.h"
#import <Masonry.h>
@implementation LJKBasic2Cell

- (UIImageView *)iconView {
    if (!_iconView) {
        self.iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)nameLabelTop {
    if (!_nameLabelTop) {
        self.nameLabelTop = [[UILabel alloc] init];
        self.nameLabelTop.textAlignment = NSTextAlignmentLeft;
        self.nameLabelTop.font = [UIFont systemFontOfSize:17];
    }
    return _nameLabelTop;
}

- (UILabel *)talkLabelBottom {
    if (!_talkLabelBottom) {
        self.talkLabelBottom = [[UILabel alloc] init];
        self.talkLabelBottom.textAlignment = NSTextAlignmentLeft;
        self.talkLabelBottom.font = [UIFont systemFontOfSize:13];
        self.talkLabelBottom.textColor = Color_DarkGray;
    }
    return _talkLabelBottom;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = Color_DarkGray;
    }
    return _timeLabel;
}





- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.nameLabelTop];
        [self.contentView addSubview:self.talkLabelBottom];
        
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.contentView.mas_height).offset(-20);
            make.left.equalTo(self.contentView).offset(20);
            make.top.equalTo(self.contentView).offset(10);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
        
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(5);
            make.right.equalTo(self.contentView).offset(-20);
            make.size.mas_equalTo(CGSizeMake(85, 15));
        }];
        
        [_nameLabelTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(10);
            make.bottom.equalTo(self.contentView.mas_centerY);
            make.left.equalTo(_iconView.mas_right).offset(20);
            make.right.equalTo(_timeLabel.mas_left).offset(-20);
        }];
        
        [_talkLabelBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_centerY).offset(10);
            make.bottom.equalTo(self.contentView).offset(-10);
            make.left.equalTo(_iconView.mas_right).offset(20);
            make.right.equalTo(_timeLabel.mas_left).offset(-20);
        }];
        
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"Basic2Cell";
    LJKBasic2Cell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LJKBasic2Cell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

@end
