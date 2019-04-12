//
//  WSLTransitionInteractiveDelegate.h
//  TransitionAnimate
//
//  Created by PearPear on 2019/4/12.
//  Copyright © 2019 PearPear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WSLNavInteractiveDelegate : NSObject<UINavigationControllerDelegate>
+ (WSLNavInteractiveDelegate *)WSLNavInteractiveDelegateWithTarget:(UIViewController * )target interactiveType:(NSInteger) type animationType:(NSInteger) type2;
@end

NS_ASSUME_NONNULL_END
