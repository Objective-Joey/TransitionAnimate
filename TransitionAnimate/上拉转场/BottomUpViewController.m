//
//  BottomUpViewController.m
//  TransitionAnimate
//
//  Created by PearPear on 2019/4/12.
//  Copyright © 2019 PearPear. All rights reserved.
//

#import "BottomUpViewController.h"
#import "BottomUpView.h"
#import "UIView+SetRect.h"
#import "DownTopViewController.h"
#import "PresentingAnimator.h"
#import "DismissingAnimator.h"
@interface BottomUpViewController ()<UIViewControllerTransitioningDelegate,BottomUpViewDelegate>
@property (nonatomic, strong)   BottomUpView * bottomUPView;
@end

@implementation BottomUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.bottomUPView = [[BottomUpView alloc] initWithFrame: CGRectMake(0, StatusBarDelta, Width, Height - StatusBarDelta)];
    self.bottomUPView.delegate = self;
    [self.bottomUPView buildView];
    [self.view addSubview:self.bottomUPView];
    // Do any additional setup after loading the view.
}

- (void)pullUpEvent{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        DownTopViewController *next   = [DownTopViewController new];
        next.transitioningDelegate  = self;
        next.modalPresentationStyle = UIModalPresentationCustom;
        [self presentViewController:next animated:YES completion:nil];
    });
}

/**
 *  下拉更新数据
 */
- (void)pullDownToRefreshData {
    NSLog(@"下拉获取数据");
}

#pragma mark - 定制转场动画

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source {
    
    return [PresentingAnimator new];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [DismissingAnimator new];
}

@end
