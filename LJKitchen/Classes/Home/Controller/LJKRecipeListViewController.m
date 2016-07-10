//
//  LJKRecipeListViewController.m
//  LJKitchen
//
//  Created by  a on 16/7/5.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKRecipeListViewController.h"
#import "LJKRecipeListHeader.h"
#import "LJKRecipeCell.h"

#import "LJKRecipeList.h"
#import "LJKRecipe.h"

#import "LJKNetworkTool.h"
#import <MJRefresh.h>
#import <MJExtension.h>

@interface LJKRecipeListViewController ()
@property (nonatomic, strong) LJKRecipeList *recipeList;
@property (nonatomic, strong) LJKRecipeListHeader *header;
@end

@implementation LJKRecipeListViewController

static NSString *const recipeListCellIdentifier = @"recipeListCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupTableView];
    [self setupRefresh];
    [self loadNewData];

    
    
}

- (void)setupNavigationBar {
    self.title = @"菜单";
    
}

//- (void)setupTableViewHeader {
//    
//}

- (void)setupTableView {
    self.tableView.backgroundColor = Color_BackGround;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[LJKRecipeCell class]
           forCellReuseIdentifier:recipeListCellIdentifier];
}

- (void)setupRefresh {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self
                                                                refreshingAction:@selector(loadNewData)];
}

- (void)loadNewData {
    [LJKNetworkTool afnGet:LJKRequestKitchenRecipeList
                    params:nil
                   success:^(id json) {
                       self.recipeList = [LJKRecipeList mj_objectWithKeyValues:json[@"content"]];
                       [self.tableView reloadData];
                       
                       self.header = [[LJKRecipeListHeader alloc] init];
                       self.header.recipeList = self.recipeList;
                       self.header.frame  = CGRectMake(0, 0, SCREEN_WIDTH, self.recipeList.headerheight);
                       
                       WeakSelf;
                       weakSelf.header.recipeHeaderActionBlock = ^(recipeHeaderAction action) {
                           switch (action) {
                               case RecipeHeaderActionAuthorName: {
                                   [UILabel showMessage:@"跳转至菜谱创简者介绍" atNavController:weakSelf.navigationController];
                                   break;
                               }
                               case RecipeHeaderActionCollected: {
                                   [UILabel showMessage:@"加入收藏 or 取消收藏" atNavController:weakSelf.navigationController];
                                   break;
                               }
                           }
                       };
                       self.tableView.tableHeaderView = self.header;

                       
                       [self.tableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
                        NSLog(@"加载失败，原因:%@", error);
                        [self.tableView.mj_header endRefreshing];
    }];
}

#pragma mark - TableView 数据源 & 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recipeList.sample_recipes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJKRecipeCell *cell = [tableView dequeueReusableCellWithIdentifier:recipeListCellIdentifier];
    LJKRecipe *recipe = self.recipeList.sample_recipes[indexPath.row];
    cell.recipe = recipe;
    
    WeakSelf;
    cell.authorIconClickedBlock  = ^{
        [UILabel showMessage:@"跳转至菜谱作者" atNavController:weakSelf.navigationController];
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 320;
}




@end
