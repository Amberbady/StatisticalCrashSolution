//
//  NSDictionary+MMCategory_lib.m
//  MMCarshSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import "NSDictionary+MMCategory_lib.h"

@implementation NSDictionary (MMCategory_lib)

- (void)MM_setSafeValue:(nonnull id)value forSafeKey:(nonnull NSString *)key{
    if (!value) {
        NSAssert(value, @"传入的value为nil");
    }
    if (!key) {
        NSAssert(key, @"传入的key为nil");
    }
    [self setValue:value forKey:key];
}



- (NSArray*)MM_arraySafeForKey:(id)key
{
    id object = [self objectForKey:key];
    if (!object) { return nil; }
    if (![object isKindOfClass:[NSArray class]]) {
        object = [NSArray arrayWithObject:object];
    }
    
    return object;
}


- (id)MM_objectSafeForKey:(NSString *)key withValueClass:(Class)valueClass
{
    if (![key isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    if (valueClass == NULL) {
        return nil;
    }
    
    id value = [self objectForKey:key];
    
    if (!value) {
        return nil;
    }
    
    if (valueClass == [NSArray class] && ![value isKindOfClass:[NSArray class]]) {
        return [NSArray arrayWithObjects:value, nil];
    }
    
    if (![value isKindOfClass:valueClass]) {
        return nil;
    }
    
    return value;

}

@end
