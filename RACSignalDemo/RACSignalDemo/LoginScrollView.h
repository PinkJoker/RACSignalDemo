//
//  LoginScrollView.h
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/26.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^submitButton)(UIButton *button, NSInteger tag);
@interface LoginScrollView : UIScrollView
@property(nonatomic, copy)submitButton blockButton;
@property(nonatomic, strong)RACSubject *subjectDelegate;
@end
