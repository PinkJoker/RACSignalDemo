//
//  ViewController.m
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/15.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface ViewController ()
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)UISearchController *searchController;
@property(nonatomic, copy)NSArray *searchTexts;
@property(nonatomic, copy)NSArray *searchResults;
@property(nonatomic, assign, getter=isSearching)BOOL searching;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.searchTexts = @[@"San",
                         @"Grand Rapids",
                         @"Chicago",
                         @"Amaric"];
    self.searchResults = @[];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    [self.searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    RAC(self, searchResults) = [self rac_liftSelector:@selector(search:) withSignalsFromArray:@[self.searchController]];
    @weakify(self);
    [self.searchController. subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
