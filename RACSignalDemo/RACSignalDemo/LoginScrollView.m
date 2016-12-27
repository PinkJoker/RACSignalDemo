//
//  LoginScrollView.m
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/26.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "LoginScrollView.h"
#import "TextFieldLeftView.h"
@interface LoginScrollView ()
@property(nonatomic, strong)UIButton *backButton;
@property(nonatomic, strong)UIButton *registerButton;
@property(nonatomic, strong)UIImageView *imageView;
@property(nonatomic, strong)UITextField *NameTextField;
@property(nonatomic, strong)UITextField *PassWordTextField;
@property(nonatomic, strong)TextFieldLeftView *leftView;
@property(nonatomic, strong)UIButton *loginButton;
@end
@implementation LoginScrollView

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
    self.backButton = [[UIButton alloc]init];
    [self addSubview:self.backButton];

    self.registerButton = [[UIButton alloc]init];
    [self addSubview:self.registerButton];


    self.registerButton.titleLabel.font = [UIFont systemFontOfSize:15 weight:1];
    self.imageView = [[UIImageView alloc]init];
    [self addSubview:self.imageView];
    self.imageView.backgroundColor =  [UIColor colorWithHex:@"ed3751"];
    self.NameTextField = [[UITextField alloc]init];
    [self addSubview:self.NameTextField];
    self.NameTextField.backgroundColor = [UIColor whiteColor];
    self.PassWordTextField = [[UITextField alloc]init];
    [self addSubview:self.PassWordTextField];
     self.PassWordTextField.backgroundColor = [UIColor whiteColor];

    self.leftView = [[TextFieldLeftView alloc]init];
    self.leftView.iconImageView.image = [UIImage imageNamed:@"user.png"];
    self.leftView.frame = CGRectMake(0, 0, 50, 44);
    self.NameTextField.leftView = self.leftView;
    self.NameTextField.leftViewMode = UITextFieldViewModeAlways;
    TextFieldLeftView *Lview = [[TextFieldLeftView alloc]init];
     Lview.frame = CGRectMake(0, 0, 50, 44);
    Lview.iconImageView.image = [UIImage imageNamed:@"password.png"];
    self.PassWordTextField.leftView = Lview;
   

    self.loginButton = [[UIButton alloc]init];
    [self addSubview:self.loginButton];
    [self setProperty];
    [self setViewTarget];
  
}

-(void)setProperty
{    [self.backButton setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    self.imageView.layer.cornerRadius = 40;
    [self.registerButton setTitleColor:[UIColor colorWithHex:@"ed3751"] forState:UIControlStateNormal];
      [self.registerButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    
     self.PassWordTextField.leftViewMode  = UITextFieldViewModeAlways;
    self.NameTextField.layer.cornerRadius = 5;
    self.PassWordTextField.layer.cornerRadius = 5;
    self.loginButton.backgroundColor =  [UIColor colorWithHex:@"ed3751"];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.registerButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    self.loginButton.layer.cornerRadius  = 5;
    self.loginButton.layer.borderWidth = 0;
    self.NameTextField.attributedPlaceholder = [self attributedplaceholder:@"请输入手机号"];
    self.PassWordTextField.attributedPlaceholder = [self attributedplaceholder:@"请输入密码"];
}
-(NSMutableAttributedString *)attributedplaceholder:(NSString *)string
{
    NSMutableAttributedString *placeHolder = [[NSMutableAttributedString alloc]initWithString:string];
    [placeHolder addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14 weight:0] range:NSMakeRange(0, placeHolder.length)];
    return placeHolder;
}

-(void)setViewTarget
{
        [[self.registerButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *x) {
            if (self.subjectDelegate) {
                [self.subjectDelegate sendNext:x];
                [self.subjectDelegate sendCompleted];
            }else{
                NSError *error;
                [self.subjectDelegate sendError:error];
            }
        }];
        [self.NameTextField.rac_textSignal subscribeNext:^(id x) {
            NSLog(@"-----%@----",x);
            if (self.subjectDelegate) {
                [self.subjectDelegate sendNext:x];
            }
            
        }];
        [self.PassWordTextField.rac_textSignal subscribeNext:^(id x) {
            [self.subjectDelegate sendNext:x];
        }];
}

-(void)layoutSubviews
{  
    [super layoutSubviews];
    __weak __typeof(self)weakSelf = self;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0.20 * kHeight);
        make.centerX.mas_equalTo(weakSelf);
        make.width.height.mas_equalTo(80);
    }];
    [self.NameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.imageView.mas_bottom).offset(30);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(kWidth - 30);
        make.height.mas_equalTo(44);
    }];
    [self.PassWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.NameTextField.mas_bottom).offset(10);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(weakSelf.NameTextField.mas_right);
        make.height.mas_equalTo(44);
    }];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(34);
        make.width.height.mas_equalTo(30);
    }];
    CGFloat left = kWidth - 65;
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(34);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(50);
        make.left.mas_equalTo(left);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(kWidth - 30);
        make.top.mas_equalTo(weakSelf.PassWordTextField.mas_bottom).offset(25);
        make.height.mas_equalTo(44);
    }];
}
@end
