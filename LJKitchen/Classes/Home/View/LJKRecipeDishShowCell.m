//
//  LJKRecipeDishShowCell.m
//  LJKitchen
//
//  Created by  a on 16/7/10.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKRecipeDishShowCell.h"

#import "LJKDish.h"
#import "LJKRecipe.h"
#import "LJKRecipeStats.h"
#import "LJKGoods.h"

#import <Masonry.h>

@interface LJKRecipeDishShowCell ()
@property (nonatomic, strong) UILabel *dishCountLabel;
@property (nonatomic, strong) UIButton *allDishButton;
@property (nonatomic, strong) UIView *uploadMyDishView;
@property (nonatomic, strong) UIImageView *camera;
@property (nonatomic, strong) UILabel *uploadLabel;

@end

@implementation LJKRecipeDishShowCell

- (UILabel *)dishCountLabel {
    if (!_dishCountLabel) {
        _dishCountLabel = [UILabel labelWithTextColor:Color_TintBlack
                                      backgroundColor:Color_Clear
                                             fontSize:20
                                                lines:1
                                        textAlignment:NSTextAlignmentCenter];
    }
    return _dishCountLabel;
}


- (UIButton *)allDishButton {
    if (!_allDishButton) {
        _allDishButton = [UIButton buttonWithTitle:@"所有作品"
                                        titleColor:Color_TintWhite
                                   backgroundColor:Color_ThemeColor
                                          fontSize:17
                                            target:self
                                            action:@selector(allDishButtonDidClick)];
    }
    return _allDishButton;
}


- (UIView *)uploadMyDishView {
    if (!_uploadMyDishView) {
        _uploadMyDishView = [[UIView alloc] init];
        _uploadMyDishView.backgroundColor = Color_ThemeColor_Alpha;
        UITapGestureRecognizer *tapUpload = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(uploadMyDishViewDidClicked)];
        [_uploadMyDishView addGestureRecognizer:tapUpload];
    }
    return _uploadMyDishView;
}

- (UIImageView *)camera {
    if (!_camera) {
        _camera = [[UIImageView alloc] init];
        _camera.image = [UIImage imageNamed:@"camera"];
    }
    return _camera;
}


- (UILabel *)uploadLabel {
    if (!_uploadLabel) {
        _uploadLabel = [UILabel labelWithTextColor:Color_TintWhite
                                   backgroundColor:Color_Clear
                                          fontSize:15
                                             lines:1
                                     textAlignment:NSTextAlignmentLeft];
        _uploadLabel.text = @"上传我做的这道菜";
    }
    return _uploadLabel;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = Color_BackGround;
        
        [self.contentView addSubview:self.dishCountLabel];
        [self.contentView addSubview:self.allDishButton];
        [self.contentView addSubview:self.uploadMyDishView];
        [self.uploadMyDishView addSubview:self.camera];
        [self.uploadMyDishView addSubview:self.uploadLabel];
        
        [_dishCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.top.equalTo(self.contentView.mas_top).offset(LJKAuthorIcon2CellTop);
            make.height.equalTo(@(LJKDiggsButtonWH));
        }];
        
        [_uploadMyDishView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, TABBAR_HEIGHT));
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        
        [_allDishButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 30));
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.uploadMyDishView.mas_top).offset(-LJKAuthorIcon2CellTop * 2 );
        }];
        
        [_camera mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(25, 25));
            make.centerY.equalTo(self.uploadMyDishView.mas_centerY);
            make.right.equalTo(self.uploadLabel.mas_left).offset(-10);
        }];
        
        [_uploadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.uploadMyDishView.mas_centerY);
            make.right.equalTo(self.contentView.mas_right);
            make.left.equalTo(self.uploadMyDishView.mas_centerX).offset(-60);
            make.height.equalTo(@(30));
        }];
    }
    return self;
}

- (void)setRecipe:(LJKRecipe *)recipe {
    _recipe = recipe;
    
    self.dishCountLabel.text = [NSString stringWithFormat:@"%@个作品", recipe.stats.n_dishes];
}

- (void)setGoods:(LJKGoods *)goods {
    
}

#pragma mark - 点击事件 
- (void)allDishButtonDidClick {
    !self.showAllBlock ? : self.showAllBlock();
}

- (void)uploadMyDishViewDidClicked {
    !self.uploadMyDishBlock ? : self.uploadMyDishBlock();
}

@end
