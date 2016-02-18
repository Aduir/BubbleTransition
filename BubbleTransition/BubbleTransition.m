//
//  BubbleTransition.m
//  BubbleTransition
//
//  Created by xiayushu on 16/2/18.
//  Copyright © 2016年 xiayushu. All rights reserved.
//

#import "BubbleTransition.h"

@interface BubbleTransition ()

@property (nonatomic, strong, nonnull) UIView *bubbleView;

@end

@implementation BubbleTransition

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.duration = 0.5;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    if (!containerView) return;
    
    if (self.transitionMode == BubbleTransitionModePresent) {
        UIView *presentedControllerView = [transitionContext viewForKey:UITransitionContextToViewKey];
        CGPoint originalCenter = presentedControllerView.center;
        CGSize originalSize = presentedControllerView.frame.size;
        
        self.bubbleView = [UIView new];
        self.bubbleView.frame = [self frameWithExternDotWithStartPoint:self.startPoint originalCenter:originalCenter originalSize:originalSize];
        self.bubbleView.center = self.startPoint;
        self.bubbleView.layer.cornerRadius = CGRectGetWidth(self.bubbleView.frame) * 0.5;
        self.bubbleView.transform = CGAffineTransformMakeScale(0.0001, 0.001);
        self.bubbleView.backgroundColor = self.bubbleColor;
        [containerView addSubview:self.bubbleView];
        
        presentedControllerView.center = self.startPoint;
        presentedControllerView.alpha = 0;
        presentedControllerView.transform = CGAffineTransformMakeScale(0.0001, 0.001);
        [containerView addSubview:presentedControllerView];
        
        [UIView animateWithDuration:self.duration animations:^{
            presentedControllerView.alpha = 1;
            presentedControllerView.center = originalCenter;
            presentedControllerView.transform = CGAffineTransformIdentity;
            
            self.bubbleView.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    } else {
        NSString *key = (self.transitionMode == BubbleTransitionModePOP) ? UITransitionContextToViewKey : UITransitionContextFromViewKey;
        UIView *returningControllerView = [transitionContext viewForKey:key];
        CGPoint originalCenter = returningControllerView.center;
        CGSize originalSize = returningControllerView.frame.size;

        self.bubbleView.frame = [self frameWithExternDotWithStartPoint:self.startPoint originalCenter:originalCenter originalSize:originalSize];
        self.bubbleView.center = self.startPoint;
        self.bubbleView.layer.cornerRadius = CGRectGetWidth(self.bubbleView.frame) * 0.5;
        
        [UIView animateWithDuration:self.duration animations:^{
            self.bubbleView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            
            returningControllerView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.alpha = 0;
            returningControllerView.center = self.startPoint;
            
            if (self.transitionMode == BubbleTransitionModePOP) {
                [containerView insertSubview:returningControllerView aboveSubview:returningControllerView];
                [containerView insertSubview:self.bubbleView aboveSubview:returningControllerView];
            }
        } completion:^(BOOL finished) {
            [returningControllerView removeFromSuperview];
            [self.bubbleView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
}

- (CGRect)frameWithExternDotWithStartPoint:(CGPoint)startPoint originalCenter:(CGPoint)originalCenter originalSize:(CGSize)originalSize {
    CGFloat lengthX = fmax(startPoint.x, originalSize.width - startPoint.x);
    CGFloat lengthY = fmax(startPoint.y, originalSize.height - startPoint.y);
    CGFloat radius = sqrt(lengthX * lengthX + lengthY * lengthY);
    CGSize size = CGSizeMake(radius * 2, radius * 2);
    
    return (CGRect){CGPointZero, size};
}

@end
