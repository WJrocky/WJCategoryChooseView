//
//  WJCategoryChooseLayout.m
//  WJCategoryChooseView
//
//  Created by Rocky on 15/12/25.
//  Copyright © 2015年 Rocky. All rights reserved.
//

#import "WJCategoryChooseLayout.h"
#import "categoryChooseDataModel.h"

@interface WJCategoryChooseLayout ()

@property(nonatomic, assign)NSInteger sectionNum;

@property(nonatomic, strong)NSMutableArray *attributesArray;

@end

@implementation WJCategoryChooseLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing= 10;
        self.minimumLineSpacing = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _lineHeight = 10;
        _rowWidth = 66;
        _sectionHeight = 0;
        _lastSectionHeight = 0;
        _cellHeight = 25;
        _cellAttributesDic = [NSMutableDictionary dictionary];
        _viewAttributesDic = [NSMutableDictionary dictionary];
    }
    return self;
}
- (void)prepareLayout
{
    [super prepareLayout];
     _sectionNum = [self.collectionView numberOfSections];

}

- (CGSize)collectionViewContentSize
{
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, _lineHeight-10+_sectionNum);
    return size;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    if (_cellAttributesDic[indexPath]) {
        return _cellAttributesDic[indexPath];
    }
    NSInteger cellNum = [self.collectionView numberOfItemsInSection:indexPath.section];
    NSInteger index = cellNum - 1 - indexPath.row;
    NSInteger estimateCellWidth = (self.collectionView.bounds.size.width - 96)/3;
    categoryChooseDataModel *model = [_dataArray[indexPath.section] objectAtIndex:indexPath.row];
    NSString *title = model.title;
    CGRect rect = [title boundingRectWithSize:CGSizeMake(10000000, 25) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    estimateCellWidth = estimateCellWidth>rect.size.width+30 ? estimateCellWidth:rect.size.width+30;
    if (index != 0) {
        
        if ( _rowWidth + estimateCellWidth +10 > self.collectionView.bounds.size.width)
        {
            _rowWidth = 66;
            _lineHeight = _lineHeight + _cellHeight + 10 + 1;
            NSInteger maxCellWidth = self.collectionView.bounds.size.width - _rowWidth - 10;
            estimateCellWidth = estimateCellWidth > maxCellWidth ? maxCellWidth:estimateCellWidth;
        }
        attributes.size = CGSizeMake(estimateCellWidth, _cellHeight);
        attributes.center = CGPointMake(_rowWidth + estimateCellWidth/2,_lineHeight + _cellHeight/2);
        _rowWidth = _rowWidth + 10 + estimateCellWidth;
    } else {
        _sectionHeight = _lineHeight + _cellHeight + 10 + 1 - _lastSectionHeight;
        attributes.size = CGSizeMake(56, _sectionHeight);
        attributes.center = CGPointMake(28,_lastSectionHeight + _sectionHeight/2);
        _lastSectionHeight = _lineHeight + _cellHeight + 10 + 1;
        _lineHeight = _lineHeight + _cellHeight + 20 + 1;
        _rowWidth = 66;
    }
    [_cellAttributesDic setObject:attributes forKey:indexPath];
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    if (_viewAttributesDic[indexPath]) {
        return _viewAttributesDic[indexPath];
    }
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    attributes.size = CGSizeMake(self.collectionView.bounds.size.width, 2);
    attributes.center = CGPointMake(self.collectionView.bounds.size.width/2,_lineHeight+1-10);
    [_viewAttributesDic setObject:attributes forKey:indexPath];
    return attributes;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<_sectionNum; i++) {
        for (int j=0; j<[self.collectionView numberOfItemsInSection:i]; j++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            [array addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        }
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:i];
        [array addObject:[self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:indexPath]];
    }
    return array;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSInteger)HeightOfcollectionViewContentAtNumberOfSection:(NSInteger)num
{
    NSInteger totalHeight = 0;
    for (int i = 0; i < num; i++) {
        
        NSInteger cellNum = [self.collectionView numberOfItemsInSection:i];
        NSInteger totalRow = (cellNum-1)%3 == 0 ? (cellNum-1)/3:((cellNum-1)/3+1);
        NSInteger sectionHeight = totalRow * 25 + (totalRow + 1)*10;
        totalHeight += sectionHeight;
        
    }
    return totalHeight;
}
@end
