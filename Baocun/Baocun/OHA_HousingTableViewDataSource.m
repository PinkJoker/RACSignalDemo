//
//  OHA_HousingTableViewDataSource.m
//  OneHourArrvie
//
//  Created by 我叫MT on 16/12/22.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "OHA_HousingTableViewDataSource.h"
#import "OHA_HousingListTableViewCell.h"
@interface OHA_HousingTableViewDataSource ()
@property(nonatomic, copy)configureCellBlock cellBlock;
@property(nonatomic, copy)NSArray *dataArray;
@property(nonatomic, copy)NSString *cellIdentifier;
@end
@implementation OHA_HousingTableViewDataSource
-(instancetype)initWithConfigureCellBlock:(configureCellBlock)block withDataArray:(NSMutableArray *)items withCellIdentifier:(NSString *)cellIdentifier
{
    self = [super init];
    if (self) {
        self.cellBlock = block;
        self.dataArray = [items copy];
        self.cellIdentifier = cellIdentifier;
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{OHA_HousingListTableViewCell *housingCell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (housingCell ==nil) {
        housingCell = [[OHA_HousingListTableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
    return housingCell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count==0?10:self.dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


@end
