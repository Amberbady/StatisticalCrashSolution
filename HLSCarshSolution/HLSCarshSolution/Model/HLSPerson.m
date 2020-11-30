//
//  HLSPerson.m
//  HLSCarshSolution
//
//  Created by liaoshen on 2020/11/26.
//

#import "HLSPerson.h"
#import "HLSTiger.h"
#import <objc/runtime.h>


@implementation HLSPerson

//-(void)eat{
//    NSLog(@"=== person eat ===");
//}

#pragma mark - 第一步 方法解析

//void eat(){
//    NSLog(@"=== person eat ===");
//}

//+(BOOL)resolveInstanceMethod:(SEL)sel{
//    if ([super resolveInstanceMethod:sel]) {
//        return YES;
//    }else{
//        class_addMethod(self, sel, (IMP)eat, "v@:");
//        return YES;
//    }
//}


#pragma mark - 第二步快速转发
//-(id)forwardingTargetForSelector:(SEL)aSelector{
//    if ([NSStringFromSelector(aSelector) isEqual:@"eat"]) {
//        return [HLSTiger new];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

#pragma mark - 第三步 慢速转发
//-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//    if ([super methodSignatureForSelector:aSelector] == nil) {
//    //创建一个方法签名然后返回
//        NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
//        return signature;
//    }
//    return [super methodSignatureForSelector:aSelector];
//}
//
//-(void)forwardInvocation:(NSInvocation *)anInvocation{
//    //创建一个对象来处理eat方法
//    HLSTiger *tiger = [HLSTiger new];
//    SEL sel = anInvocation.selector;
//    if ([tiger respondsToSelector:sel]) {
//        [anInvocation invokeWithTarget:tiger];
//    }else{
//    //如果处理不了的话，调用doesNotRecognizeSelector方法返回崩溃
//        [self doesNotRecognizeSelector:sel];
//    }
//}

//#pragma mark - 第三步 慢速转发
//-(void)showMessage:(NSString*)message{
//    NSLog(@"message = %@",message);
//}
//
//-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//    if ([super methodSignatureForSelector:aSelector] == nil) {
//        NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
//        return signature;
//    }
//    return [super methodSignatureForSelector:aSelector];
//}
//
//-(void)forwardInvocation:(NSInvocation *)anInvocation{
//    SEL sel = @selector(showMessage:);
//    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
//    anInvocation = [NSInvocation invocationWithMethodSignature:signature];
//    [anInvocation setTarget:self];
//    [anInvocation setSelector:sel];
//    NSString *message = @"在第三步自己实现的方法，改了参数";
//    [anInvocation setArgument:&message atIndex:2];
//    if ([self respondsToSelector:sel]) {
//        [anInvocation invokeWithTarget:self];
//    }else{
//        [super forwardInvocation:anInvocation];
//    }
//}
@end
