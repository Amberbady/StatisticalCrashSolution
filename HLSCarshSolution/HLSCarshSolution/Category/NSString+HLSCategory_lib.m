//
//  NSString+HLSCategory_lib.m
//  HLSCarshSolution
//
//  Created by liaoshen on 2020/11/17.
//

#import "NSString+HLSCategory_lib.h"

@implementation NSString (HLSCategory_lib)
- (NSString *)hls_substringWithRangeSafe:(NSRange)range{
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
