//
//  LJKHelpDetailController.m
//  LJKitchen
//
//  Created by  a on 16/6/10.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKHelpDetailController.h"
#import <Masonry.h>
@interface LJKHelpDetailController ()

@property (nonatomic, strong) UILabel *detailTitleLabel;
@property (nonatomic, strong) UILabel *detailDesLabel;
@property (nonatomic, strong) UIView *containView;
@end

@implementation LJKHelpDetailController

- (UIView *)containView {
    if (!_containView) {
        _containView = [[UIView alloc] init];
        _containView.backgroundColor = [UIColor whiteColor];
    }
    return _containView;
}


- (UILabel *)detailTitleLabel {
    if (!_detailDesLabel) {
        _detailTitleLabel = [[UILabel alloc] init];
        _detailTitleLabel.textColor = Color_DarkGray;
        _detailTitleLabel.font = [UIFont systemFontOfSize:21];
        _detailTitleLabel.backgroundColor = [UIColor clearColor];
        _detailTitleLabel.text = @"    如何在LJKitchen注册？";
    }
    return _detailTitleLabel;
}

- (UILabel *)detailDesLabel {
    if (!_detailDesLabel) {
        _detailDesLabel = [[UILabel alloc] init];
        _detailDesLabel.textAlignment = NSTextAlignmentNatural;
        _detailDesLabel.numberOfLines = 0;
        _detailDesLabel.backgroundColor = [UIColor clearColor];
        _detailDesLabel.font = [UIFont systemFontOfSize:21];
        _detailDesLabel.text = @"打开LJKitchen App,点击首页“开始”，使用第三方账号登录即能完成注册。（LJKitchen目前只支持第三方账号登录注册，不支持邮箱注册，建议您再使用第三方账号登录之后，在网页版账号设置里绑定邮箱，之后也可以用所绑定的邮箱进行登录。）";
    }
    return _detailDesLabel;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color_BackGround;
    
    [self.view addSubview:self.containView];
    [self.view addSubview:self.detailTitleLabel];
    [self.containView addSubview:self.detailDesLabel];
    
    [self.detailTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 50));
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top).offset(64);
    }];
    
    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 200));
        make.top.equalTo(self.detailTitleLabel.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    [self.detailDesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH - 40, 200));
        make.top.equalTo(self.containView.mas_top);
        make.left.equalTo(self.containView.mas_left).offset(20);
        make.right.equalTo(self.containView.mas_right).offset(-20);
    }];
    
}





@end
