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

#import "LJKTopic.h"

#import "LJKNetworkTool.h"
#import <MJRefresh.h>
#import <MJExtension.h>

@interface LJKTopicDetailController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation LJKTopicDetailController

#pragma mark - 页面主体
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self setupTableViewHeader];
}


- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.contentInset = UIEdgeInsetsMake(0, 0, TABBAR_HEIGHT, 0);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
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

#pragma mark - tableView 数据源 & 代理 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;

}

@end
