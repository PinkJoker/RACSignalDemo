//
//  SecondTableViewCell.m
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/20.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "SecondTableViewCell.h"

@interface SecondTableViewCell ()
@property(nonatomic, strong)UIImageView *iconImageView;
@property(nonatomic, strong)UILabel *userName;
@property(nonatomic, strong)UILabel *subhead;

@end

@implementation SecondTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.iconImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.iconImageView];
    self.userName = [[UILabel alloc]init];
    [self.contentView addSubview:self.userName];
    self.subhead = [[UILabel alloc]init];
    [self.contentView addSubview:self.subhead];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    __weak __typeof(self)weakSelf = self;
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(50);
//        make.height.mas_equalTo(50);
        make.height.greaterThanOrEqualTo(weakSelf.iconImageView.mas_width);
    }];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.iconImageView.mas_right).offset(20);
        make.top.mas_equalTo(weakSelf.iconImageView.mas_top).offset(5);
        make.right.mas_equalTo(10);
    }];
    [self.subhead mas_makeConstraints:^(MASConstraintMaker *make) {
//       make.left.mas_equalTo
    }];
    
//    self.userName.preferredMaxLayoutWidth = [self.contentView.bounds.size.width -]
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
