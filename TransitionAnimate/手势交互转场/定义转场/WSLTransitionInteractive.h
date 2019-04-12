//
//  WSLTransitionInteractiveTwo.h
//  TransferAnimation
//
//  Created by 王双龙 on 2018/4/15.
//  Copyright © 2018年 王双龙. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WSLInteractiveTwoType) {
    WSLInteractiveTwoTypePush = 0,
    WSLInteractiveTwoTypePop,
};

//处理手势过渡的对象
@interface WSLTransitionInteractive : UIPercentDrivenInteractiveTransition
+ (WSLTransitionInteractive *)WSLTransitionInteractiveWithTarget:(UIViewController * )target type:(WSLInteractiveTwoType) type;
/**
 区分是手势交互转场还是直接pop/push转场
 */
@property (nonatomic, assign) BOOL isInteractive;

@property (nonatomic,assign) WSLInteractiveTwoType interactiveType;

@end
