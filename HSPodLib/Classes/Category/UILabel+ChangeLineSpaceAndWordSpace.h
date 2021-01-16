//
//  UILabel+ChangeLineSpaceAndWordSpace.h
//  IOA
//
//  Created by sy on 2019/4/26.
//  Copyright © 2019 sy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (ChangeLineSpaceAndWordSpace)
/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;
// 字间距 以及文字对齐方式
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space withAlignment:(NSTextAlignment)textAlignment;
/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

//两端对齐
-(void)textAlignmentLeftAndRight;
@end

NS_ASSUME_NONNULL_END
