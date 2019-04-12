//
//  WSLTransitionAnimationFour.m
//  TransferAnimation
//
//  Created by 王双龙 on 2018/4/18.
//  Copyright © 2018年 https://www.jianshu.com/u/e15d1f644bea All rights reserved.
//

#import "WSLTransitionAnimationFour.h"

#define Print  0
@implementation WSLTransitionAnimationFour

//返回动画事件
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.8;
}

//所有的过渡动画事务都在这个方法里面完成
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    switch (_transitionType) {
        case WSLTransitionFourTypePush:
            [self pushAnimation:transitionContext];
            break;
        case WSLTransitionFourTypePop:
            [self popAnimation:transitionContext];
            break;
        default:
            break;
    }
}

#pragma mark -- transitionType

- (void)pushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
//    UIViewController * fromVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//     UIViewController * toVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //取出转场前后视图控制器上的视图view
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIView *containerView = [transitionContext containerView];
    
    //左侧动画视图
    UIView *leftFromView = [fromView snapshotViewAfterScreenUpdates:NO];
    UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, fromView.frame.size.width/2, fromView.frame.size.height)];
    leftView.clipsToBounds = YES;
    [leftView addSubview:leftFromView];
    //右侧动画视图
    UIView *rightFromView = [fromView snapshotViewAfterScreenUpdates:NO];
    rightFromView.frame = CGRectMake(- fromView.frame.size.width/2, 0, fromView.frame.size.width, fromView.frame.size.height);
    UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(fromView.frame.size.width/2, 0, fromView.frame.size.width/2, fromView.frame.size.height)];
    rightView.clipsToBounds = YES;
    [rightView addSubview:rightFromView];
    
    [containerView addSubview:toView];
    [containerView addSubview:leftView];
    [containerView addSubview:rightView];
    if (Print) {
        NSLog(@"from_________ %@", fromView);
        NSLog(@"to_________ %@", toView);
    }

//    fromView.hidden = YES;
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
                        options:UIViewAnimationOptionTransitionFlipFromRight
                     animations:^{
                         leftView.frame = CGRectMake(-fromView.frame.size.width/2, 0, fromView.frame.size.width/2, fromView.frame.size.height);
                         rightView.frame = CGRectMake(fromView.frame.size.width, 0, fromView.frame.size.width/2, fromView.frame.size.height);
                     }
                     completion:^(BOOL finished) {

//                         fromView.hidden = NO;
                         [leftView removeFromSuperview];
                         [rightView removeFromSuperview];
                         [transitionContext completeTransition:YES];
                         if (Print) {
                             for(UIView * view in containerView.subviews){
                                 NSLog(@"subView________%@", view);
                             }
                         }

                         /*
                         转场执行的时候，containerView中只包含fromView，转场动画执行完毕之后，containerView会将fromView移除。因为containerView不负责toView的添加，所以我们需要主动将toView添加到containerView中。
                          所以无需管 fromView，自动被移除了
                          */
                     }];
}

- (void)popAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //取出转场前后视图控制器上的视图view
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIView *containerView = [transitionContext containerView];
    
    //左侧动画视图
    UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(-toView.frame.size.width/2, 0, toView.frame.size.width/2, toView.frame.size.height)];
    leftView.clipsToBounds = YES;
    [leftView addSubview:toView];
    
    //右侧动画视图
    // 使用系统自带的snapshotViewAfterScreenUpdates:方法，参数为YES，代表视图的属性改变渲染完毕后截屏，参数为NO代表立刻将当前状态的视图截图
    UIView *rightToView = [toView snapshotViewAfterScreenUpdates:YES];
    rightToView.frame = CGRectMake(-toView.frame.size.width/2, 0, toView.frame.size.width, toView.frame.size.height);
    UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(toView.frame.size.width, 0, toView.frame.size.width/2, toView.frame.size.height)];
    rightView.clipsToBounds = YES;
    [rightView addSubview:rightToView];
    
    //加入动画视图
    [containerView addSubview:fromView];
    [containerView addSubview:leftView];
    [containerView addSubview:rightView];
    if (Print) {
        NSLog(@"from_________ %@", fromView);
        NSLog(@"to_________ %@", toView);
    }
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
                        options:UIViewAnimationOptionTransitionFlipFromRight
                     animations:^{
                         leftView.frame = CGRectMake(0, 0, toView.frame.size.width/2, toView.frame.size.height);
                         rightView.frame = CGRectMake(toView.frame.size.width/2, 0, toView.frame.size.width/2, toView.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         
                         [transitionContext completeTransition:YES];
                         [containerView addSubview:toView];
                         [leftView removeFromSuperview];
                         [rightView removeFromSuperview];
                         if (Print) {
                             for(UIView * view in containerView.subviews){
                                 NSLog(@"subView________%@", view);
                             }
                         }
//                         toView.hidden = NO;
                         /*
                          转场执行的时候，containerView中只包含fromView，转场动画执行完毕之后，containerView会将fromView移除。因为containerView不负责toView的添加，所以我们需要主动将toView添加到containerView中。
                          所以无需管 fromView，自动被移除了
                          */
                         
                     }];
}

@end
