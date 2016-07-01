//
//  LJKFeedsViewController.m
//  LJKitchen
//
//  Created by  a on 16/7/1.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKFeedsViewController.h"
#import "LJKFeedsViewCell.h"

#import "LJKDish.h"
#import "LJKFeeds.h"
#import "LJKPicture.h"

#import "LJKNetworkTool.h"
#import <MJRefresh.h>
#import <MJExtension.h>

@interface LJKFeedsViewController ()

@property (nonatomic, strong) NSMutableArray *feedsArray;
@property (nonatomic, strong) NSMutableArray *imageViewCurrentLocationArray; // 存储cell内图片轮播器滚动位置
@end

@implementation LJKFeedsViewController

static NSString *feedsCellIdentifier = @"feedsCell";

- (NSMutableArray *)feedsArray {
    if (!_feedsArray) {
        _feedsArray = [NSMutableArray array];
    }
    return _feedsArray;
}

- (NSMutableArray *)imageViewCurrentLocationArray {
    if (!_imageViewCurrentLocationArray) {
        _imageViewCurrentLocationArray = [NSMutableArray array];
    }
    return _imageViewCurrentLocationArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关注动态";
    [self setupNavigationBar];
    [self setupTableView];
    
    [self loadNewData];
}

- (void)setupTableView {
    self.tableView.backgroundColor = Color_BackGround;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[LJKFeedsViewCell class] forCellReuseIdentifier:feedsCellIdentifier];
    
}


- (void)setupNavigationBar {
    UIBarButtonItem *noti = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"notification"]
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(notificationButtonClicked)];
    
    UIBarButtonItem *upload = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"camera"]
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(uploadDishButtonClicked)];
    self.navigationItem.rightBarButtonItems = @[noti,upload];
}

#pragma mark - 数据处理
- (void)loadNewData {
    [LJKNetworkTool afnGet:LJKRequestKitchenFeeds
                    params:nil
                   success:^(id json) {
                       self.feedsArray = [LJKFeeds mj_objectArrayWithKeyValuesArray:json[@"content"][@"feeds"]];
                       if (self.imageViewCurrentLocationArray.count > self.feedsArray.count) {
                           NSUInteger length = self.imageViewCurrentLocationArray.count - self.feedsArray.count;
                           NSRange shouldRemoveRange = NSMakeRange(self.feedsArray.count, length);
                           [self.imageViewCurrentLocationArray removeObjectsInRange:shouldRemoveRange];
                       }
                       // 如果数组为空，添加与模型数据数量相等的 位移数据
                       else if (self.imageViewCurrentLocationArray.count == 0){
                           for (NSInteger index=0; index<self.feedsArray.count; index++) {
                               [self.imageViewCurrentLocationArray addObject:@(0)];
                           }
                       }
                       [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark - TableView 数据源 & 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feedsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    LJKFeedsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:feedsCellIdentifier forIndexPath:indexPath];
    if (self.feedsArray.count) {
        LJKFeeds *feeds = self.feedsArray[indexPath.row];
        
        // 添加主图、附加图到要显示的图片数组
        NSMutableArray *imageArray = [NSMutableArray array];
        if (feeds.dish) [imageArray addObject:feeds.dish.main_pic];
        if (feeds.dish.extra_pics.count) {
            NSArray *extraPicArray = [LJKPicture mj_objectArrayWithKeyValuesArray:feeds.dish.extra_pics];
            [imageArray addObjectsFromArray:extraPicArray];
        }
        cell.type = LJKShowViewTypeDish;
        cell.dish = feeds.dish;
        cell.imageArray = imageArray;
        
        // 赋值每个cell对应的图片滚动位置
        cell.imageViewCurrentLocation = [self.imageViewCurrentLocationArray[indexPath.row] floatValue];
    }
    cell.backgroundColor = Color_BackGround;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.feedsArray.count) {
        LJKFeeds *feeds = self.feedsArray[indexPath.row];
        return feeds.dish.dishCellHeight + feeds.dish.commentViewHeight;
    }
    return 0;
}

#pragma mark - 点击事件 
- (void)notificationButtonClicked {
    
}

- (void)uploadDishButtonClicked {
    
}

@end
