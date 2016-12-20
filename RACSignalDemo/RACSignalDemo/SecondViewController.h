//
//  SecondViewController.h
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/17.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *BackViewConstraint;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *GoAction;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headerBGView;

@end
