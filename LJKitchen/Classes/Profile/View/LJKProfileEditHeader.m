//
//  LJKProfileEditHeader.m
//  LJKitchen
//
//  Created by  a on 16/6/28.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKProfileEditHeader.h"

#import <Masonry.h>
@interface LJKProfileEditHeader ()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIButton *uploadIcon;
@end


@implementation LJKProfileEditHeader

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"iconLM"];
    }
    return _iconView;
}

- (UIButton *)uploadIcon {
    if (!_uploadIcon) {
        _uploadIcon = [UIButton buttonWithTitle:@"上传我的头像"
                                     titleColor:Color_TintWhite
                                backgroundColor:[UIColor clearColor]
                                       fontSize:15
                                         target:self
                                         action:@selector(uploadIncon:)];
        [_uploadIcon setBackgroundImage:[UIImage imageNamed:@"exit_Button"] forState:UIControlStateNormal];
    }
    return _uploadIcon;
}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.iconView];
        [self addSubview:self.uploadIcon];
        
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(LJKAuthorIconWH, LJKAuthorIconWH));
            make.top.equalTo(self.mas_top).offset(30);
            make.centerX.equalTo(self.mas_centerX);
        }];
        
        [_uploadIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconView.mas_bottom).offset(LJKAuthorIcon2CellTop);
            make.centerX.equalTo(self.mas_centerX);
            make.width.equalTo(@(SCREEN_WIDTH * 0.3));
            make.height.equalTo(@(30));
        }];
    }
    return self;
}

- (void)uploadIncon:(UIButton *)button {
    
}


@end
