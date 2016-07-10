//
//  LJKRecipeViewController.m
//  LJKitchen
//
//  Created by  a on 16/7/6.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKRecipeViewController.h"
#import "LJKRecipeViewHeader.h"

#import "LJKRecipeIngredientCell.h"
#import "LJKRecipeInstructionCell.h"
#import "LJKRecipeTipsCell.h"
#import "LJKRecipeAddToListCell.h"
#import "LJKRecipeDishShowCell.h"

#import "LJKRecipeSupplementaryFooter.h"
#import "LJKRecipeAddListFooter.h"

#import "LJKDish.h"
#import "LJKRecipe.h"
#import "LJKRecipeList.h"
#import "LJKRecipeIngredient.h"
#import "LJKRecipeInstruction.h"


#import "LJKNetworkTool.h"
#import <MJRefresh.h>
#import <MJExtension.h>

@interface LJKRecipeViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LJKRecipeViewHeader *header;

@property (nonatomic, strong) LJKRecipe *recipe;
@property (nonatomic, strong) NSMutableArray *dishArray;
@property (nonatomic, strong) NSMutableArray *recipeListArray;
@property (nonatomic, strong) NSMutableArray *title_sections;

@end

@implementation LJKRecipeViewController

static NSString *const recipeHeaderIdentifier = @"RecipeHeader";              // Header
static NSString *const recipeFooterSupplyIdentifier = @"SupplyFooter";        // Footer (追加描述)
static NSString *const recipeFooterAddListIdentifier = @"AddListFooter";      // Footer (加入菜单)

static NSString *const recipeIngredientIdentifier = @"IngredientCell";        // 用料
static NSString *const recipeInstructionIdentifier = @"InstructionCell";      // 步骤
static NSString *const recipeTipsIdentifier = @"TipsCell";                    // 小贴士
static NSString *const recipeAddToListIdentifier = @"AddListCell";            // 被加入的菜单
static NSString *const recipeDishShowIdentifier = @"DishShowCell";            // 作品展示

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.bounces = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dishArray {
    if (!_dishArray) {
        _dishArray = [NSMutableArray array];
    }
    return _dishArray;
}

- (NSMutableArray *)recipeListArray {
    if (!_recipeListArray) {
        _recipeListArray = [NSMutableArray array];
    }
    return _recipeListArray;
}

- (NSMutableArray *)title_sections {
    if (!_title_sections) {
        _title_sections = [NSMutableArray arrayWithObjects:@"用料",@"做法",@"小贴士",@"被加入的菜单",@"", nil];
    }
    return _title_sections;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupTableView];
    [self setupTableViewHeader];
    [self loadNewData];
}

- (void)setupNavigationBar {
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"buylistButtonImage"]
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(buyListButtonDidClicked)];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@""
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(backButtonDidClicked)];
    back.image = [UIImage imageNamed:@"backStretchBackgroundNormal"];

    
    UIBarButtonItem *sharePYQ = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(PYQButtonDidClicked)];
    sharePYQ.image = [UIImage imageNamed:@"convenient_share_pyq"];
    sharePYQ.tintColor = Color_DarkGray;
    UIBarButtonItem *shareWX = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(WeChatButtonDidClicked)];
    shareWX.image = [UIImage imageNamed:@"convenient_share_wx"];
    shareWX.tintColor = Color_DarkGray;
    UIBarButtonItem *shareOther = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(OtherButtonDidClicked)];
    shareOther.image = [UIImage imageNamed:@"share_other"];
    shareOther.tintColor = Color_DarkGray;
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:back, sharePYQ, shareWX, shareOther,nil];
}

- (void)setupTableView {
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = Color_BackGround;
    
    // Header(主体)
    [self.tableView registerClass:[UITableViewHeaderFooterView  class]
forHeaderFooterViewReuseIdentifier:recipeHeaderIdentifier];
    // Footer(追加描述 - 留言/同好/举报)
    [self.tableView registerClass:[LJKRecipeSupplementaryFooter class]
forHeaderFooterViewReuseIdentifier:recipeFooterSupplyIdentifier];
    // Footer(加入菜单 )
    [self.tableView registerClass:[LJKRecipeAddListFooter class]
forHeaderFooterViewReuseIdentifier:recipeFooterAddListIdentifier];
    
    // 用料
    [self.tableView registerClass:[LJKRecipeIngredientCell class]
           forCellReuseIdentifier:recipeIngredientIdentifier];
    // 步骤
    [self.tableView registerClass:[LJKRecipeInstructionCell class]
           forCellReuseIdentifier:recipeInstructionIdentifier];
    // 小贴士
    [self.tableView registerClass:[LJKRecipeTipsCell class]
           forCellReuseIdentifier:recipeTipsIdentifier];
    // 被加入的菜单
    [self.tableView registerClass:[LJKRecipeAddToListCell class]
           forCellReuseIdentifier:recipeAddToListIdentifier];
    // 作品展示
    [self.tableView registerClass:[LJKRecipeDishShowCell class]
           forCellReuseIdentifier:recipeDishShowIdentifier];
    
}

