//
//  NSString+MMCategory_lib.m
//  MMCarshSolution
//
//  Created by liaoshen on 2020/11/17.
//

#import "NSString+MMCategory_lib.h"

@implementation NSString (MMCategory_lib)
- (NSString *)MM_substringWithRangeSafe:(NSRange)range{
    NSString *resultString;
    BOOL isException;
    @try {
        resultString = [self substringWithRange:range];
    } @catch (NSException *exception) {
        resultString = exception.reason;
        isException = YES;
    } @finally {
        if (isException) {
            NSAssert(isException, @"截取出现异常");
        }
    }
    return resultString;
}

@end
