//
//  LJKTopicViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/23.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKTopicViewController.h"
#import "LJKTopicViewCell.h"

#import "LJKNetworkTool.h"

#import <MJRefresh.h>
#import <MJExtension.h>

@interface LJKTopicViewController ()

@end

@implementation LJKTopicViewController


#pragma mark - 页面主体
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"讨论区";
    
    [self setupNav];
    [self setupTableView];
    [self loadNewData];
}

- (void)setupNav {
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(postTopic)];
    self.navigationItem.rightBarButtonItem.tintColor = Color_ThemeColor;
}

- (void)setupTableView {
    
}

#pragma mark - TableView 数据源 & 代理  

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据 --- %zd",indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


#pragma mark - 网络请求
- (void)loadNewData {
    
    [LJKNetworkTool afnGet:@""
                    params:nil
                   success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 点击事件
- (void)postTopic {
     NSLog(@"即将跳转发帖界面——————");
}




@end
