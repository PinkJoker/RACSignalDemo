//
//  OHA_HousingListTableViewCell.m
//  OneHourArrvie
//
//  Created by 我叫MT on 16/12/22.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "OHA_HousingListTableViewCell.h"

@interface OHA_HousingListTableViewCell ()
@property(nonatomic, strong)UIImageView *houseImageView;
@property(nonatomic, strong)UILabel *houseDescibeLabel;
@property(nonatomic, strong)UILabel *houseAddressLabel;
@property(nonatomic, strong)UILabel *housePriceLabel;
@property(nonatomic, strong)UIView *bottomCellView;
@end

@implementation OHA_HousingListTableViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)creatCellView
{
    self.houseImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.houseImageView];
    self.houseDescibeLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.houseDescibeLabel];
    self.houseAddressLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.houseAddressLabel];
    self.housePriceLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.housePriceLabel];
    self.bottomCellView = [[UIView alloc]init];
    [self.contentView addSubview:self.bottomCellView];
    [self setViewBackGround];
}
-(void)setViewBackGround
{
    self.houseImageView.backgroundColor = [UIColor yellowColor];
    self.houseDescibeLabel.text = @"这应该是一个挺长的文字为了测试房屋信息的数据";
    self.houseAddressLabel.text = @"不知道是住在那啊啊啊 ";
    self.housePriceLabel.text = @"¥ 2500";
    self.bottomCellView.backgroundColor = [UIColor cyanColor];
    
    self.houseDescibeLabel.numberOfLines = 2;
    self.houseDescibeLabel.adjustsFontSizeToFitWidth = YES;
    self.houseDescibeLabel.font = [UIFont systemFontOfSize:30 *kPIX];
    self.bottomCellView.backgroundColor = kColor(248, 248, 248, 1);
    self.houseAddressLabel.font = [UIFont systemFontOfSize:26 *kPIX weight:0];
    self.housePriceLabel.font = [UIFont systemFontOfSize:28 *kPIX weight:0.2];
    self.houseAddressLabel.textColor = COLOR_WITH_HEX(0X757575, 1);
    self.housePriceLabel.textColor = COLOR_WITH_HEX(0Xed3751, 1);
//    self.houseDescibeLabel.textColor = COLOR_WITH_HEX(0X333, 1); 
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    weakObj(self, weakSelf);
    [self.houseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 *kPIX);
        make.top.mas_equalTo(20 *kPIX);
        make.bottom.mas_equalTo(-30 *kPIX);
        make.width.mas_equalTo(weakSelf.houseImageView.mas_height).multipliedBy(1.05);
    }];
    
    [self.houseDescibeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.houseImageView.mas_top);
        make.left.mas_equalTo(weakSelf.houseImageView.mas_right).offset(35 *kPIX);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).offset(-20 *kPIX);
    }];
 
    [self.housePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.houseImageView.mas_bottom);
        make.left.mas_equalTo(weakSelf.houseImageView.mas_right).offset(35*kPIX);
    }];
    [self.houseAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.housePriceLabel.mas_top).offset(-25 *kPIX);
        make.leftMargin.mas_equalTo(weakSelf.housePriceLabel);
    }];
    [self.bottomCellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.houseImageView.mas_bottom).offset(20 *kPIX);
        make.width.mas_equalTo(kWidth);
        make.height.mas_equalTo(5);
    }];
}

@end
