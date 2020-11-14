//
//  NSMutableArray+HLSCategory_lib.m
//  HLSCarshSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import "NSMutableArray+HLSCategory_lib.h"

@implementation NSMutableArray (HLSCategory_lib)
- (void)hls_removeObjectAtIndexSafe:(NSUInteger)index
{
    if (self.count == 0) {
        NSAssert(index, @"传入的index为越界");
        return;
    }
    if (index >= self.count) {
        NSAssert(index, @"传入的index为越界");
        return;
    }
    [self removeObjectAtIndex:index];
}

- (void)hls_addObjectSafe:(id)anObject
{
    if (!anObject) {
        NSAssert(anObject, @"传入的anObject为nil");
        return;
    }
    [self addObject:anObject];
}

- (void)hls_insertObjectSafe:(id)anObject atIndex:(NSUInteger)index
{
    if (!anObject) {
        NSAssert(anObject, @"传入的anObject为nil");
        return;
    }
    if (index > self.count) {
        NSAssert(index, @"传入的index为越界");
        return;
    }
    [self insertObject:anObject atIndex:index];
}


@end
