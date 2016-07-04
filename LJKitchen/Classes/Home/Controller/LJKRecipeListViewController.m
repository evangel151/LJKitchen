//
//  LJKRecipeListViewController.m
//  LJKitchen
//
//  Created by  a on 16/7/5.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKRecipeListViewController.h"
#import "LJKRecipeListHeader.h"



#import "LJKNetworkTool.h"
#import <MJRefresh.h>
#import <MJExtension.h>

@interface LJKRecipeListViewController ()

@end

@implementation LJKRecipeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupTableViewHeader];
    [self setupTableView];
    [self setupRefresh];
    [self loadNewData];
}

- (void)setupNavigationBar {
    self.title = @"菜单";
    
}

- (void)setupTableViewHeader {
    LJKRecipeListHeader *header = [[LJKRecipeListHeader alloc] init];
    
    self.tableView.tableHeaderView = header;
}

- (void)setupTableView {
    self.tableView.backgroundColor = Color_BackGround;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setupRefresh {
    
}

- (void)loadNewData {
    [LJKNetworkTool afnGet:@""
                    params:nil
                   success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - TableView 数据源 & 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}

@end
