//
//  PresentingAnimator.m
//
//  Copyright (c) 2014年 Y.X. All rights reserved.
//

#import "PresentingAnimator.h"
#import "UIView+SetRect.h"

@implementation PresentingAnimator

// 转场动画时间
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 1.f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    // 另一个view
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    toView.y       = Height;
    // 管理容器
    UIView *container = [transitionContext containerView];
    // 容器中添加推出的view
    [container addSubview:toView];
    // 动画时间
    CGFloat duration = [self transitionDuration:transitionContext];
    [UIView animateKeyframesWithDuration:duration delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        toView.center = container.center;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
