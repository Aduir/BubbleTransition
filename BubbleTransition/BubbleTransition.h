//
//  BubbleTransition.h
//  BubbleTransition
//
//  Created by xiayushu on 16/2/18.
//  Copyright © 2016年 xiayushu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, BubbleTransitionMode) {
    BubbleTransitionModePresent,
    BubbleTransitionModeDismiss,
    BubbleTransitionModePOP,
};

@interface BubbleTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) NSTimeInterval duration;

@property (nonatomic, strong) UIColor *bubbleColor;

@property (nonatomic, assign) CGPoint startPoint;

@property (nonatomic, assign) BubbleTransitionMode transitionMode;

@end
