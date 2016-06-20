//
//  LJKMarketViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/8.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKMarketViewController.h"
#import "LJKMallSortViewController.h"
#import "LJKShoppingSortViewController.h"
#import "LJKSearchBar.h"

@interface LJKMarketViewController ()

@end

@implementation LJKMarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    
}

- (void)setupNavigationBar {
    
    LJKSearchBar *searchBar = [LJKSearchBar searchBarWithPlaceholder:@"小杨生煎"];
    self.navigationItem.titleView = searchBar;
    //    WeakSelf;
    searchBar.searchBarShouldBeginEditingBlock = ^{
        //        XCFSearchViewController *searchCon = [[XCFSearchViewController alloc] initWithStyle:UITableViewStyleGrouped];
        //        [weakSelf.navigationController pushViewController:searchCon animated:YES];
    };
    
    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftPageButtonBackgroundNormal"]
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(mallSort)];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"shoppingCart"]
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(shoppingCart)];
}

#pragma mark - barButton 点击事件 
// 市集分类
- (void)mallSort {
    LJKMallSortViewController *mallSort = [[LJKMallSortViewController alloc] init];
    [self.navigationController pushViewController:mallSort animated:YES];
}

// 购物车 
- (void)shoppingCart {
    LJKShoppingSortViewController *cart = [[LJKShoppingSortViewController alloc] init];
    [self.navigationController pushViewController:cart animated:YES];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}



@end
