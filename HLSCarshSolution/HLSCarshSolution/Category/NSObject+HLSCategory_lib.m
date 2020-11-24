//
//  NSObject+HLSCategory_lib.m
//  HLSCarshSolution
//
//  Created by liaoshen on 2020/11/16.
//

#import "NSObject+HLSCategory_lib.h"

@implementation NSObject (HLSCategory_lib)
-(BOOL)isNull:(id)object
{
    // 判断是否为空串
    if ([object isEqual:[NSNull null]]) {
        return NO;
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return NO;
    }
    else if (object==nil){
        return NO;
    }
    return YES;
}
@end
