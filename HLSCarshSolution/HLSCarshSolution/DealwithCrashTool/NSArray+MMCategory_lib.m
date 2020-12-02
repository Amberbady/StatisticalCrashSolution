//
//  NSArray+MMCategory_lib.m
//  MMCarshSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import "NSArray+MMCategory_lib.h"

@implementation NSArray (MMCategory_lib)

- (id)MM_objectAtSafeIndex:(NSUInteger)index
{
    if (self.count == 0) {
        return nil;
    }
    if (index >= self.count) {
        return nil;
    }
    
    return [self objectAtIndex:index];
}



@end
