//
//  UIButton+countDown.h
//  IOA
//
//  Created by sy on 2020/2/18.
//  Copyright © 2020 sy. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (countDown)
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
