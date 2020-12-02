//
//  NSMutableArray+MMCategory_lib.m
//  MMCarshSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import "NSMutableArray+MMCategory_lib.h"

@implementation NSMutableArray (MMCategory_lib)
- (void)MM_removeObjectAtIndexSafe:(NSUInteger)index
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

- (void)MM_addObjectSafe:(id)anObject
{
    if (!anObject) {
        NSAssert(anObject, @"传入的anObject为nil");
        return;
    }
    [self addObject:anObject];
}

- (void)MM_insertObjectSafe:(id)anObject atIndex:(NSUInteger)index
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
