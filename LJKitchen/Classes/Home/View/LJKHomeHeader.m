//
//  LJKHomeHeader.m
//  LJKitchen
//
//  Created by  a on 16/6/12.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKHomeHeader.h"
#import "LJKHomeHeaderTopNav.h"
#import "LJKHomeHeaderNavButton.h"

#import <Masonry.h>

@interface LJKHomeHeader () <UIScrollViewDelegate>

@property (nonatomic, strong) LJKHomeHeaderTopNav *popular_TopNavLeft; // 流行菜谱
@property (nonatomic, strong) LJKHomeHeaderTopNav *friend_TopNavRight; // 查找关注
@property (nonatomic, strong) UIView *navButtonsView;                  // 导航按钮（容器）
@property (nonatomic, strong) UIView *dishNavView;                     // 三餐导航
@property (nonatomic, strong) UIScrollView *scrollView;                // 三餐滚动视图(容器)
@property (nonatomic, strong) UIButton *fristAuthorButton;             // 新用户优惠
@property (nonatomic, strong) UIPageControl *pageControl;              // ScrollView控制器
@end

@implementation LJKHomeHeader

- (LJKHomeHeaderTopNav *)popular_TopNavLeft {
    if (!_popular_TopNavLeft) {
        _popular_TopNavLeft = [LJKHomeHeaderTopNav imageViewWithTitle:@"本周流行菜谱"
                                                                target:self
                                                               action:@selector(popular)];
    }
    return _popular_TopNavLeft;
}

- (LJKHomeHeaderTopNav *)friend_TopNavRight {
    if (!_friend_TopNavRight) {
        _friend_TopNavRight = [LJKHomeHeaderTopNav imageViewWithTitle:@"查找好友并关注"
                                                               target:self
                                                               action:@selector(friend)];
    }
    return _friend_TopNavRight;
}

- (UIView *)navButtonsView {
    if (!_navButtonsView) {
        _navButtonsView = [[UIView alloc] init];
        _navButtonsView.backgroundColor = [UIColor orangeColor];
    }
    return _navButtonsView;
}

- (UIButton *)fristAuthorButton {
    if (!_fristAuthorButton) {
        _fristAuthorButton = [[UIButton alloc] init];
        [_fristAuthorButton setTitle:@"新用户优惠20元！" forState:UIControlStateNormal];
        _fristAuthorButton.backgroundColor = [UIColor purpleColor];
        [_fristAuthorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _fristAuthorButton;
}

- (UIView *)dishNavView {
    if (!_dishNavView) {
        _dishNavView = [[UIView alloc] init];
        _dishNavView.backgroundColor = [UIColor blueColor];
    }
    return _dishNavView;
}


- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
//        _pageControl.hidesForSinglePage = YES;
        _pageControl.userInteractionEnabled = NO;
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = Color_ThemeColor;
    }
    return _pageControl;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.popular_TopNavLeft];
        [self addSubview:self.friend_TopNavRight];
        [self addSubview:self.navButtonsView];
        [self addSubview:self.fristAuthorButton];
        [self addSubview:self.dishNavView];
        [self.dishNavView addSubview:self.scrollView];
        [self.dishNavView addSubview:self.pageControl];
        
        // 顶部左侧 本周流行
        [_popular_TopNavLeft mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.equalTo(self);
            make.height.equalTo(@(LJKHomeHeader_TopNav_Height));
            make.width.equalTo(self.mas_width).offset(-0.5).multipliedBy(0.5);
        }];
        
        // 顶部右侧 查找关注
        [_friend_TopNavRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.height.equalTo(self.popular_TopNavLeft);
            make.width.equalTo(self.popular_TopNavLeft);
        }];
    
        // 导航按钮组
        [_navButtonsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.popular_TopNavLeft.mas_bottom);
            make.left.equalTo(self);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(@(LJKHomeHeader_CenterNav_Height));
//            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 90));
        }];
        
        
        [_fristAuthorButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self.navButtonsView.mas_bottom);
            make.height.equalTo(@(LJKHomeHeader_NewAuthor_Height));
        }];
        
        // 三餐
        [_dishNavView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.fristAuthorButton.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(@(LJKHomeHeader_BottomNav_Height));
        }];
        
        // 滚动视图容器
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.dishNavView);
        }];
        
        // 页面控制器 (位于scrollView 中下部)
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.dishNavView);
            make.centerY.equalTo(self.dishNavView.mas_bottom).offset(-10);
        }];

    }
    return self;
}


#pragma mark - Header 各位置 点击事件
- (void)popular {
    
}

- (void)friend {
    
}


@end
