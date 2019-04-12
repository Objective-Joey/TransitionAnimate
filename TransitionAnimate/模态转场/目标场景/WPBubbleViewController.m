//
//  WPBubbleViewController.m
//  TransitionAnimate
//
//  Created by PearPear on 2019/4/12.
//  Copyright © 2019 PearPear. All rights reserved.
//

#import "WPBubbleViewController.h"

@interface WPBubbleViewController ()

@end

@implementation WPBubbleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * btn =  [self.view viewWithTag:1012];
    btn.layer.cornerRadius = btn.frame.size.width/2.0f;
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIView * btn =  [self.view viewWithTag:1012];
    [UIView animateWithDuration:0.5f animations:^{
        btn.transform = CGAffineTransformMakeRotation(-M_PI_4*3.0f);
    }];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    UIView * btn =  [self.view viewWithTag:1012];
    [UIView animateWithDuration:0.5f animations:^{
        btn.transform = CGAffineTransformIdentity;
    }];
}

-(IBAction)closeAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
