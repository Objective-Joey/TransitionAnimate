//
//  WSLTransitionInteractiveDelegate.m
//  TransitionAnimate
//
//  Created by PearPear on 2019/4/12.
//  Copyright © 2019 PearPear. All rights reserved.
//

#import "WSLNavInteractiveDelegate.h"
#import "WSLTransitionInteractive.h"
#import "WSLTransitionAnimationTwo.h"

@interface WSLNavInteractiveDelegate ()

//手势过渡转场
@property (nonatomic, strong) WSLTransitionInteractive * transitionInteractive;
//动画过渡转场
@property (nonatomic, strong) WSLTransitionAnimationTwo * transitionAnimation;
@end
@implementation WSLNavInteractiveDelegate

+ (WSLNavInteractiveDelegate *)WSLNavInteractiveDelegateWithTarget:(UIViewController * )target interactiveType:(NSInteger) type animationType:(NSInteger) type2{
    WSLNavInteractiveDelegate * delegate = [[WSLNavInteractiveDelegate alloc] init];
    delegate.transitionInteractive = [WSLTransitionInteractive WSLTransitionInteractiveWithTarget:target type:type];
    delegate.transitionAnimation = [[WSLTransitionAnimationTwo alloc] init];
    delegate.transitionAnimation.transitionType = type2;
    return delegate;
}

//返回处理push/pop动画过渡的对象
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
        self.transitionAnimation.transitionType = WSLTransitionTwoTypePush;
        return self.transitionAnimation;
    }else if (operation == UINavigationControllerOperationPop){
        self.transitionAnimation.transitionType = WSLTransitionTwoTypePop;
    }
    return self.transitionAnimation;
}
//返回处理push/pop手势过渡的对象 这个代理方法依赖于上方的方法 ，这个代理实际上是根据交互百分比来控制上方的动画过程百分比
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    
    //手势开始的时候才需要传入手势过渡代理，如果直接pop或push，应该返回nil，否者无法正常完成pop/push动作
    if ( self.transitionAnimation.transitionType == WSLTransitionTwoTypePop) {
        return self.transitionInteractive.isInteractive == YES ? self.transitionInteractive : nil;
    }
    return nil;
}

@end
