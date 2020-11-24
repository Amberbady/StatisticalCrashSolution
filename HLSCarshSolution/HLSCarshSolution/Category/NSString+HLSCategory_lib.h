//
//  NSString+HLSCategory_lib.h
//  HLSCarshSolution
//
//  Created by liaoshen on 2020/11/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HLSCategory_lib)
- (NSString *)hls_substringWithRangeSafe:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
