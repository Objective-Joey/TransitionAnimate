//
//  WPNavControllerDelegate.m
//  TransitionAnimate
//
//  Created by PearPear on 2019/4/12.
//  Copyright © 2019 PearPear. All rights reserved.
//

#import "WPNavControllerDelegate.h"
#import "WSLTransitionAnimationFour.h"
@interface WPNavControllerDelegate ()
@property (nonatomic, strong) WSLTransitionAnimationFour *transitionAnimation;
@end
@implementation WPNavControllerDelegate

+ (WPNavControllerDelegate *)WPNavControllerDelegateWithConfig:(NSArray *)arr{
    WPNavControllerDelegate * delegate = [[WPNavControllerDelegate alloc] init];
    delegate.transitionAnimation.transitionType = [arr.firstObject integerValue];
    return delegate;
}

//返回处理push/pop动画过渡的对象
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
        self.transitionAnimation.transitionType = WSLTransitionFourTypePush;
        return self.transitionAnimation;
    }else if (operation == UINavigationControllerOperationPop){
        self.transitionAnimation.transitionType = WSLTransitionFourTypePop;
    }
    return self.transitionAnimation;
}

- (WSLTransitionAnimationFour *)transitionAnimation{
    
    if (!_transitionAnimation) {
        _transitionAnimation = [[WSLTransitionAnimationFour alloc] init];
    }
    return _transitionAnimation;
}
@end
