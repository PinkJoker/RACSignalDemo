//
//  OHA_HousingTableViewDataSource.h
//  OneHourArrvie
//
//  Created by 我叫MT on 16/12/22.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^configureCellBlock)(id cell, id identifier);
@interface OHA_HousingTableViewDataSource : NSObject<UITableViewDataSource>

-(instancetype)initWithConfigureCellBlock:( configureCellBlock )block withDataArray:(NSMutableArray *)items withCellIdentifier:(NSString *)cellIdentifier;

@end
