//
//  PhotoBrowserView.m
//  WJProject
//
//  Created by 郝文举 on 2018/5/10.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "PhotoBrowserView.h"
#import "PhotoCell.h"

@interface PhotoBrowserView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *url;
@end

static NSString *const PhotoCellID = @"PhotoCellID";

@implementation PhotoBrowserView

- (instancetype)initWithFrame:(CGRect)frame andUrl:(NSArray *)url {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        _url = url;
        [self setupCollectionView];
    }
    return self;
}

- (void)setupCollectionView {
    [self addSubview:self.collectionView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kTopHeight, KScreenWidth, KScreenHeight - kTopHeight) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[PhotoCell class] forCellWithReuseIdentifier:PhotoCellID];
    }
    return _collectionView;
}


#pragma mark -- UICollectionViewDataSource
// section中item数量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _url.count;
    
}

// cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoCellID forIndexPath:indexPath];
    cell.url = _url[indexPath.row];
    return cell;
}



#pragma mark  UICollectionViewDelegate
// cell尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(KScreenWidth,KScreenHeight - kTopHeight);
}

// 横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

// 纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

@end
