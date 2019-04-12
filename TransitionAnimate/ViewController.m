//
//  ViewController.m
//  TransitionAnimate
//
//  Created by PearPear on 2019/4/12.
//  Copyright © 2019 PearPear. All rights reserved.
//

#import "ViewController.h"
#import "WPBubbleViewController.h"
#import "WPViewControllerDelegate.h"
#import "WPNavControllerDelegate.h"
#import "WSLPushAnimationVC.h"

#import "WSLNavInteractiveDelegate.h"
#import "WPTransitionInteractiveVC.h"


#import "BottomUpViewController.h"
@interface ViewController ()
@property (nonatomic,strong) WPViewControllerDelegate * delegate;
//push动画过渡转场
@property (nonatomic, strong) WPNavControllerDelegate * navControllerDelegate;
@property (nonatomic, strong) WSLNavInteractiveDelegate * navInteractiveDelegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * btn =  [self.view viewWithTag:1011];
    btn.layer.cornerRadius = btn.frame.size.width/2.0f;
    // Do any additional setup after loading the view, typically from a nib.
}

//模态呈现
- (IBAction)presentBtnClick:(UIButton *)sender {
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    WPBubbleViewController * bublle = [mainSB instantiateViewControllerWithIdentifier:@"WPBubbleViewController"];
    self.delegate = [WPViewControllerDelegate WPViewControllerDelegateWithConfig:@[[NSValue valueWithCGPoint:sender.center],sender.backgroundColor]];
    bublle.transitioningDelegate = self.delegate;
    // 此处设置 style UIModalPresentationCustom
    bublle.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:bublle animated:YES completion:nil];
}

// push 进入
- (IBAction)pushBtnClick:(UIButton *)sender {
    WSLPushAnimationVC * vc = [[WSLPushAnimationVC alloc] init];
    self.navControllerDelegate = [WPNavControllerDelegate WPNavControllerDelegateWithConfig:@[@0]];
    self.navigationController.delegate = self.navControllerDelegate;
    [self.navigationController pushViewController:vc animated:YES];
}
// 交互式
- (IBAction)interactiveBtnClick:(UIButton *)sender {
    
//    WPTransitionInteractiveVC * vc = [[WPTransitionInteractiveVC alloc] init];
//    self.navInteractiveDelegate = [WSLNavInteractiveDelegate WSLNavInteractiveDelegateWithTarget:vc interactiveType:1 animationType:0];
//    self.navigationController.delegate = self.navInteractiveDelegate;
//    [self.navigationController pushViewController:vc animated:YES];
    
   BottomUpViewController * vc =  [[BottomUpViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

@end
