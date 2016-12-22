//
//  SecondVCViewModal.h
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/20.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TweetsViewModal;
@interface SecondVCViewModal : NSObject
@property(nonatomic, assign, readonly, getter=isUsernameValid) BOOL usernameValid;
@property(nonatomic, copy, readonly) NSString *userFullName;
@property(nonatomic, strong, readonly) UIImage *userAvctarImage;
@property(nonatomic, strong, readonly) NSArray *tweets;
@property(nonatomic, assign, readonly)BOOL allTweetsLoaded;
@property(nonatomic, copy, readwrite) NSString *username;
@property(nonatomic, strong) TweetsViewModal *tweetVModal;
- (void)getTweetsForCurrentUsername;
- (void)loadMoreTweets;



@end
