//
//  ViewController.m
//  uuuu
//
//  Created by 我叫MT on 16/12/21.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label1 = [[UILabel alloc]init];

    label1.frame = CGRectMake(100, 200, 100, 100);
    label1.text = @"测试啊 啊 啊啊啊啊 啊";
    label1.backgroundColor = [UIColor yellowColor];
    label1.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:label1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
