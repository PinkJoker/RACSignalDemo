//
//  LoginViewController.m
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/26.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginScrollView.h"
#import "RegisterViewController.h"
@interface LoginViewController ()
@property(nonatomic, strong)LoginScrollView *loginScrollView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    // Do any additional setup after loading the view.
    self.loginScrollView = [[LoginScrollView alloc]init];
    [self.view addSubview:self.loginScrollView];
    [self.loginScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    self.loginScrollView.contentSize = self.view.bounds.size;
    self.loginScrollView.subjectDelegate = [RACSubject subject];
    [self.loginScrollView.subjectDelegate subscribeNext:^(id x) {
        NSLog(@"========%@==========",x);
        RegisterViewController *registerVC = [[RegisterViewController alloc]init];
        [self presentViewController:registerVC animated:YES completion:^{
            
        }];
    } completed:^{
        
    }];
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
