//
//  OHA_HousingMenuDataSource.m
//  OneHourArrvie
//
//  Created by 我叫MT on 16/12/23.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "OHA_HousingMenuDataSource.h"
@interface OHA_HousingMenuDataSource ()
@property(nonatomic, copy)NSArray *leftDataArray;
@property(nonatomic, copy)NSArray *rightDataArray;
@end
@implementation OHA_HousingMenuDataSource
-(instancetype)initWithLeftData:(NSMutableArray *)leftItems withRightItems:(NSMutableArray *)rightItems
{
    self = [super init];
    if (self) {
        self.leftDataArray = [leftItems copy];
        self.rightDataArray = [rightItems copy];
    }
    return self;
    
}
//- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow;
//- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath;
//- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column;
///**
// * 表视图显示时，左边表显示比例
// */
//- (CGFloat)widthRatioOfLeftColumn:(NSInteger)column;
///**
// * 表视图显示时，是否需要两个表显示
// */
//- (BOOL)haveRightTableViewInColumn:(NSInteger)column;
//
///**
// * 返回当前菜单左边表选中行
// */
//- (NSInteger)currentLeftSelectedRow:(NSInteger)column;
//
//@optional
////default value is 1
//- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu;
//
///**
// * 是否需要显示为UICollectionView 默认为否
// */
//- (BOOL)displayByCollectionViewInColumn:(NSInteger)column;

-(NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow
{
    return 10;
}

-(NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        if (indexPath.leftOrRight == 0) {
            return @"区";
        }else{
            return @"县";
        }
    }else if (indexPath.column == 1){
           return @"测试";
    }
    return @"价格高度";
 
}
-(NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column
{
    return @"已选中";
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column
{
    if (column == 0) {
        return 0.35;
    }
    return 1;
}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column
{
    if (column == 0) {
        return YES;
    }
    return NO;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column
{
    return 10;
}

-(NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu
{
    return 4;
}


@end
