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
#import "LJKBLSViewController.h"

#import "LJKNetworkTool.h"
#import "LJKSearchBar.h"  // 搜索栏控件 
#import "LJKHomeHeader.h" // 首页的顶部视图（整体）
#import "LJKRecipeCell.h" // 主体Cell

#import "LJKNavContent.h"
#import "LJKFeeds.h"
#import "LJKIssues.h"
#import "LJKItems.h"

#import <MJExtension.h>
#import <MJRefresh.h>

@interface LJKHomeViewController ()

@property (nonatomic, strong) LJKHomeHeader *homeHeader;
@property (nonatomic, strong) NSMutableArray *feedsArray;
@property (nonatomic, strong) NSMutableArray *issuesArray;  // 菜谱数据
@property (nonatomic, assign) NSInteger sectionCount;       // 组数
@end

@implementation LJKHomeViewController

static NSString *const recipeCellIdentifier = @"RecipeCell";
static NSString *const recipeHeaderIdentifier = @"RecipeHeader";


#pragma mark - 懒加载
- (NSMutableArray *)feedsArray {
    if (!_feedsArray) {
        self.feedsArray = [NSMutableArray array];
    }
    return _feedsArray;
}

- (NSMutableArray *)issuesArray {
    if (!_issuesArray) {
        self.issuesArray = [NSMutableArray array];
    }
    return _issuesArray;
}


#pragma mark - 页面主体
- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self setupNavigationBar];
    [self setupHomeHeader];
    [self setupTableView];
    [self setupRefresh];
    // 加载最新数据
    [self loadNewData];
}



- (void)setupHomeHeader {
    
    // 加载Header数据
    [self loadNavData];
    
    // 加载header界面
    // 顶部Header的总体高度 = 顶部关注栏 + 中部导航按钮 + 三餐scrollView + 新用户优惠() + 系统状态栏
    CGFloat homeHeaderSum = LJKHomeHeader_TopNav_Height + LJKHomeHeader_CenterNav_Height + LJKHomeHeader_CenterNav_Height + LJKHomeHeader_NewAuthor_Height;
    self.homeHeader = [[LJKHomeHeader alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, homeHeaderSum)];
    self.homeHeader.backgroundColor = Color_BackGround;
    self.tableView.tableHeaderView = self.homeHeader;
    
    // header业务逻辑
    WeakSelf;
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    self.homeHeader.clickBlock = ^(NSInteger clickedAction) {
        // 本周流行菜谱
        if (clickedAction == viewDidClickedActionPopularImageView) {
            [SVProgressHUD showSuccessWithStatus:@"暂无对应数据"];
        }
        // 关注动态
        else if (clickedAction == viewDidClickedActionFeedsView) {

        }
        // 排行榜
        else if (clickedAction == viewDidClickedActionTopListButton) {
            [weakSelf pushWebViewWithUrl:LJKRequestKitchenRankingList];
        }
        // 看视频
        else if (clickedAction == viewDidClickedActionVideoButton) {
            [SVProgressHUD showSuccessWithStatus:@"视频界面数据无法抓包"];
        }
        // 买买买
        else if (clickedAction == viewDidClickedActionBuyButton) {

        }
        // 菜谱分类
        else if (clickedAction == viewDidClickedActionRecipeCategoryButton) {
            [weakSelf pushWebViewWithUrl:LJKRequestKitchenRecipeCategory];
        }
        // 三餐
        else if (clickedAction == viewDidClickedActionBreakfast
                 || clickedAction == viewDidClickedActionLunch
                 || clickedAction == viewDidClickedActionSupper) {
            
            
            [weakSelf.navigationController pushViewController:[[LJKBLSViewController alloc] init] animated:YES];
        }
        // 红包(新用户优惠)
        else if (clickedAction == viewDidClickedActionFristAuthor) {
            
            [SVProgressHUD showSuccessWithStatus:@"跳转至红包界面"];
        }
    };
}

- (void)setupNavigationBar {
    
    LJKSearchBar *searchBar = [LJKSearchBar searchBarWithPlaceholder:@"菜谱、食材"];
    self.navigationItem.titleView = searchBar;
//    WeakSelf;
    searchBar.searchBarShouldBeginEditingBlock = ^{
        
        
    };
    
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

- (void)setupRefresh {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self
                                                                refreshingAction:@selector(loadNewData)];
    // !!!: 上拉至底部时，加载旧数据(假数据，与首页数据相同)
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self
                                                                    refreshingAction:@selector(loadMoreData)];
    
}

- (void)setupTableView {
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = Color_BackGround;
    
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:recipeHeaderIdentifier];
    [self.tableView registerClass:[LJKRecipeCell class] forCellReuseIdentifier:recipeCellIdentifier];
}

#pragma mark - 数据处理 

/** 加载导航数据 */
- (void)loadNavData {
    // 首页Header数据
    // 官方的版本号似乎没更新……
//    NSString *headerUrl = @"http://api.xiachufang.com/v2/init_page_v5.json?version=5.1.1&timezone=Asia%2FShanghai&api_sign=8436824b4ec402b228bf20028d49c9b5&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=7UnwJ-JkQ36hbfrMRoL0fA";
    
    [LJKNetworkTool afnGet:LJKRequestKitchenNav params:nil success:^(id json) {
        
        self.homeHeader.navContent = [LJKNavContent mj_objectWithKeyValues:json[@"content"]];
    } failure:^(NSError *error) {
        NSLog(@"加载header失败 原因:%@", error);
    }];
    
    
    [LJKNetworkTool afnGet:LJKRequestKitchenFeeds params:nil success:^(id json) {
        
        self.feedsArray = [LJKFeeds mj_objectArrayWithKeyValuesArray:json[@"content"][@"feeds"]];
        self.homeHeader.dish = [self.feedsArray[0] dish];
    } failure:^(NSError *error) {
        NSLog(@"加载header失败 原因:%@", error);
    }];

}

