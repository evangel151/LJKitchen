//
//  LJKProfileHeader.m
//  LJKitchen
//
//  Created by  a on 16/6/26.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKProfileHeader.h"
#import "LJKHomeHeaderNavButton.h"
#import "LJKAuthorDetail.h"
#import <Masonry.h>

@interface LJKProfileHeader ()
/**  */
@property (nonatomic, strong) UIView *myInfoView;
/**  */
@property (nonatomic, strong) UIImageView *myInfoIcon;
/**  */
@property (nonatomic, strong) UILabel *myInfoNameLabel;
/**  */
@property (nonatomic, strong) UILabel *myInfoFollowedLabel;
/**  */
@property (nonatomic, strong) UILabel *myInfoFansLabel;
/**  */
@property (nonatomic, strong) UILabel *myInfoSignLabel;
/**  */
@property (nonatomic, strong) UIImageView *myInfoBackground;

/**  */
@property (nonatomic, strong) UIView *navButtons;

/** 绑定手机 */
@property (nonatomic, strong) UIButton *bindMobileButton;

/** 分隔线-1 */
@property (nonatomic, strong) UIView *separatorLine1;
/** 分隔线-2 */
@property (nonatomic, strong) UIView *separatorLine2;

@end

@implementation LJKProfileHeader

#pragma mark - 懒加载
#pragma mark 顶部个人信息 

- (UIView *)myInfoView {
    if (!_myInfoView) {
        _myInfoView = [[UIView alloc] init];
        _myInfoView.backgroundColor = [UIColor clearColor];
    }
    return _myInfoView;
}

- (UIImageView *)myInfoIcon {
    if (!_myInfoIcon) {
        _myInfoIcon = [[UIImageView alloc] init];
    }
    return _myInfoIcon;
}

- (UILabel *)myInfoNameLabel {
    if (!_myInfoNameLabel) {
        _myInfoNameLabel = [UILabel labelWithTextColor:[UIColor blackColor]
                                       backgroundColor:[UIColor clearColor]
                                              fontSize:17
                                                 lines:1
                                         textAlignment:NSTextAlignmentLeft];
    }
    return _myInfoNameLabel;
}

- (UILabel *)myInfoFollowedLabel {
    if (!_myInfoFollowedLabel) {
        _myInfoFollowedLabel = [UILabel labelWithTextColor:Color_DarkGray
                                           backgroundColor:[UIColor clearColor]
                                                  fontSize:13
                                                     lines:1
                                             textAlignment:NSTextAlignmentLeft];
    }
    return _myInfoFollowedLabel;
}

- (UILabel *)myInfoFansLabel {
    if (!_myInfoFansLabel) {
        _myInfoFansLabel = [UILabel labelWithTextColor:Color_DarkGray
                                       backgroundColor:[UIColor clearColor]
                                              fontSize:13
                                                 lines:1
                                         textAlignment:NSTextAlignmentLeft];
    }
    return _myInfoFansLabel;
}

- (UILabel *)myInfoSignLabel {
    if (!_myInfoSignLabel) {
        _myInfoSignLabel = [UILabel labelWithTextColor:Color_DarkGray
                                       backgroundColor:[UIColor clearColor]
                                              fontSize:13
                                                 lines:1
                                         textAlignment:NSTextAlignmentLeft];
    }
    return _myInfoSignLabel;
}

- (UIImageView *)myInfoBackground {
    if (!_myInfoBackground) {
        _myInfoBackground = [[UIImageView alloc] init];
        _myInfoBackground.image = [UIImage imageNamed:@"profile_info_background"];
    }
    return _myInfoBackground;
}

- (UIView *)navButtons {
    if (!_navButtons) {
        _navButtons = [[UIView alloc] init];
        _navButtons.backgroundColor = [UIColor blueColor];
    }
    return _navButtons;
}

- (UIButton *)bindMobileButton {
    if (!_bindMobileButton) {
        _bindMobileButton = [UIButton buttonWithTitle:@"绑定手机"
                                           titleColor:Color_ThemeColor
                                      backgroundColor:[UIColor whiteColor]
                                             fontSize:15
                                               target:self
                                               action:@selector(bindMobile)];
        [_bindMobileButton setImage:[UIImage imageNamed:@"bindMobile"] forState:UIControlStateNormal];
    }
    return _bindMobileButton;
}

