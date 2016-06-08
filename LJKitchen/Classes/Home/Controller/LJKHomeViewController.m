//
//  LJKHomeViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/8.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKHomeViewController.h"
#import "LJKBasketController.h"
#import "LJKCreatRecipeController.h"
#import "LJKNetworkTool.h"

@interface LJKHomeViewController ()

@end

@implementation LJKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBasic];
    [self setupNavigationBar];
    

}

- (void)setupBasic {
    self.view.backgroundColor = [UIColor purpleColor];
    
//    [self.navigationController.navigationBar setTitleTextAttributes:
//     [NSDictionary dictionaryWithObjectsAndKeys:LJregular(239, 51, 60, 1.0), NSForegroundColorAttributeName,
//      [UIFont systemFontOfSize:17], NSFontAttributeName, nil]];
}

- (void)setupNavigationBar {
    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"homepageCreateRecipeButton"]
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(creatRecipe)];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"buylistButtonImage"]
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(basket)];
}

- (void)creatRecipe {
    
    LJKCreatRecipeController *recipe = [[LJKCreatRecipeController alloc] init];
    [self.navigationController pushViewController:recipe animated:YES];
    
}

- (void)basket {
    LJKBasketController *basket = [[LJKBasketController alloc] init];
    [self.navigationController pushViewController:basket animated:YES];
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
