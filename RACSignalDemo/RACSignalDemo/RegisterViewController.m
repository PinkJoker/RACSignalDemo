//
//  RegisterViewController.m
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/26.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterScrollView.h"
@interface RegisterViewController ()
@property(nonatomic, strong)RegisterScrollView *registerView;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    self.registerView = [[RegisterScrollView alloc]init];
    [self.view addSubview:self.registerView];
    [self.registerView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    self.registerView.contentSize = self.view.bounds.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
