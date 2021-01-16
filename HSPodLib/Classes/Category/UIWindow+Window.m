//
//  UIWindow+Window.m
//  wg
//
//  Created by h on 2017/8/30.
//  Copyright © 2017年 wggyl. All rights reserved.
//

#import "UIWindow+Window.h"

@implementation UIWindow (Window)
+(UIWindow *)mainWindow{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
     {
        return [app.delegate window];
     }
     else
    {
         return [app keyWindow];
    }
}
@end
