//
//  ViewController.m
//  WJCategoryChooseView
//
//  Created by Rocky on 15/12/25.
//  Copyright © 2015年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "WJCategoryChooseLayout.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    categoryChooseDataModel *model1 = [[categoryChooseDataModel alloc]initWithTitle:@"西游记" Value:nil IsChosen:NO];
        categoryChooseDataModel *model2 = [[categoryChooseDataModel alloc]initWithTitle:@"唐僧" Value:nil IsChosen:NO];
        categoryChooseDataModel *model3 = [[categoryChooseDataModel alloc]initWithTitle:@"孙悟空" Value:nil IsChosen:YES];
        categoryChooseDataModel *model4 = [[categoryChooseDataModel alloc]initWithTitle:@"猪八戒" Value:nil IsChosen:NO];
        categoryChooseDataModel *model5 = [[categoryChooseDataModel alloc]initWithTitle:@"沙和尚" Value:nil IsChosen:NO];
    NSMutableArray *sectionArray1 = [NSMutableArray arrayWithObjects:model5,model2,model3,model4,model1, nil];
    categoryChooseDataModel *model6 = [[categoryChooseDataModel alloc]initWithTitle:@"三国演义" Value:nil IsChosen:NO];
    categoryChooseDataModel *model7 = [[categoryChooseDataModel alloc]initWithTitle:@"刘备" Value:nil IsChosen:YES];
    categoryChooseDataModel *model8 = [[categoryChooseDataModel alloc]initWithTitle:@"孙权" Value:nil IsChosen:NO];
    categoryChooseDataModel *model9 = [[categoryChooseDataModel alloc]initWithTitle:@"曹操" Value:nil IsChosen:NO];
    categoryChooseDataModel *model10 = [[categoryChooseDataModel alloc]initWithTitle:@"汉献帝" Value:nil IsChosen:NO];
    NSMutableArray *sectionArray2 = [NSMutableArray arrayWithObjects:model10,model7,model8,model9,model6, nil];
    
    categoryChooseDataModel *model01 = [[categoryChooseDataModel alloc]initWithTitle:@"水浒传" Value:nil IsChosen:NO];
    categoryChooseDataModel *model02 = [[categoryChooseDataModel alloc]initWithTitle:@"宋江" Value:nil IsChosen:NO];
    categoryChooseDataModel *model03 = [[categoryChooseDataModel alloc]initWithTitle:@"卢俊义" Value:nil IsChosen:NO];
    categoryChooseDataModel *model04 = [[categoryChooseDataModel alloc]initWithTitle:@"吴用" Value:nil IsChosen:YES];
    categoryChooseDataModel *model05 = [[categoryChooseDataModel alloc]initWithTitle:@"林冲" Value:nil IsChosen:NO];
    categoryChooseDataModel *model06 = [[categoryChooseDataModel alloc]initWithTitle:@"秦明" Value:nil IsChosen:YES];
    categoryChooseDataModel *model07 = [[categoryChooseDataModel alloc]initWithTitle:@"张顺" Value:nil IsChosen:NO];
    categoryChooseDataModel *model08 = [[categoryChooseDataModel alloc]initWithTitle:@"关胜" Value:nil IsChosen:YES];
    categoryChooseDataModel *model09 = [[categoryChooseDataModel alloc]initWithTitle:@"花荣" Value:nil IsChosen:NO];
    categoryChooseDataModel *model010 = [[categoryChooseDataModel alloc]initWithTitle:@"武松" Value:nil IsChosen:NO];
    
    NSMutableArray *sectionArray3 = [NSMutableArray arrayWithObjects:model010,model02,model03,model04,model05,model06,model07,model08,model09,model01, nil];
    
    
    NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:sectionArray1,sectionArray2, sectionArray3,nil];
    [self.categoryChooseView WJCategoryChooseViewGetDataSourceWithDataArray:dataArray];
    WJCategoryChooseLayout *layout = (WJCategoryChooseLayout *)self.categoryChooseView.categoryChooseView.collectionViewLayout;
    layout.cellHeight = 35;
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    WJCategoryChooseLayout *layout = (WJCategoryChooseLayout *)self.categoryChooseView.categoryChooseView.collectionViewLayout;
    [layout invalidateLayout];
    [layout.cellAttributesDic removeAllObjects];
    [layout.viewAttributesDic removeAllObjects];
    layout.lineHeight = 10;
    layout.rowWidth = 66;
    layout.lastSectionHeight = 0;
    layout.sectionHeight = 0;
    
}

@end
