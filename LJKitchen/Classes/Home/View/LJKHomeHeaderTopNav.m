//
//  LJKHomeHeaderTopNav.m
//  LJKitchen
//
//  Created by  a on 16/6/12.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKHomeHeaderTopNav.h"
#import <Masonry.h>

@interface LJKHomeHeaderTopNav ()
/** 模糊处理 */
@property (nonatomic, strong) UIImageView *contentView;
/** 标题  (覆盖在标题上) */
@property (nonatomic, strong) UILabel *titleLabel;
@end


@implementation LJKHomeHeaderTopNav


- (UIImageView *)contentView {
    if (!_contentView) {
        _contentView = [[UIImageView alloc] init];
        _contentView.backgroundColor = LJregular(0, 0, 0, 0.2);
    }
    return _contentView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.textColor = Color_TintWhite;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        
        [self addSubview:self.contentView];
        [self addSubview:self.titleLabel];
        
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(1, 1, 1, 1));
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.bottom.equalTo(self.mas_bottom).offset(-15);
        }];
    }
    return self;
}

+ (nonnull LJKHomeHeaderTopNav *)imageViewWithTitle:(nonnull NSString *)title
                                             target:(nullable id)target
                                             action:(nullable SEL)action {
    LJKHomeHeaderTopNav *imageV = [[LJKHomeHeaderTopNav alloc] init];
    imageV.titleLabel.text = title;
    imageV.userInteractionEnabled = YES;
    // 为imageView添加手势事件
    [imageV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
    return imageV;
}


@end
