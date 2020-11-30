//
//  HLSSafeView.m
//  HLSCarshSolution
//
//  Created by liaoshen on 2020/11/30.
//

#import "HLSSafeView.h"
#import <objc/runtime.h>
@implementation HLSSafeView

#pragma mark - 第三步 慢速转发
-(void)showMessage:(NSString*)message{
    NSLog(@"message = %@",message);
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if ([super methodSignatureForSelector:aSelector] == nil) {
        NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return signature;
    }
    return [super methodSignatureForSelector:aSelector];
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL sel = @selector(showMessage:);
    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    anInvocation = [NSInvocation invocationWithMethodSignature:signature];
    [anInvocation setTarget:self];
    [anInvocation setSelector:sel];
    NSString *message = @"在第三步自己实现的方法，改了参数";
    [anInvocation setArgument:&message atIndex:2];
    if ([self respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:self];
    }else{
        [super forwardInvocation:anInvocation];
    }
}
@end
