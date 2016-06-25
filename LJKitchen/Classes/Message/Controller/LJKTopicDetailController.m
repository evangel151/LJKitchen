//
//  LJKTopicDetailController.m
//  LJKitchen
//
//  Created by  a on 16/6/24.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKTopicDetailController.h"
#import "LJKTopicViewCell.h"
#import "LJKTopicDetailCell.h"
#import "LJKTopicComposeBar.h"

#import "LJKTopic.h"
#import "LJKTopicComment.h"
#import "LJKCommentsTool.h"

#import "LJKNetworkTool.h"
#import <MJRefresh.h>
#import <MJExtension.h>
#import <Masonry.h>

@interface LJKTopicDetailController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *commentsArray;
@property (nonatomic, strong) LJKTopicComposeBar *composeBar;
@end

@implementation LJKTopicDetailController

static NSString *const commentIdentifier = @"commentCell";

#pragma mark - 懒加载
- (NSMutableArray *)commentsArray {
    if (!_commentsArray) {
        _commentsArray = [NSMutableArray arrayWithArray:[LJKCommentsTool totalComments]]; // 加载假数据……
    }
    return _commentsArray;
}




#pragma mark - 页面主体
- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self setupTableView];
    [self setupTableViewHeader];
    // !!!: 添加顺序改变可以会对布局效果造成影响
    [self setupComposeBar];
}


- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.contentInset = UIEdgeInsetsMake(0, 0, TABBAR_HEIGHT, 0);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.bounces = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView registerClass:[LJKTopicDetailCell class] forCellReuseIdentifier:commentIdentifier];
    
    self.tableView = tableView;
}


- (void)setupTableViewHeader {

    LJKTopicViewCell *cell = [[LJKTopicViewCell alloc] init];
    cell.topic = self.topic;
    cell.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.topic.detailHeaderHeight);
    
    // !!!: (已解决) cell可以直接为tableViewHeader赋值  
//    UIView *header = [[UIView alloc] init];
//    header.frame = CGRectMake(0, 0, SCREEN_WIDTH, 400);
//    [header addSubview:cell];
    self.tableView.tableHeaderView = cell;
}

- (void)setupComposeBar {
    WeakSelf;
    LJKTopicComposeBar *composeBar = [LJKTopicComposeBar addCompostBarWithEditingTextBlock:^(NSString *compose) {
//        weakSelf.composeBar.frame = CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH, 44);
        [weakSelf.composeBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.inputView.mas_top);
        }];
    }];
    
    [self.view addSubview:composeBar];
    self.composeBar = composeBar;
    
    [composeBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, TABBAR_HEIGHT));
    }];

    
}

#pragma mark - tableView 数据源 & 代理 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.commentsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *ID = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
    LJKTopicDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:commentIdentifier];
    cell.comment = self.commentsArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return [self.commentsArray[indexPath.row] cellHeight];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

@end
