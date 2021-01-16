//
//  NSString+Decimal.m
//  IOAforPD
//
//  Created by sy on 2018/11/30.
//  Copyright © 2018 sy. All rights reserved.
//

#import "NSString+Decimal.h"

@implementation NSString (Decimal)
+(NSString *)toBinarySystemWithDecimalSystem:(NSString *)decimal
{
    NSInteger num = [decimal integerValue];//[decimal intValue];
    NSInteger remainder = 0;      //余数
    NSInteger divisor = 0;        //除数
    NSString * prepare = @"";
    while (true)
    
        {
        
                remainder = num%2;
        
                divisor = num/2;
        
                num = divisor;
        
                prepare = [prepare stringByAppendingFormat:@"%ld",remainder];
        
                
        
                if (divisor == 0)
            
                    {
                
                            break;
                
                        }
        
            }

    

    NSString * result = @"";

    for (NSInteger i = prepare.length - 1; i >= 0; i --)
    
        {
        
                result = [result stringByAppendingFormat:@"%@",
                          
                                            [prepare substringWithRange:NSMakeRange(i , 1)]];
        
            }

        

    return result;
}
+(NSString *)getUIType:(NSString *)str{
    return [str substringFromIndex:str.length -3];
}
@end
