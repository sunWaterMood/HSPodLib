//
//  UIView+UIViewController.m
//  IOA
//
//  Created by sy on 2018/12/13.
//  Copyright © 2018 sy. All rights reserved.
//

#import "UIView+UIViewController.h"

@implementation UIView (UIViewController)
-(UIViewController *)getCurrentViewController
{
    id responder = self.nextResponder;
    while (![responder isKindOfClass: [UIViewController class]] && ![responder isKindOfClass: [UIWindow class]])
    {
        responder = [responder nextResponder];
    }
    if ([responder isKindOfClass: [UIViewController class]])
    {
        return (UIViewController *)responder;
    }
    return nil;
}
@end