- (void)setupTableViewHeader {
    [self loadHeaderData];
}

#pragma mark - 数据处理
- (void)loadHeaderData {
    [LJKNetworkTool afnGet:LJKRequestKitchenRecipe
                    params:nil
                   success:^(id json) {
                       self.recipe = [LJKRecipe mj_objectWithKeyValues:json[@"content"][@"recipe"]];
                       self.header = [[LJKRecipeViewHeader alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.recipe.headerHeight)];
                       self.header.recipe = self.recipe;
                       self.tableView.tableHeaderView = self.header;
                       
                       WeakSelf;
                       self.header.clickedBlock = ^(NSInteger HeaderDidClickedAction) {
                           switch (HeaderDidClickedAction) {
                               case RecipeHeaderActionAuthorIconClicked:{
                                   [UILabel showMessage:@"Header - 作者头像点击回调"
                                        atNavController:weakSelf.navigationController];
                                   break;
                               }
                               case RecipeHeaderActionCollectedButtonClicked:{
                                   [UILabel showMessage:@"Header - 收藏按钮点击回调"
                                        atNavController:weakSelf.navigationController];
                                   break;
                               }
                               case RecipeHeaderActionBasketButtonClicked:{
                                   [UILabel showMessage:@"Header - 菜篮子按钮点击回调"
                                        atNavController:weakSelf.navigationController];
                                   break;
                               }
                           }
                       };

                                                   
    } failure:^(NSError *error) {
                        NSLog(@"%@", error);
    }];
}


- (void)loadNewData {
    [LJKNetworkTool afnGet:LJKRequestKitchenRecipeDish
                    params:nil
                   success:^(id json) {
                       self.dishArray = [LJKDish mj_objectArrayWithKeyValuesArray:json[@"content"][@"dishes"]];
                       [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
    [LJKNetworkTool afnGet:LJKRequestKitchenAddedRecipeList
                    params:nil
                   success:^(id json) {
                       self.recipeListArray = [LJKRecipeList mj_objectArrayWithKeyValuesArray:json[@"content"][@"recipe_lists"]];
                       [self.tableView reloadData];
    } failure:^(NSError *error) {
                        NSLog(@"%@", error);
    }];
}

#pragma mark - TableView 数据源 & 代理
#pragma mark Sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

#pragma mark Rows In Section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    if (section == 0) {                         // 用料
        return self.recipe.ingredient.count;
    } else if (section == 1) {                  // 做法
        return self.recipe.instruction.count;
    } else if (section == 2) {                  // 小贴士
        if (!self.recipe.tips.length) {
            return 0;
        } else {
            return 1;
        }
    } else if (section == 3) {                  // 被加入的菜单
        return self.recipeListArray.count;
    } else if (section == 4) {                  // 作品
        return 1;
    }
    return 0;
}

#pragma mark Cell For Row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    WeakSelf;
    if (indexPath.section == 0) {
        LJKRecipeIngredientCell *cell = [tableView dequeueReusableCellWithIdentifier:recipeIngredientIdentifier
                                                                        forIndexPath:indexPath];
        cell.ingredient = self.recipe.ingredient[indexPath.row];
        return cell;
    }
    // 做法
    else if (indexPath.section == 1) {
        LJKRecipeInstructionCell *cell = [tableView dequeueReusableCellWithIdentifier:recipeInstructionIdentifier
                                                                         forIndexPath:indexPath];
        cell.instruction = self.recipe.instruction[indexPath.row];
        return cell;
    }
    // 小贴士
    else if (indexPath.section == 2) {
        LJKRecipeTipsCell * cell = [tableView dequeueReusableCellWithIdentifier:recipeTipsIdentifier
                                                                   forIndexPath:indexPath];
        cell.recipe = self.recipe;
        return cell;
    }
    // 被加入的菜单
    else if (indexPath.section == 3) {

        LJKRecipeAddToListCell *cell = [tableView dequeueReusableCellWithIdentifier:recipeAddToListIdentifier
                                                                       forIndexPath:indexPath];
        cell.recipeList = self.recipeListArray[indexPath.row];

        return cell;
    }
    // 作品展示
    else if (indexPath.section == 4) {
        LJKRecipeDishShowCell *cell = [tableView dequeueReusableCellWithIdentifier:recipeDishShowIdentifier
                                                                      forIndexPath:indexPath];
        cell.recipe = self.recipe;
        cell.showAllBlock = ^(){
            [UILabel showMessage:@"全部作品" atNavController:weakSelf.navigationController];
        };
        
        cell.uploadMyDishBlock = ^() {
            [UILabel showMessage:@"跳转至上传作品" atNavController:weakSelf.navigationController];
        };
        return cell;
    }

    return nil;
}

