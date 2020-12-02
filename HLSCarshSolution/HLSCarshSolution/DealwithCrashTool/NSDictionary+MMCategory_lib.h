//
//  NSDictionary+MMCategory_lib.h
//  MMCarshSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (MMCategory_lib)
- (void)MM_setSafeValue:(nonnull id)value forSafeKey:(nonnull NSString *)key;

- (NSArray*)MM_arraySafeForKey:(id)key;

- (id)MM_objectSafeForKey:(NSString *)key withValueClass:(Class)valueClass;
@end

NS_ASSUME_NONNULL_END
