//
//  BottomUpView.m
//  TransitionAnimate
//
//  Created by PearPear on 2019/4/12.
//  Copyright © 2019 PearPear. All rights reserved.
//

#import "BottomUpView.h"
#import "UIView+SetRect.h"
@interface BottomUpView ()<UIScrollViewDelegate,UITableViewDelegate>

@property (nonatomic, strong) UIScrollView *mainContent;

@end
@implementation BottomUpView


-(void)buildView{
    self.mainContent = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.mainContent.contentSize = self.bounds.size;
    self.mainContent.alwaysBounceVertical = YES;
//    self.mainContent = [[UITableView alloc] initWithFrame:self.bounds];
    self.mainContent.delegate = self;
    [self addSubview:self.mainContent];
    if (@available(iOS 11.0, *)) {
        self.mainContent.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    UIView * backViw         = [[UIView alloc] initWithFrame:self.bounds];
    backViw .backgroundColor = [UIColor yellowColor];
    UIView * headView         = [[UIView alloc] initWithFrame:CGRectMake(0, -60, Width, 60)];
    headView.backgroundColor = [UIColor yellowColor];
    [self.mainContent addSubview:headView];
    [self.mainContent addSubview:backViw];
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    // 位移超过60后执行动画效果
    if (scrollView.contentOffset.y >= 60.f) {
        
        if (_delegate && [_delegate respondsToSelector:@selector(pullUpEvent)]) {
            
            [_delegate pullUpEvent];
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            });
        }
    }
    if (scrollView.contentOffset.y <= -60.f) {
        
        if (_delegate && [_delegate respondsToSelector:@selector(pullDownToRefreshData)]) {
            
            [_delegate pullDownToRefreshData];
        }
    }
}
@end
