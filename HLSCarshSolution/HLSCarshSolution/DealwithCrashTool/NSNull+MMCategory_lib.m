//
//  NSNull+MMCategory_lib.m
//  MMCarshSolution
//
//  Created by liaoshen on 2020/11/26.
//

#import "NSNull+MMCategory_lib.h"
#import <objc/message.h>

#define NSNullObjectsArr @[@"", @0, @{}, @[]]

@implementation NSNull (MMCategory_lib)
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
 {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        for (NSObject *obj in NSNullObjectsArr) {
            signature = [obj methodSignatureForSelector:aSelector];
            if (signature) {
                break;
            }
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    for (NSObject *objc in NSNullObjectsArr) {
        if ([objc respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:objc];
            return;
        }
    }
}
@end
