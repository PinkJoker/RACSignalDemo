//
//  UISearchController+RACExtension.h
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/15.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchController (RACExtension)
-(RACSignal *)rac_signal;
-(RACSignal *)rac_isActiveSignal;
@end
