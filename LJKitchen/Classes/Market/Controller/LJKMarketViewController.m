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

@interface LJKMarketViewController ()

@end

@implementation LJKMarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    
}

- (void)setupNavigationBar {
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

- (void)mallSort {
    
    LJKMallSortViewController *mallSort = [[LJKMallSortViewController alloc] init];
    [self.navigationController pushViewController:mallSort animated:YES];
    
}

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