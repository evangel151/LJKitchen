//
//  LJKFeedsViewCell.m
//  LJKitchen
//
//  Created by  a on 16/7/1.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKFeedsViewCell.h"
#import "LJKImageShowView.h"
#import "LJKDish.h"
#import "LJKAuthor.h"
#import "LJKComment.h"

#import <Masonry.h>
@interface LJKFeedsViewCell ()
@property (nonatomic, strong) LJKImageShowView *imageShow;
@property (nonatomic, strong) UIView *imagesContainView;
@property (nonatomic, strong) UIImageView *authorIconView;
@property (nonatomic, strong) UILabel *authorNameLabel;
@property (nonatomic, strong) UILabel *authorActionLabel;
@property (nonatomic, strong) UILabel *createdTimeLabel;

@property (nonatomic, strong) UIView *dishNameView;
@property (nonatomic, strong) UILabel *dishNameLabel;
@property (nonatomic, strong) UIImageView *dishViewArrow;

@property (nonatomic, strong) UILabel *diggsCountLabel;
@property (nonatomic, strong) UILabel *diggs;
@property (nonatomic, strong) UILabel *dishDescLabel;

@property (nonatomic, strong) UILabel *firstCommentLabel;
@property (nonatomic, strong) UILabel *secondCommentLabel;
@property (nonatomic, strong) UILabel *totalCmtCountLabel;

@property (nonatomic, strong) UIButton *diggsButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *moreButton;

@property (nonatomic, strong) UIView *separatorLine1;
@property (nonatomic, strong) UIView *separatorLine2;
@end

@implementation LJKFeedsViewCell
#pragma mark - 懒加载 

- (UIView *)imagesContainView {
    if (!_imagesContainView) {
        _imagesContainView = [[UIView alloc] init];
    }
    return _imagesContainView;
}

- (UIImageView *)authorIconView {
    if (!_authorIconView) {
        _authorIconView = [[UIImageView alloc] init];
        UITapGestureRecognizer *tapIcon = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(authorIconDidClicked)];
        [_authorIconView addGestureRecognizer:tapIcon];
    }
    return _authorIconView;
}

- (UILabel *)authorNameLabel {
    if (!_authorNameLabel) {
        _authorNameLabel = [UILabel labelWithTextColor:Color_TintBlack
                                       backgroundColor:Color_Clear
                                              fontSize:15
                                                 lines:1
                                         textAlignment:NSTextAlignmentLeft];
    }
    return _authorNameLabel;
}

- (UILabel *)authorActionLabel {
    if (!_authorActionLabel) {
        _authorActionLabel = [UILabel labelWithTextColor:Color_DarkGray
                                         backgroundColor:Color_Clear
                                                fontSize:15
                                                   lines:1
                                           textAlignment:NSTextAlignmentLeft];
    }
    return _authorActionLabel;
}

- (UILabel *)createdTimeLabel {
    if (!_createdTimeLabel) {
        _createdTimeLabel = [UILabel labelWithTextColor:Color_DarkGray
                                        backgroundColor:Color_Clear
                                               fontSize:13
                                                  lines:1
                                          textAlignment:NSTextAlignmentRight];
    }
    return _createdTimeLabel;
}

- (UIView *)dishNameView {
    if (!_dishNameView) {
        _dishNameView = [[UIView alloc] init];
        _dishNameView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(dishNameViewClicked)];
        [_dishNameView addGestureRecognizer:tap];
    }
    return _dishNameView;
}

- (UILabel *)dishNameLabel {
    if (!_dishNameLabel) {
        _dishNameLabel = [UILabel labelWithTextColor:Color_ThemeColor
                                     backgroundColor:Color_Clear
                                            fontSize:17
                                               lines:1
                                       textAlignment:NSTextAlignmentLeft];
    }
    return _dishNameLabel;
}

- (UIImageView *)dishViewArrow {
    if (!_dishViewArrow) {
        _dishViewArrow = [[UIImageView alloc] init];
        _dishViewArrow.image = [UIImage imageNamed:@"CellArrow"];
    }
    return _dishViewArrow;
}

- (UILabel *)diggsCountLabel {
    if (!_diggsCountLabel) {
        _diggsCountLabel = [UILabel labelWithTextColor:Color_ThemeColor
                                       backgroundColor:Color_Clear
                                              fontSize:15
                                                 lines:1
                                         textAlignment:NSTextAlignmentLeft];
    }
    return _diggsCountLabel;
}


- (UILabel *)diggs {
    if (!_diggs) {
        _diggs = [UILabel labelWithTextColor:Color_TintBlack
                             backgroundColor:Color_Clear
                                    fontSize:15
                                       lines:1
                               textAlignment:NSTextAlignmentLeft];
        _diggs.text = @"赞";
        
    }
    return _diggs;
}


