//
//  SecondViewController.m
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/17.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondTableViewCell.h"
@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.BackViewConstraint.constant += 100;
    self.iconImageView.backgroundColor = [UIColor cyanColor];
    self.iconImageView.layer.cornerRadius = 5;
    self.iconImageView.layer.borderWidth = 0;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = self.headerBGView;

    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondTableViewCell *secondCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (secondCell == nil) {
        secondCell = [[SecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return secondCell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
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
