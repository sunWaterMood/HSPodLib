//
//  UIViewController+ViewController.h
//  wg
//
//  Created by h on 2017/8/24.
//  Copyright © 2017年 wggyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ViewController)
-(void)setNavigationBackImage:(UIImage *)image;
- (void)setStatusBarBackgroundColor:(UIColor *)color;
- (UIViewController *)getCurrentVC;
@end
