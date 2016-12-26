//
//  OHA_HousingMenuDataSource.h
//  OneHourArrvie
//
//  Created by 我叫MT on 16/12/23.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSDropDownMenu.h"
@interface OHA_HousingMenuDataSource : NSObject <JSDropDownMenuDataSource>
-(instancetype)initWithLeftData:(NSArray *)leftItems withRightItems:(NSArray *)rightItems;
@end
