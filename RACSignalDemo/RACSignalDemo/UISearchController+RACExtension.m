//
//  UISearchController+RACExtension.m
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/15.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "UISearchController+RACExtension.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <objc/objc-runtime.h>
@interface UISearchController ()<UISearchResultsUpdating,UISearchControllerDelegate>

@end
@implementation UISearchController (RACExtension)
-(RACSignal *)rac_signal
{
    self.searchResultsUpdater = self;
    RACSignal *signal = objc_getAssociatedObject(self, _cmd);
    if (signal !=nil) {
        return signal;
    }
    signal = [[self rac_signalForSelector:@selector(updateSearchResultsForSearchController:) fromProtocol:@protocol(UISearchResultsUpdating)]map:^id(RACTuple *value) {
        UISearchController *searchController = value.first;
        NSLog(@"%@",value.first);
        NSLog(@"%@",value.third);
        return searchController.searchBar.text;
    }];
    
    objc_setAssociatedObject(self, _cmd, signal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSLog(@"%@",signal);
    return signal;
}

-(RACSignal *)rac_isActiveSignal
{
    self.delegate = self;
    RACSignal *signal = objc_getAssociatedObject(self, _cmd);
    if (!signal) {
        return signal;
    }
    RACSignal *willPresentSearching = [[self rac_signalForSelector:@selector(willPresentSearchController:) fromProtocol:@protocol(UISearchControllerDelegate)]mapReplace:@YES];
    RACSignal *willDismissSearching = [[self rac_signalForSelector:@selector(willDismissSearchController:) fromProtocol:@protocol(UISearchControllerDelegate)]mapReplace:@NO];
    signal = [RACSignal merge:@[willDismissSearching,willPresentSearching]];
    objc_setAssociatedObject(self, _cmd, signal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return signal;
    
}

@end