- (UILabel *)dishDescLabel {
    if (!_dishDescLabel) {
        _dishDescLabel = [UILabel labelWithTextColor:Color_TintBlack
                                     backgroundColor:Color_Clear
                                            fontSize:15
                                               lines:0
                                       textAlignment:NSTextAlignmentLeft];
    }
    return _dishDescLabel;
}

- (UILabel *)totalCmtCountLabel {
    if (!_totalCmtCountLabel) {
        _totalCmtCountLabel = [UILabel labelWithTextColor:Color_DarkGray
                                          backgroundColor:Color_Clear
                                                 fontSize:15
                                                    lines:1
                                            textAlignment:NSTextAlignmentLeft];
        UITapGestureRecognizer *tapTotal = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                   action:@selector(totalLabelClicked)];
        [_totalCmtCountLabel addGestureRecognizer:tapTotal];
    }
    return _totalCmtCountLabel;
}

- (UILabel *)firstCommentLabel {
    if (!_firstCommentLabel) {
        _firstCommentLabel = [UILabel labelWithTextColor:Color_TintBlack
                                         backgroundColor:Color_Clear
                                                fontSize:15
                                                   lines:0
                                           textAlignment:NSTextAlignmentLeft];
    }
    return _firstCommentLabel;
}

- (UILabel *)secondCommentLabel {
    if (!_secondCommentLabel) {
        _secondCommentLabel = [UILabel labelWithTextColor:Color_TintBlack
                                          backgroundColor:Color_Clear
                                                 fontSize:15
                                                    lines:0
                                            textAlignment:NSTextAlignmentLeft];
    }
    return _secondCommentLabel;
}

- (UIButton *)diggsButton {
    if (!_diggsButton) {
        _diggsButton = [UIButton buttonWithImageName:@"likeSmall"
                                   selectedImageName:@"likedSmall"
                                              target:self
                                              action:@selector(diggsButtonClicked:)];
    }
    return _diggsButton;
}

- (UIButton *)commentButton {
    if (!_commentButton) {
        _commentButton = [UIButton buttonWithImageName:@"comment"
                                     selectedImageName:@"comment"
                                                target:self
                                                action:@selector(commentButtonClicked)];
    }
    return _commentButton;
}

- (UIButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [UIButton buttonWithImageName:@"convenient_share_other"
                                  selectedImageName:@"convenient_share_other"
                                             target:self
                                             action:@selector(moreButtonClicked)];
    }
    return _moreButton;
}

- (LJKImageShowView *)imageShow {
    if (!_imageShow) {
        _imageShow = [[LJKImageShowView alloc] init];
    }
    return _imageShow;
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
        _separatorLine2.backgroundColor = Color_DarkGray;
    }
    return _separatorLine2;
}

#pragma mark - 构造方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.imagesContainView];
        [self.imagesContainView addSubview:self.imageShow];
        
        [self.contentView addSubview:self.authorIconView];
        [self.contentView addSubview:self.authorNameLabel];
        [self.contentView addSubview:self.authorActionLabel];
        [self.contentView addSubview:self.createdTimeLabel];
        [self.contentView addSubview:self.dishNameView];
        [self.dishNameView addSubview:self.dishNameLabel];
        [self.dishNameView addSubview:self.dishViewArrow];
        
        [self.contentView addSubview:self.dishDescLabel];
        [self.contentView addSubview:self.separatorLine1];
        [self.contentView addSubview:self.diggsCountLabel];
        [self.contentView addSubview:self.diggs];
        [self.contentView addSubview:self.separatorLine2];
        [self.contentView addSubview:self.totalCmtCountLabel];
        
        [self.contentView addSubview:self.firstCommentLabel];
        [self.contentView addSubview:self.secondCommentLabel];
        
        [self.contentView addSubview:self.diggsButton];
        [self.contentView addSubview:self.moreButton];
        [self.contentView addSubview:self.commentButton];
        
        CGFloat totalMargin = LJKAuthorIconWH + 3 * LJKAuthorIcon2CellLeft;
        
        [_imagesContainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 350));
            make.left.equalTo(self.contentView.mas_left);
            make.top.equalTo(self.contentView.mas_top);
        }];
        
        [_imageShow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.imagesContainView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [_authorIconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(LJKAuthorIcon2CellLeft);
            make.top.equalTo(self.imagesContainView.mas_bottom).offset(LJKAuthorIcon2CellTop * 2);
            make.size.mas_equalTo(CGSizeMake(LJKAuthorIconWH, LJKAuthorIconWH));
        }];
        
        [_authorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.authorIconView.mas_centerY);
            make.left.equalTo(self.authorIconView.mas_right).offset(LJKAuthorIcon2CellLeft);
