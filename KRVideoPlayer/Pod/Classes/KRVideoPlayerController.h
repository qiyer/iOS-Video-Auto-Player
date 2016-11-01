//
//  KRVideoPlayerController.h
//  KRKit
//
//  Created by aidenluo on 5/23/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KRVideoPlayType) {
    KRVideoPlayClose  = 0,
    KRVideoPlayNext,
    KRVideoPlayWait
};

@import MediaPlayer;

@interface KRVideoPlayerController : MPMoviePlayerController

@property (nonatomic, copy)void(^kRVideoPlayBlock)(KRVideoPlayType,NSInteger);
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, strong) NSArray * urlArray;
@property (nonatomic, assign) NSInteger urlIndex;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)showInWindow;
- (void)dismiss;
- (void)setURLArray:(NSArray*) data;
@end
