//
//  NSMutableArray+HLSCategory_lib.h
//  HLSCarshSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (HLSCategory_lib)

- (void)hls_removeObjectAtIndexSafe:(NSUInteger)index;

- (void)hls_addObjectSafe:(id)anObject;

- (void)hls_insertObjectSafe:(id)anObject atIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
