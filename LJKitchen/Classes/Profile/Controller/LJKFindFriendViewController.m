//
//  LJKFindFriendViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/8.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKFindFriendViewController.h"
#import "LJKSearchBar.h"

@interface LJKFindFriendViewController ()

@end

@implementation LJKFindFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = Color_BackGround;
    LJKSearchBar *searchBar = [LJKSearchBar searchBarWithPlaceholder:@"搜厨友"];
    self.navigationItem.titleView = searchBar;

    //
    searchBar.searchBarShouldBeginEditingBlock = ^{

    };


}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
