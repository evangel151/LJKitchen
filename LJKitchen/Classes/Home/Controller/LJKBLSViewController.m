//
//  LJKBLSViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/21.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKBLSViewController.h"
#import "LJKBLSViewHeader.h"
#import "LJKBLSViewCell.h"

#import "LJKBLSHeaderData.h"
#import "LJKDish.h"

#import "LJKNetworkTool.h"
#import <Masonry.h>
#import <MJExtension.h>
#import <MJRefresh.h>

@interface LJKBLSViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIButton *uploadMyDishButton;
@property (nonatomic, strong) LJKBLSHeaderData *headerData;
@property (nonatomic, strong) NSArray *dishArray;
@end

@implementation LJKBLSViewController

static NSString * const reuseIdentifier = @"BLSDishCell";
static NSString * const headerIdentifier = @"BLSHeader";

//- (NSArray *)dishArray {
//    if (!_dishArray) {
//        self.dishArray = [[NSArray alloc]init];
//    }
//    return _dishArray;
//}


- (UIButton *)uploadMyDishButton {
    if (!_uploadMyDishButton) {
        _uploadMyDishButton = [UIButton buttonWithTitle:@"上传我的作品"
                                             titleColor:Color_TintWhite
                                        backgroundColor:Color_ThemeColor
                                               fontSize:17
                                                 target:self
                                                 action:@selector(uploadMyDish)];
        [_uploadMyDishButton setImage:[UIImage imageNamed:@"tabCDeselected"] forState:UIControlStateNormal];
    }
    return _uploadMyDishButton;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH - 10) * 0.5, 300);
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.minimumLineSpacing = 10;
        flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 120);
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                             collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_collectionView];
        
        [_collectionView registerClass:[LJKBLSViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        [_collectionView registerClass:[LJKBLSViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    }
    return _collectionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
    [self loadNewData];
}

- (void)setupSubviews {
    self.collectionView.backgroundColor = Color_BackGround;
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.uploadMyDishButton];
    [_uploadMyDishButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, TABBAR_HEIGHT));
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
}


- (void)loadNewData {
    
    
    [LJKNetworkTool afnGet:LJKRequestKitchenBreakfast
                    params:nil
                   success:^(id json) {
//                       NSLog(@"%@", json);
                       self.headerData = [LJKBLSHeaderData mj_objectWithKeyValues:json[@"content"][@"event"]];
                       [self.collectionView reloadData];
                       NSString *string = [self.headerData.name substringWithRange:NSMakeRange(0, 2)];
                       [self.uploadMyDishButton setTitle:[NSString stringWithFormat:@"上传我的%@", string] forState:UIControlStateNormal];
                       
    }
                   failure:^(NSError *error) {
                       NSLog(@"加载header失败 原因:%@", error);
    }];
    
    [LJKNetworkTool afnGet:LJKRequestKitchenBreakfast
                    params:nil
                   success:^(id json) {
//                       NSLog(@"作品json: %@", json);
                       self.dishArray = [LJKDish mj_objectArrayWithKeyValuesArray:json[@"content"][@"dishes"]];
                       [self.collectionView reloadData];
                       
                   }
                   failure:^(NSError *error) {
                       NSLog(@"加载dishs失败 原因:%@", error);
                   }];
}

- (void)uploadMyDish {
     NSLog(@"即将跳转上传作品界面——————");
}

#pragma mark - collectionView 数据源 & 代理

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // FIXME: 接口失效，写死 
//    NSLog(@"%zd", self.dishArray.count);
//    return self.dishArray.count;
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LJKBLSViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                              forIndexPath:indexPath];
//    cell.dish = self.dishArray[indexPath.row];

    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableView;
    if([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        LJKBLSViewHeader *header =
        [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                           withReuseIdentifier:headerIdentifier
                                                  forIndexPath:indexPath];
        
        header.data = self.headerData;
        reusableView = header;
    }
    return reusableView;
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(SCREEN_WIDTH, 90.0);
    
}

@end
