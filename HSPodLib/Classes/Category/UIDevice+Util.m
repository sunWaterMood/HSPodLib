//
//  UIDevice+Util.m
//  IOAforPD
//
//  Created by sy on 2018/12/12.
//  Copyright © 2018 sy. All rights reserved.
//

#import "UIDevice+Util.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation UIDevice (Util)
+(NSString *)getDeviceIdentifierUUID
{
    NSString *identifierStr = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return identifierStr;
}
+ (NSString *)wifiInfoBssid{
//    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
//    NSLog(@"interfaces:%@",ifs);
//    NSDictionary *info = nil;
//    for (NSString *ifname in ifs) {
//        info = (__bridge_transfer NSDictionary *)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifname);
//        NSLog(@"%@ => %@",ifname,info);
//    }
//    NSSLog(@"===-----BSSID---====%@",info);
//    if (info[@"BSSID"]) {
//        return info[@"BSSID"];
//    }
    return @"";
}
+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    
    [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:interfaceOrientation];
    
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    
}
+(NSString *)getAppVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}
@end
