//
//  NSArray+HLSCategory_lib.m
//  HLSCarshSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import "NSArray+HLSCategory_lib.h"

@implementation NSArray (HLSCategory_lib)

- (id)hls_objectAtSafeIndex:(NSUInteger)index
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
