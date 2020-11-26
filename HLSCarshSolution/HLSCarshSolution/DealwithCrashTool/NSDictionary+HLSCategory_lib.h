//
//  NSDictionary+HLSCategory_lib.h
//  HLSCarshSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (HLSCategory_lib)
- (void)hls_setSafeValue:(nonnull id)value forSafeKey:(nonnull NSString *)key;

- (NSArray*)hls_arraySafeForKey:(id)key;

- (id)hls_objectSafeForKey:(NSString *)key withValueClass:(Class)valueClass;
@end

NS_ASSUME_NONNULL_END
