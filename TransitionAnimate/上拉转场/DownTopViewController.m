//
//  DownTopViewController.m
//  TransitionAnimate
//
//  Created by PearPear on 2019/4/12.
//  Copyright © 2019 PearPear. All rights reserved.
//

#import "DownTopViewController.h"
#import "UIView+SetRect.h"
@interface DownTopViewController ()<UITableViewDelegate>
@property (nonatomic, strong)   UITableView * tableView;
@end

@implementation DownTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rectTableView = CGRectMake(0, StatusBarDelta, Width, Height - StatusBarDelta);
    
    self.tableView = [[UITableView alloc] initWithFrame:rectTableView style:0];
    if (@available(iOS 11.0, *)) {
        
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (scrollView.contentOffset.y <= -60) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    }
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
