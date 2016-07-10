//
//  LJKDishViewController.m
//  LJKitchen
//
//  Created by  a on 16/7/6.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKDishViewController.h"
#import "LJKFeedsViewCell.h"

#import "LJKDish.h"
#import "LJKPicture.h"

#import "LJKNetworkTool.h"
#import <MJRefresh.h>
#import <MJExtension.h>

@interface LJKDishViewController ()
@property (nonatomic, strong) LJKDish *dish;
@property (nonatomic, strong) NSMutableArray *dishArray;
@property (nonatomic, strong) NSMutableArray *imageViewCurrentLocationArray; // 存储cell内图片轮播器滚动位置
@end

@implementation LJKDishViewController


- (NSMutableArray *)dishArray {
    if (!_dishArray) {
        _dishArray = [[NSMutableArray alloc] init];
    }
    return _dishArray;
}

- (NSMutableArray *)imageViewCurrentLocationArray {
    if (!_imageViewCurrentLocationArray) {
        _imageViewCurrentLocationArray = [NSMutableArray array];
    }
    return _imageViewCurrentLocationArray;
}

static NSString *const dishCellIdentifier = @"dishCell";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupTableView];
    [self loadNewData];
}

- (void)setupNavigationBar {
    self.title = @"菜品";
    self.view.backgroundColor = Color_BackGround;
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"分享"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(shareDish)];
    self.navigationItem.rightBarButtonItem.tintColor = Color_ThemeColor;
}

- (void)setupTableView {
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[LJKFeedsViewCell class] forCellReuseIdentifier:dishCellIdentifier];
}

- (void)loadNewData {
    [LJKNetworkTool afnGet:LJKRequestKitchenDish
                    params:nil
                   success:^(id json) {
                       self.dish = [LJKDish mj_objectWithKeyValues:json[@"content"][@"dish"]];
                       self.title = self.dish.name;
                       NSInteger count = 0;
                       if (self.dish.main_pic) {
                           count = self.dish.extra_pics.count + 1;
                       }
                       [self.imageViewCurrentLocationArray addObject:@(count)];
                       
                       [self.tableView reloadData];
    } failure:^(NSError *error) {
                        NSLog(@"加载失败, 原因:%@", error);
    }];
}

#pragma mark - TableView 数据源 & 代理 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJKFeedsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:dishCellIdentifier];
    cell.backgroundColor = Color_ThemeColor_Yellow;
    
    if (indexPath.row == 0) {
        NSMutableArray *imageArray = [NSMutableArray array];
        if (self.dish) {
            [imageArray addObject:self.dish.main_pic];
        }
        
        if (self.dish.extra_pics.count) {
            NSArray *extraPicArray = [LJKPicture mj_objectArrayWithKeyValuesArray:self.dish.extra_pics];
            [imageArray addObjectsFromArray:extraPicArray];
        }
        cell.dish = self.dish;
        cell.imageArray = imageArray;
        cell.type = LJKShowViewTypeDish;
    }
    
    // 赋值每个cell对应的图片滚动位置
//    cell.imageViewCurrentLocation = [self.imageViewCurrentLocationArray[indexPath.row] floatValue];
    WeakSelf;
    cell.imageViewDidScrolledBlock = ^(CGFloat finalContentOffsetX) {
        // 拿到最后的位置保存到数组中
        weakSelf.imageViewCurrentLocationArray[indexPath.row] = @(finalContentOffsetX);
    };

    
    cell.actionBlock = ^(DishViewAction action) {
        switch (action) {
            case DishViewActionIcon: {     // 用户头像
                [UILabel showMessage:@"即将跳转至关注用户界面"
                     atNavController:weakSelf.navigationController];
                break;
            }
            case DishViewActionName: {     // 菜谱
                [UILabel showMessage:@"即将跳转至对应菜谱界面"
                     atNavController:weakSelf.navigationController];
                break;
            }
            case DishViewActionDigg: {     // 点赞按钮
                //                [UILabel showMessage:@"" atNavController:weakSelf.navigationController];
                break;
            }
            case DishViewActionCommment: { // 评论按钮 & total评论Label
                [UILabel showMessage:@"即将跳转至少全部评论界面"
                     atNavController:weakSelf.navigationController];
                break;
            }
            case DishViewActionMore: {     // 更多按钮
                // TODO: 将feedsViewController内的Alert进行封装
                break;
            }
        }
        
    };
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dish) {
        return self.dish.dishCellHeight + self.dish.commentViewHeight;
    }
    return 0;
}

#pragma mark - 点击事件
- (void)shareDish {
    [UILabel showMessage:@"分享该道菜品" atNavController:self.navigationController];
}


@end
