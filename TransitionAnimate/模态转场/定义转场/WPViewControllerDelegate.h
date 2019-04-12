//
//  WPViewControllerDelegate.h
//  TransitionAnimate
//
//  Created by PearPear on 2019/4/12.
//  Copyright © 2019 PearPear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WPViewControllerDelegate : NSObject <UIViewControllerTransitioningDelegate>

+ (WPViewControllerDelegate *)WPViewControllerDelegateWithConfig:(NSArray *)arr;
@end

NS_ASSUME_NONNULL_END