//- (void)loadStatus {
//    
//    // 首页TableView主体JSON
//    
//    NSString *url = @"http://api.xiachufang.com/v2/issues/list.json?cursor=&api_key=07397197043fafe11ce5c65c10febf84&size=2&sk=EhUpkVYBSoOT9qAapL0BUw&api_sign=51332747ce48a674bcf0397392410b74&_ts=1465544264.130416&origin=iphone&version=5.5.0&timezone=Asia%2FShanghai&location_code=156320900000000&nonce=F5533FD9-6417-4335-962D-D92D5319250C";
//    
//    /**
//    @"http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=069310ae4fc0b866207dba71320f1c13&sk=7UnwJ-JkQ36hbfrMRoL0fA&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
//     */
//    
//    [LJKNetworkTool afnGet:url params:nil success:^(id json) {
//        
//    // NSLog(@"%@", json);
//    } failure:^(NSError *error) {
//        NSLog(@"加载TableView失败 原因:%@", error);
//    }];
//}

- (void)loadNewData {
    [self.tableView.mj_footer endRefreshing];
    
    [LJKNetworkTool afnGet:LJKRequestKitchenCell
                    params:nil success:^(id json) {
//                        NSLog(@"%@", json);
                        self.issuesArray = [LJKIssues mj_objectArrayWithKeyValuesArray:json[@"content"][@"issues"]];
                        [self.tableView reloadData];
                        [self.tableView.mj_header endRefreshing];
                    } failure:^(NSError *error) {
                        NSLog(@"加载TableView失败 原因:%@", error);
                        [self.tableView.mj_header endRefreshing];
                    }];
    
}

- (void)loadMoreData {
    [self.tableView.mj_header endRefreshing];
    
    [LJKNetworkTool afnGet:LJKRequestKitchenCellMore
                    params:nil
                   success:^(id json) {
                       NSArray *newData = [LJKIssues mj_objectArrayWithKeyValuesArray:json[@"content"][@"issues"]];
                       [self.issuesArray addObjectsFromArray:newData];
                       [self.tableView reloadData];
                       [self.tableView.mj_footer endRefreshing];
                   } failure:^(NSError *error) {
                       NSLog(@"加载更多Cell失败 原因:%@", error);
                       [self.tableView.mj_footer endRefreshing];
                   }];
}

#pragma mark - 导航按钮点击方法
/** 跳转至创建菜谱界面 */
- (void)creatRecipe {
    LJKCreatRecipeController *recipe = [[LJKCreatRecipeController alloc] init];
    [self.navigationController pushViewController:recipe animated:YES];
    
}

/** 跳转至菜篮子界面 */
- (void)basket {
    LJKBasketController *basket = [[LJKBasketController alloc] init];
    [self.navigationController pushViewController:basket animated:YES];
}

#pragma mark - TableView 数据源及代理方法
// 组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.issuesArray.count;
}

// 每组cell数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.issuesArray[section] items_count];
}

// Cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJKIssues *issues = self.issuesArray[indexPath.section];
    LJKItems *item = issues.items[indexPath.row];
    return item.cellHeight;
}

// section 标题高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 280;
}

// 主体cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJKRecipeCell *cell = [tableView dequeueReusableCellWithIdentifier:recipeCellIdentifier
                                                          forIndexPath:indexPath];
    LJKIssues *issues = self.issuesArray[indexPath.section];
    LJKItems *item = issues.items[indexPath.row];
    cell.item = item;
    
    // 头像点击回调
    WeakSelf;
    cell.authorIconClickedBlock = ^{ // 头像点击回调
         NSLog(@"即将进入作者个人主页——————");
        UIViewController *authorViewController = [[UIViewController alloc] init];
        authorViewController.view.backgroundColor = [UIColor orangeColor];
        [weakSelf.navigationController pushViewController:authorViewController animated:YES];
    };
    return cell;
}

/** section 标题Label */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:recipeHeaderIdentifier];
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    UILabel *label = [UILabel labelWithTextColor:[UIColor blackColor]
                                 backgroundColor:Color_BackGround
                                        fontSize:13
                                           lines:0
                                   textAlignment:NSTextAlignmentCenter];
    [headerView.contentView addSubview:label];
    label.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    LJKIssues *issues = self.issuesArray[section];
    label.text = issues.title;
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LJKIssues *issues = self.issuesArray[indexPath.section];
    LJKItems *item = issues.items[indexPath.row];
    
    // 根据模板不同跳转对应界面
    switch (item.template) {
        case LJKCellTemplateTopic:
        case LJKCellTemplateWeeklyMagazine: { // 模板1 6 (帖子/杂志)
            NSLog(@"即将跳转web——————");
            [self pushWebViewWithUrl:item.url];
            break;
        }
        case LJKCellTemplateRecipeList: { // 模板2 (菜单)
             NSLog(@"即将跳转菜单——————");
            break;
        }
        case LJKCellTemplateDish: { // 模板4 (作品)
            NSLog(@"即将跳转作品详情——————");
            break;
        }
        case LJKCellTemplateRecipe: { // 模板5 (菜谱)
            NSLog(@"即将跳转菜谱——————");
            break;
        }
    }
}


#pragma mark - useless 
// string 4 sectionHeader (不适用)
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    LJKIssues *issues = self.issuesArray[section];
//    return issues.title;
//}

@end
