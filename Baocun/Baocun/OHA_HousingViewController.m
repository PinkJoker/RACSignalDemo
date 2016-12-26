//
//  OHA_HousingViewController.m
//  OneHourArrvie
//
//  Created by 我叫MT on 16/12/22.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "OHA_HousingViewController.h"
#import "JSDropDownMenu.h"
#import "OHA_HousingListTableViewCell.h"
#import "OHA_HousingTableViewDataSource.h"
#import "OHA_HousingMenuDataSource.h"
static NSString *const cellStr = @"housingCell";
@interface OHA_HousingViewController ()<UITableViewDelegate,JSDropDownMenuDelegate>
@property(nonatomic, strong)UITableView *housingTableView;
//数据数组
@property(nonatomic, strong)NSMutableArray *tableViewDataArray;
//数据源
@property(nonatomic, strong)OHA_HousingTableViewDataSource *tableViewDataSource;
//分组数据源
@property(nonatomic, strong)OHA_HousingMenuDataSource *menuDataSource;
//下拉菜单控件
@property(nonatomic, strong)JSDropDownMenu *downMenu;
@end

@implementation OHA_HousingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kColor(248, 248, 248, 1);
    self.navigationItem.title = @"租房信息";
    //下拉菜单
    NSArray *arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    self.menuDataSource = [[OHA_HousingMenuDataSource alloc]initWithLeftData:arr withRightItems:arr];
    self.downMenu = [[JSDropDownMenu alloc]initWithOrigin:CGPointMake(0, 10 *kPIX+64) andHeight:90 *kPIX];
    [self.view addSubview:self.downMenu];
    self.downMenu.indicatorColor =kColor(61, 61, 61, 1);
    self.downMenu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    self.downMenu.textColor = kColor(61, 61, 61, 1);
    self.downMenu.delegate = self;
    self.downMenu.dataSource = self.menuDataSource;
    
      //创建房屋信息列表
    self.tableViewDataSource = [[OHA_HousingTableViewDataSource alloc]initWithConfigureCellBlock:^(OHA_HousingListTableViewCell *cell , id identifier) {
    
    } withDataArray:self.tableViewDataArray withCellIdentifier:cellStr];
  
    self.housingTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.housingTableView];
    self.housingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    weakObj(self, weakSelf);
    [self.housingTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.downMenu.mas_bottom).offset(10*kPIX);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom);
    }];
    self.housingTableView.delegate = self;
    self.housingTableView.dataSource = self.tableViewDataSource;
    

}

-(void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    NSLog(@"点击方法啊");
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 240 *kPIX;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    OHA_HousingDetailsViewController *details = [[OHA_HousingDetailsViewController alloc]init];
//    [self.navigationController pushViewController:details animated:YES];
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
