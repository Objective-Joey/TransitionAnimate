//
//  WPViewControllerDelegate.m
//  TransitionAnimate
//
//  Created by PearPear on 2019/4/12.
//  Copyright © 2019 PearPear. All rights reserved.
//

#import "WPViewControllerDelegate.h"
#import "YPBubbleTransition.h"

@interface WPViewControllerDelegate ()
@property (nonatomic, strong) YPBubbleTransition *transition;
@end

@implementation WPViewControllerDelegate


+ (WPViewControllerDelegate *)WPViewControllerDelegateWithConfig:(NSArray *)arr{
    
    WPViewControllerDelegate * delegate = [[WPViewControllerDelegate alloc] init];
    delegate.transition.startPoint = [arr.firstObject CGPointValue];
    delegate.transition.bubbleColor = arr.lastObject;
    return delegate;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.transition.transitionMode = YPBubbleTransitionModePresent;
    return self.transition;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transition.transitionMode = YPBubbleTransitionModeDismiss;
    return self.transition;
}

-(YPBubbleTransition *)transition
{
    if (!_transition) {
        _transition = [[YPBubbleTransition alloc] init];
    }
    return _transition;
}
@end
