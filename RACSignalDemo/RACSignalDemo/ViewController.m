//
//  ViewController.m
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/15.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "ViewController.h"
#import "UISearchController+RACExtension.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
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
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    RAC(self,searchResults) = [self rac_liftSelector:@selector(search:) withSignals:self.searchController.rac_signal, nil];
//    RAC(self, searchResults) = [self rac_liftSelector:@selector(search:) withSignalsFromArray:@[self.searchController.]]];
    @weakify(self);
    [self.searchController.rac_signal subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
}

-(NSArray *)search:(NSString *)searchText
{
    NSMutableArray *results = [NSMutableArray array];
    if (searchText.length >0) {
        for (NSString *text in self.searchTexts) {
            if ([[text lowercaseString]rangeOfString:[searchText lowercaseString]].location != NSNotFound) {
                [results addObject:text];
            }else{
                results = [self.searchTexts copy];
            }
        }
    }else{
        results = [self.searchTexts copy];
    }
    return results;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.isSearching) {
        return self.searchResults.count;
    } else {
        return self.searchTexts.count;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
