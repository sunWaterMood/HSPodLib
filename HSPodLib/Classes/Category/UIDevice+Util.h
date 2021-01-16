//
//  UIDevice+Util.h
//  IOAforPD
//
//  Created by sy on 2018/12/12.
//  Copyright © 2018 sy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Util)
+(NSString *)getDeviceIdentifierUUID;
+ (NSString *)wifiInfoBssid;
/**
 * @interfaceOrientation 输入要强制转屏的方向
 */
+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation;
+(NSString *)getAppVersion;
@end

NS_ASSUME_NONNULL_END
