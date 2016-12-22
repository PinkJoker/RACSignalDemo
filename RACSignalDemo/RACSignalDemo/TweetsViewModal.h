//
//  TweetsViewModal.h
//  RACSignalDemo
//
//  Created by 我叫MT on 16/12/20.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweetsViewModal : NSObject
@property(nonatomic, strong, readonly) NSString *tweetAuthorFullName;
@property(nonatomic, strong, readonly )UIImage *tweetAuthorAvatarImage;
@property(nonatomic, strong, readonly) NSString *tweetContent;
-(TweetsViewModal *)viewModalForCurrentUser;
@end
