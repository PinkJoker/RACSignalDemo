//
//  RegisterScrollView.m
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/26.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "RegisterScrollView.h"
#import "haveLeftViewTextField.h"
@interface RegisterScrollView ()
@property(nonatomic, strong)UIButton *backButton;
@property(nonatomic, strong)haveLeftViewTextField *phoneNumberTextField;
@property(nonatomic, strong)UIButton *autoCodeButton;
@property(nonatomic, strong)haveLeftViewTextField *autoCodeTextField;
@property(nonatomic, strong)haveLeftViewTextField *passWordTextField;
@property(nonatomic, strong)UIButton *registerButton;
@property(nonatomic, strong)UILabel *registerLabel;
@end
@implementation RegisterScrollView

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
    self.backButton = [[UIButton alloc]init];
    [self addSubview:self.backButton];
      [self.backButton setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    self.phoneNumberTextField = [[haveLeftViewTextField alloc]init];
    [self addSubview:self.phoneNumberTextField];
    self.autoCodeButton = [[UIButton alloc]init];
    [self addSubview:self.autoCodeButton];
    self.autoCodeTextField = [[haveLeftViewTextField alloc]init];
    [self addSubview:self.autoCodeTextField];
    self.passWordTextField = [[haveLeftViewTextField alloc]init];
    [self addSubview:self.passWordTextField];
    self.registerButton = [[UIButton alloc]init];
    [self addSubview:self.registerButton];
    self.registerLabel = [[UILabel alloc]init];
    [self addSubview:self.registerLabel];
    [self setViewProperty];
}
-(void)setViewProperty
{
    self.registerLabel.text = @"注册";
    self.registerLabel.font = [UIFont systemFontOfSize:18 weight:1];
    self.registerLabel.textColor = [UIColor redColor];
    self.phoneNumberTextField.backgroundColor = [UIColor whiteColor];
    self.phoneNumberTextField.layer.cornerRadius = 5;
    self.autoCodeButton.backgroundColor = [UIColor colorWithHex:@"ed3751"];
    [self.autoCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.autoCodeButton.titleLabel.font = [UIFont systemFontOfSize:14 weight:1];
    self.autoCodeButton.layer.cornerRadius = 5;
    self.autoCodeTextField.backgroundColor = [UIColor whiteColor];
    self.passWordTextField.backgroundColor = [UIColor whiteColor];
    self.autoCodeTextField.layer.cornerRadius = 5;
    self.passWordTextField.layer.cornerRadius = 5;
    self.registerButton.layer.cornerRadius = 5;
    self.registerButton.backgroundColor =  [UIColor colorWithHex:@"ed3751"];
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.registerLabel.textAlignment = 1;
   
     self.phoneNumberTextField.attributedPlaceholder =  [self attributedplaceholder:@"请输入手机号"];
    self.autoCodeTextField.attributedPlaceholder = [self attributedplaceholder:@"请输入验证码"];
    self.passWordTextField.attributedPlaceholder = [self attributedplaceholder:@"请输入至少六位数密码"];
}

-(NSMutableAttributedString *)attributedplaceholder:(NSString *)string
{
    NSMutableAttributedString *placeHolder = [[NSMutableAttributedString alloc]initWithString:string];
    [placeHolder addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14 weight:0] range:NSMakeRange(0, placeHolder.length)];
    return placeHolder;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat phoneNumber = kWidth * 0.60;
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(34);
        make.width.height.mas_equalTo(30);
    }];
    CGFloat top = kHeight *0.20;
    [self.phoneNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(top);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(phoneNumber);
        make.height.mas_equalTo(44);
    }];
    [self.autoCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.phoneNumberTextField.mas_right).offset(10);
        make.width.mas_equalTo(kWidth *0.4 - 45);
        make.centerY.mas_equalTo(self.phoneNumberTextField);
        make.height.mas_equalTo(44);
    }];
    [self.autoCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(self.phoneNumberTextField.mas_bottom).offset(10);
        make.width.mas_equalTo(kWidth - 30);
        make.height.mas_equalTo(44);
    }];
    [self.passWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(self.autoCodeTextField.mas_bottom).offset(10);
        make.width.mas_equalTo(kWidth - 30);
        make.height.mas_equalTo(44);
    }];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(self.passWordTextField.mas_bottom).offset(20);
        make.width.mas_equalTo(kWidth - 30);
        make.height.mas_equalTo(44);
    }];
    [self.registerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(34);
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(120);
//        make.height.mas_equalTo(20);
    }];
    
}
@end
