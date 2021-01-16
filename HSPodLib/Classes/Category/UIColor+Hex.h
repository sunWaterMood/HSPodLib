//
//  UIColor+Hex.h
//  liaoliao
//
//  Created by 华华生升 on 2016/12/26.
//  Copyright © 2016年 liaoliaokeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/**
 16进制色值的转换成UIColor

 @param color 传入的16进制色值
 @return UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 16进制色值的转换成UIColor

 @param color 传入的16进制色值
 @param alpha 传入的透明度
 @return UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
// 随机颜色
+ (UIColor *)randomRGB;

@end
