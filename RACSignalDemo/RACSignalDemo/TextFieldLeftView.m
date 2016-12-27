//
//  TextFieldLeftView.m
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/26.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "TextFieldLeftView.h"

@interface TextFieldLeftView ()
@property(nonatomic, strong)UIView *shuView;
@end
@implementation TextFieldLeftView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self creatView];
    }
    return self;
}
-(void)creatView
{
    self.iconImageView = [[UIImageView alloc]init];
    [self addSubview:self.iconImageView];
    self.shuView = [[UIView alloc]init];
    self.shuView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    [self addSubview:self.shuView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(5);
        make.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(self.iconImageView.mas_height);
    }];
    [self.shuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12);
        make.bottom.mas_equalTo(-12);
        make.right.mas_equalTo(-11);
        make.width.mas_equalTo(0.5);
    }];
}
@end
