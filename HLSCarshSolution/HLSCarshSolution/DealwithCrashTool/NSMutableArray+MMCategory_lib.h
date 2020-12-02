//
//  NSMutableArray+MMCategory_lib.h
//  MMCarshSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (MMCategory_lib)

- (void)MM_removeObjectAtIndexSafe:(NSUInteger)index;

- (void)MM_addObjectSafe:(id)anObject;

- (void)MM_insertObjectSafe:(id)anObject atIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
