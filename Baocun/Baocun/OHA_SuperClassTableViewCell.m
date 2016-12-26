//
//  OHA_SuperClassTableViewCell.m
//  OneHourArrvie
//
//  Created by 我叫MT on 16/12/22.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "OHA_SuperClassTableViewCell.h"

@implementation OHA_SuperClassTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatCellView];
    }
    return self;
}

-(void)creatCellView
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
