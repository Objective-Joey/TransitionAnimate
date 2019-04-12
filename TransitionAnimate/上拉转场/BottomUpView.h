//
//  BottomUpView.h
//  TransitionAnimate
//
//  Created by PearPear on 2019/4/12.
//  Copyright © 2019 PearPear. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BottomUpViewDelegate <NSObject>

- (void)pullUpEvent;
- (void)pullDownToRefreshData;

@end
@interface BottomUpView : UIView
-(void)buildView;
@property (nonatomic, weak)   id<BottomUpViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
