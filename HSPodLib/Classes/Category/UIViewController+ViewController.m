//
//  UIViewController+ViewController.m
//  wg
//
//  Created by h on 2017/8/24.
//  Copyright © 2017年 wggyl. All rights reserved.
//

#import "UIViewController+ViewController.h"

@implementation UIViewController (ViewController)

-(void)setNavigationBackImage:(UIImage *)image{
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
+(void)load {
    swizzleMethod([self class], @selector(viewDidAppear:), @selector(ac_viewDidAppear));
    swizzleMethod([self class], @selector(viewWillDisappear:), @selector(ac_viewWillDisappear));
}
-(void)ac_viewWillDisappear{
//    NSSLog(@"==---ac_viewWillDisappear---");
    //晴空标记
//    [kAppDelegate.formUuids removeAllObjects];
    //全局按钮的红色标记q隐藏
//    [kAppDelegate.gobalBtn pp_hiddenBadge];
    // 页面进来重置全局按钮状态
//    kAppDelegate.gobalBtn.selected = NO;
//    [kAppDelegate.menuView dismiss];
    [self ac_viewWillDisappear];
}
- (void)ac_viewDidAppear{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithTitle:@""
                                             style:UIBarButtonItemStylePlain
                                             target:self
                                             action:nil];
    //晴空标记
//    [kAppDelegate.formUuids removeAllObjects];
    //全局按钮的红色标记q隐藏
//    [kAppDelegate.gobalBtn pp_hiddenBadge];
    // 页面进来重置全局按钮状态
//    kAppDelegate.gobalBtn.selected = NO;
//    [kAppDelegate.menuView dismiss];
    [self ac_viewDidAppear];
}
void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    // class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    // the method doesn't exist and we just added one
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
- (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    return currentVC;
}
- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
          currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}
@end
