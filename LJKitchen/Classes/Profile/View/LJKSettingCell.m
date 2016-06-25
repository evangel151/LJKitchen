//
//  LJKSettingCell.m
//  LJKitchen
//
//  Created by  a on 16/6/26.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKSettingCell.h"
#import "LJKAuthorDetail.h"
#import <Masonry.h>

@interface LJKSettingCell ()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *signLabel;

@property (nonatomic, strong) UIView *separatorLine;
@end

@implementation LJKSettingCell

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithTextColor:[UIColor blackColor]
                                 backgroundColor:[UIColor clearColor]
                                        fontSize:15
                                           lines:1
                                   textAlignment:NSTextAlignmentLeft];
    }
    return _nameLabel;
}

- (UILabel *)signLabel {
    if (!_signLabel) {
        _signLabel = [UILabel labelWithTextColor:[UIColor orangeColor]
                                 backgroundColor:[UIColor clearColor]
                                        fontSize:13
                                           lines:1
                                   textAlignment:NSTextAlignmentLeft];
    }
    return _signLabel;
}

- (UIImageView *)detailArrow {
    if (!_detailArrow) {
        _detailArrow = [[UIImageView alloc] init];
        _detailArrow.image = [UIImage imageNamed:@"CellArrow"];
    }
    return _detailArrow;
}

- (UIView *)separatorLine {
    if (!_separatorLine) {
        _separatorLine = [[UIView alloc] init];
        _separatorLine.backgroundColor = Color_DarkGray;
    }
    return _separatorLine;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.iconView];
//        [self.contentView addSubview:self.separatorLine];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.signLabel];
        [self.contentView addSubview:self.detailArrow];
        
//        [_separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
//            make.left.equalTo(self.contentView.mas_left);
//            make.bottom.equalTo(self.contentView.mas_bottom);
//        }];
        
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(LJKAuthorIconWH, LJKAuthorIconWH));
            make.left.equalTo(self.contentView.mas_left).offset(LJKAuthorIcon2CellLeft);
            make.top.equalTo(self.contentView.mas_top).offset(LJKAuthorIcon2CellTop);
        }];
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(LJKAuthorIcon2CellLeft * 2 + LJKAuthorIconWH);
            make.top.equalTo(self.contentView.mas_top).offset(LJKAuthorIcon2CellTop);
            make.right.equalTo(self.detailArrow.mas_left);
            make.bottom.equalTo(self.contentView.mas_centerY);
        }];
        
        [_signLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom);
            make.left.equalTo(self.nameLabel.mas_left);
        }];
        
        [_detailArrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(16, 24));
            make.right.equalTo(self.contentView.mas_right).offset(-LJKAuthorIcon2CellLeft);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
    }
    return self;
}


- (void)setAuthorDetail:(LJKAuthorDetail *)authorDetail {
    _authorDetail = authorDetail;
    
    self.nameLabel.text = authorDetail.name;
    self.signLabel.text = authorDetail.create_time;
    
    self.iconView.image = [[UIImage imageNamed:authorDetail.photo160] imageByRoundCornerRadius:85];
}


@end
