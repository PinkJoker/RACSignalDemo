//
//  haveLeftViewTextField.m
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/26.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "haveLeftViewTextField.h"

@interface haveLeftViewTextField ()
{
    UIView *_leftView;
}
@end
@implementation haveLeftViewTextField

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
    _leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, self.bounds.size.height)];
    [self addSubview:_leftView];
    self.leftView = _leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
    _leftView.backgroundColor = [UIColor greenColor];
}
-(void)layoutSubviews
{
    [super layoutSubviews];

}

@end
