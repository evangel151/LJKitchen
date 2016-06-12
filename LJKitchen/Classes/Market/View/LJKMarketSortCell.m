//
//  LJKMarketSortCell.m
//  LJKitchen
//
//  Created by  a on 16/6/10.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKMarketSortCell.h"

@implementation LJKMarketSortCell
+ (NSString *)cellIdentifier{
    static NSString *cellIdentifier = @"MarketSortCellIdentifier";
    return cellIdentifier;
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView
                          forIndexPath:(NSIndexPath *)indexPath
{
    
    LJKMarketSortCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:[LJKMarketSortCell cellIdentifier]
                                              forIndexPath:indexPath];
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //创建label
        UIImageView *sortItemView = [[UIImageView alloc] init];
        //设置label尺寸
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat width = (SCREEN_WIDTH - 2) / 3;
        CGFloat height = (SCREEN_WIDTH - 2) / 3;
        sortItemView.frame = CGRectMake(x, y, width, height);
        //设置label属性
        sortItemView.contentMode = UIViewContentModeScaleAspectFit;
        //添加到父控件
        [self.contentView addSubview:sortItemView];
        self.sortItemView = sortItemView;
    }
    return self;
}
@end