//            make.size.mas_equalTo(CGSizeMake(80, 30));
            make.height.equalTo(@(30));
        }];
        
        [_authorActionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.authorIconView.mas_centerY);
            make.left.equalTo(self.authorNameLabel.mas_right);
            make.height.equalTo(self.authorNameLabel.mas_height);
            make.width.equalTo(@(40));
        }];
        
        [_createdTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.authorIconView.mas_centerY);
            make.right.equalTo(self.contentView.mas_right).offset(-LJKAuthorIcon2CellLeft);
            make.height.equalTo(self.authorNameLabel.mas_height);
            make.left.equalTo(self.authorActionLabel.mas_right).offset(LJKAuthorIcon2CellLeft);
        }];
        
        [_dishNameView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.authorIconView.mas_bottom);
            make.left.equalTo(self.authorNameLabel.mas_left);
            make.right.equalTo(self.contentView.mas_right).offset(-LJKAuthorIcon2CellLeft);
            make.height.equalTo(@(TABBAR_HEIGHT));
        }];
        
        [_dishNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.dishNameView).insets(UIEdgeInsetsMake(0, 0, 0, 34));
        }];
        
        [_dishViewArrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(16, 24));
            make.centerY.equalTo(self.dishNameView.mas_centerY);
            make.right.equalTo(self.dishNameView.mas_right);
        }];
        
        [_dishDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(self.dishNameView);
            make.left.equalTo(self.authorNameLabel.mas_left);
            make.top.equalTo(self.dishNameView.mas_bottom).offset(10);
            make.right.equalTo(self.createdTimeLabel.mas_right);
        }];
        
        [_separatorLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH - totalMargin, 1));
            make.left.equalTo(self.authorNameLabel.mas_left);
            make.top.equalTo(self.dishDescLabel.mas_bottom).offset(1);
        }];
        
        [_diggsCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(60, 44));
            make.height.equalTo(@(TABBAR_HEIGHT));
            make.left.equalTo(self.authorNameLabel.mas_left);
            make.top.equalTo(self.dishDescLabel.mas_bottom);
        }];
        
        [_diggs mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(TABBAR_HEIGHT, TABBAR_HEIGHT));
            make.left.equalTo(self.diggsCountLabel.mas_right);
            make.top.equalTo(self.dishDescLabel.mas_bottom);
        }];
        
        [_separatorLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.separatorLine1);
            make.left.equalTo(self.authorNameLabel.mas_left);
            make.top.equalTo(self.diggsCountLabel.mas_bottom).offset(-1);
        }];
        
        [_totalCmtCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.dishNameView);
            make.left.equalTo(self.authorNameLabel.mas_left);
            make.top.equalTo(self.diggsCountLabel.mas_bottom);
        }];
        
        [_firstCommentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.totalCmtCountLabel.mas_bottom);
            make.left.equalTo(self.authorNameLabel.mas_left);
            make.right.equalTo(self.contentView.mas_right).offset(-LJKAuthorIconWH);
//            make.height.equalTo(@(44));
        }];
        
        [_secondCommentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.firstCommentLabel.mas_bottom).offset(LJKAuthorIcon2CellTop);
            make.left.equalTo(self.authorNameLabel.mas_left);
            make.right.equalTo(self.contentView.mas_right).offset(-LJKAuthorIcon2CellLeft);
//            make.size.mas_equalTo(self.firstCommentLabel);
        }];
        
        [_diggsButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(LJKDiggsButtonWH, LJKDiggsButtonWH));
            make.left.equalTo(self.authorNameLabel.mas_left);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-LJKAuthorIcon2CellTop * 2);
        }];
        
        [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.diggsButton);
            make.right.equalTo(self.contentView.mas_right).offset(-LJKAuthorIcon2CellLeft);
            make.bottom.equalTo(self.diggsButton.mas_bottom);
        }];
        
        [_commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.diggsButton);
            make.left.equalTo(self.diggsButton.mas_right).offset(LJKAuthorIcon2CellLeft);
            make.bottom.equalTo(self.diggsButton.mas_bottom);
        }];
        
        
    }
    return self;
}