- (UIView *)separatorLine1 {
    if (!_separatorLine1) {
        _separatorLine1 = [[UIView alloc] init];
        _separatorLine1.backgroundColor = Color_DarkGray;
    }
    return _separatorLine1;
}

- (UIView *)separatorLine2 {
    if (!_separatorLine2) {
        _separatorLine2 = [[UIView alloc] init];
        _separatorLine2.backgroundColor = Color_ThemeColor;
    }
    return _separatorLine2;
}






#pragma mark 中部导航按钮组

#pragma mark 下部绑定手机按钮


#pragma mark - 构造方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.myInfoView];
        [self.myInfoView addSubview:self.myInfoBackground];
        [self.myInfoView addSubview:self.myInfoIcon];
        [self.myInfoView addSubview:self.myInfoNameLabel];
        [self.myInfoView addSubview:self.myInfoFollowedLabel];
        [self.myInfoView addSubview:self.myInfoFansLabel];
        [self.myInfoView addSubview:self.myInfoSignLabel];
        [self.myInfoView addSubview:self.separatorLine1];
        
        [self addSubview:self.navButtons];
        [self.navButtons addSubview:self.separatorLine2];
        
        [self addSubview:self.bindMobileButton];
        
        
        [_myInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 100));
            make.top.equalTo(self);
            make.left.equalTo(self);
        }];
        
        [_myInfoBackground mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.myInfoView);
        }];
        
        [_myInfoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.myInfoView.mas_left).offset(LJKAuthorIcon2CellLeft);
            make.centerY.equalTo(self.myInfoView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(LJKAuthorIconsWH, LJKAuthorIconsWH));
        }];
        
        [_myInfoNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.myInfoIcon.mas_right).offset(LJKAuthorIcon2CellLeft);
            make.right.equalTo(self.mas_right).offset(-LJKAuthorIcon2CellLeft);
            make.top.equalTo(self.myInfoIcon.mas_top);
            make.height.equalTo(@(20));
        }];
        
        [_myInfoFollowedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.myInfoNameLabel.mas_bottom);
            make.left.equalTo(self.myInfoNameLabel.mas_left);
            make.height.equalTo(@(20));
            make.width.equalTo(@(100));
        }];
        
        [_myInfoFansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.myInfoFollowedLabel.mas_top);
            make.left.equalTo(self.myInfoFollowedLabel.mas_right);
            make.size.mas_equalTo(self.myInfoFollowedLabel);
        }];
        
        [_myInfoSignLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.myInfoNameLabel);
            make.left.equalTo(self.myInfoNameLabel.mas_left);
            make.top.equalTo(self.myInfoFollowedLabel.mas_bottom);
        }];
        
        [_separatorLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.myInfoView.mas_left);
            make.bottom.equalTo(self.myInfoView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        }];
        
        [_navButtons mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.myInfoView.mas_bottom);
            make.left.equalTo(self.mas_left);

            make.height.equalTo(@(LJKHomeHeader_CenterNav_Height));
        }];
        
        [_separatorLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.navButtons.mas_left);
            make.bottom.equalTo(self.navButtons.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        }];
        
        [_bindMobileButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 44));
            make.top.equalTo(self.navButtons.mas_bottom);
            make.left.equalTo(self.mas_left);
        }];
        
    }
    return self;
}

- (void)setAuthorDetail:(LJKAuthorDetail *)authorDetail {
    _authorDetail = authorDetail;
    self.myInfoIcon.image = [[UIImage imageNamed:authorDetail.photo160] imageByRoundCornerRadius:85];
    self.myInfoNameLabel.text = authorDetail.name;
    
    self.myInfoFollowedLabel.text = [NSString stringWithFormat:@"%@关注", authorDetail.nfollow];
    self.myInfoFansLabel.text = [NSString stringWithFormat:@"%@粉丝", authorDetail.nfollowed];
    self.myInfoSignLabel.text = [NSString stringWithFormat:@"加入时间:%@", authorDetail.create_time];
}

@end