#pragma mark Cell's Height For Row
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 用料
    if (indexPath.section == 0) {
        return [self.recipe.ingredient[indexPath.row] cellHeight];
    }
    // 做法
    else if (indexPath.section == 1) {
        return [self.recipe.instruction[indexPath.row] cellHeight];
    }
     // 小贴士
    else if (indexPath.section == 2) {

        if (!self.recipe.tips.length) { // has Tips
            return 0;
        } else {                        // none Tips
            return self.recipe.tipsHeight;
        }
    }
    // 被加入的菜单
    else if (indexPath.section == 3) {
        
        if (self.recipeListArray.count) {
            return 80;
        } else {
            return 0;
        }
        
    }
    // 作品
    else if (indexPath.section == 4) {
        return self.dishArray.count ? SCREEN_HEIGHT * 0.5 + 160 : 0;
    }
    
    return 0;
}

#pragma mark HeaderFooterView In different Section
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    // "小贴士"Footer (菜谱的追加描述 留言 / 同好 / 举报)
    WeakSelf;
    if (section == 2) {
        LJKRecipeSupplementaryFooter *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:recipeFooterSupplyIdentifier];

        footer.recipe = self.recipe;
        footer.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
        footer.footerActionBlock = ^(SupplementaryFooterAction action) {
            switch (action) {
                case SupplementaryFooterActionComment: {   // 跳转至所有留言
                    [UILabel showMessage:@"跳转至所有留言" atNavController:weakSelf.navigationController];
                    break;
                }
                case SupplementaryFooterActionSameHobby: { // 跳转至“做过这道菜的还做过”
                    [UILabel showMessage:@"跳转至同类菜谱" atNavController:weakSelf.navigationController];
                    break;
                }
                case SupplementaryFooterActionReport: {    // 举报界面
                    [UILabel showMessage:@"举报界面或AlertAction" atNavController:weakSelf.navigationController];
                    break;
                }
            }
        };
        return footer;
    }
    // 被加入的菜单 Footer
    else if (section == 3) {
        LJKRecipeAddListFooter *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:recipeFooterAddListIdentifier];

        footer.frame = CGRectMake(0, 0, SCREEN_WIDTH, 60);
        footer.footerActionBlock = ^(){
            [UILabel showMessage:@"点击了“加入菜单”按钮" atNavController:weakSelf.navigationController];
        };
        return footer;
    }
    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:recipeHeaderIdentifier];
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    headerView.contentView.backgroundColor = [UIColor whiteColor];
    NSInteger tag = 11;
    UILabel *label = [headerView.contentView viewWithTag:tag];
    if (label == nil) {
        label = [[UILabel alloc] init];
        label.tag = tag;
        label.font = [UIFont systemFontOfSize:20];
        label.frame = CGRectMake(15, 15, SCREEN_WIDTH, 40);
        [headerView.contentView addSubview:label];
    }
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.title_sections[section];
    return headerView;
}

#pragma mark Header'height In different Section
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ((section == 2 && self.recipe.tips.length == 0) || section == 4) return 0;
    return 50;
}

#pragma mark Footer'height In different Section
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2) {
        return 200;
    } else if (section == 3) {
        return 80;
    }
    return 0;
}


#pragma mark - 点击事件 
- (void)buyListButtonDidClicked {
    [UILabel showMessage:@"点击了菜篮子" atNavController:self.navigationController];
}

- (void)backButtonDidClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)PYQButtonDidClicked {
    
}

- (void)WeChatButtonDidClicked {
    
}

- (void)OtherButtonDidClicked {
    
}

@end