- (void)setDish:(LJKDish *)dish {
    _dish = dish;
    
    // 固定值
    self.createdTimeLabel.text = dish.friendly_create_time;
    self.dishNameLabel.text = dish.name;
    self.dishDescLabel.text = dish.desc;
    [self.authorIconView setCircleIconWithUrl:[NSURL URLWithString:dish.author.photo]
                                  placeHolder:@"defaultUserHeader"
                                   cornRadius:85];
    if (dish.is_orphan) {
        self.authorActionLabel.text = @"分享到";
    } else {
        self.authorActionLabel.text = @"做过";
    }
    
    // 用户名label 更新约束
    if (dish.author.name) {
        CGFloat nameWidth = [NSString getSizeWithString:dish.author.name
                                                 height:30
                                                   font:15].width;
        [_authorNameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(nameWidth + 5));
        }];
    } else {
        [_authorNameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(100));
        }];
    }
    self.authorNameLabel.text = dish.author.name;

    
    // 总点赞数更新约束
    NSString *diggs = [NSString stringWithFormat:@"%@人", dish.ndiggs];
    if (dish.ndiggs) {
        CGFloat diggsWidth = [NSString getSizeWithString:diggs
                                                  height:TABBAR_HEIGHT
                                                    font:15].width;
        [_diggsCountLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(diggsWidth + 5));
        }];
    }
    self.diggsCountLabel.text = diggs;
    
    
    // 根据评论数量更新底部视图约束
    self.firstCommentLabel.hidden = YES;
    self.secondCommentLabel.hidden = YES;
    self.totalCmtCountLabel.hidden = YES;
    if (dish.latest_comments.count) { // 有评论 ( >=1 )
        self.firstCommentLabel.hidden = NO;
        LJKComment *firstCmt = [dish.latest_comments lastObject];
        NSString *firstCmtText = [NSString stringWithFormat:@"%@：%@", firstCmt.author.name, firstCmt.txt];
        [self.firstCommentLabel setAttributeTextWithString:firstCmtText
                                                     range:NSMakeRange(0, firstCmt.author.name.length)];
        
        if (dish.latest_comments.count > 1) { // 至少两条评论
            self.secondCommentLabel.hidden = NO;
            LJKComment *secondCmt = dish.latest_comments[dish.latest_comments.count - 2];
            NSString *secondCmtText = [NSString stringWithFormat:@"%@：%@", secondCmt.author.name, secondCmt.txt];
            [self.secondCommentLabel setAttributeTextWithString:secondCmtText
                                                          range:NSMakeRange(0, secondCmt.author.name.length)];
            
            if (dish.latest_comments.count > 2) { // 显示总评论label
                self.totalCmtCountLabel.hidden = NO;
                self.totalCmtCountLabel.text = [NSString stringWithFormat:@"共有%zd条评论",dish.latest_comments.count];
            }
        }
    } else { // 没有评论
        // 更新底部视图约束
        // FIXME:底部视图不完全时，按钮位置会比较难看 还是继续维持距离底部一定距离比较好 
//        [_diggsButton mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.separatorLine2.mas_bottom).offset(LJKAuthorIcon2CellTop);
//            make.left.equalTo(self.authorNameLabel.mas_left);
//            make.size.mas_equalTo(CGSizeMake(LJKDiggsButtonWH, LJKDiggsButtonWH));
//        }];
    }
}


#pragma mark - 图片数据传递
- (void)setImageArray:(NSArray *)imageArray {
    _imageArray = imageArray;
    self.imageShow.imageArray = imageArray;
}

- (void)setImageViewCurrentLocation:(CGFloat)imageViewCurrentLocation {
    _imageViewCurrentLocation = imageViewCurrentLocation;
    self.imageShow.imageViewCurrentLocation = imageViewCurrentLocation;
}

- (void)setType:(LJKShowViewType)type {
    _type = type;
    self.imageShow.type = type;
}

- (void)setImageViewDidScrolledBlock:(void (^)())imageViewDidScrolledBlock {
    _imageViewDidScrolledBlock = imageViewDidScrolledBlock;
    self.imageShow.imageViewDidScrolledBlock = imageViewDidScrolledBlock;
}

#pragma mark - 点击事件回调
// 头像
- (void)authorIconDidClicked {
    !self.actionBlock ? : self.actionBlock(DishViewActionIcon);
}

// 菜谱名
- (void)dishNameViewClicked {
    !self.actionBlock ? : self.actionBlock(DishViewActionName);
}

// 点赞按钮 (包含取反)
- (void)diggsButtonClicked:(UIButton *)button {
     button.selected = !button.selected;
    !self.actionBlock ? : self.actionBlock(DishViewActionDigg);
}

// 评论按钮
- (void)commentButtonClicked {
    !self.actionBlock ? : self.actionBlock(DishViewActionCommment);
}

// 评论总数Label
- (void)totalLabelClicked {
    !self.actionBlock ? : self.actionBlock(DishViewActionCommment);
}

// 更多按钮
- (void)moreButtonClicked {
    !self.actionBlock ? : self.actionBlock(DishViewActionMore);
}

@end
