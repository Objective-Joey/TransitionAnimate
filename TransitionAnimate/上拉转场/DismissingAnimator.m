//
//  DismissingAnimator.m
//  MeiBaoShangCheng
//
//  Created by wooboo on 14-6-17.
//  Copyright (c) 2014年 Y.X. All rights reserved.
//

#import "DismissingAnimator.h"
#import "UIView+SetRect.h"

@implementation DismissingAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    // 自己的view
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    // 动画时间
    CGFloat duration = [self transitionDuration:transitionContext];
    
    CGPoint endPoint   = CGPointMake(fromView.middleX,
                                     fromView.middleY + Height);
    [UIView animateKeyframesWithDuration:duration delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{

        fromView.center  = endPoint;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
