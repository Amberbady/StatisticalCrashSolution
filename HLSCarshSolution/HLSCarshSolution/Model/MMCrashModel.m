//
//  MMCrashModel.m
//  MMCrashSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import "MMCrashModel.h"
@implementation MMCrashModel

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
        [_dataArray addObject:[self addCrashModelWith:@"object 消息转发" andWith:MMCrashObjectForwardingMessage]];
        [_dataArray addObject:[self addCrashModelWith:@"View 消息转发" andWith:MMCrashViewForwardingMessage]];
        [_dataArray addObject:[self addCrashModelWith:@"Controller 消息转发" andWith:MMCrashControllerForwardingMessage]];
        [_dataArray addObject:[self addCrashModelWith:@"获取的数据为null导致奔溃" andWith:MMCrashNSNull]];
        [_dataArray addObject:[self addCrashModelWith:@"key为nil 会崩溃" andWith:MMCrashDicKeyNil]];
        [_dataArray addObject:[self addCrashModelWith:@"value为nil 会崩溃" andWith:MMCrashDicValueNil]];
        [_dataArray addObject:[self addCrashModelWith:@"字典通过key取出值数组接收，是字符串崩溃" andWith:MMCrashDicValueNilForArray]];
        [_dataArray addObject:[self addCrashModelWith:@"index>数组的count造成崩溃" andWith:MMCrashArrayBounds]];
        [_dataArray addObject:[self addCrashModelWith:@"可变数组的添加" andWith:MMCrashMutArrayAdd]];
        [_dataArray addObject:[self addCrashModelWith:@"可变数组的插入" andWith:MMCrashMutArrayInsert]];
        [_dataArray addObject:[self addCrashModelWith:@"可变数组的删除" andWith:MMCrashMutArrayRemove]];
        [_dataArray addObject:[self addCrashModelWith:@"字符串操作" andWith:MMCrashStringOperation]];
        [_dataArray addObject:[self addCrashModelWith:@"内存暴增，局部变量没有释放" andWith:MMCrashMemoryExplosion]];
        [_dataArray addObject:[self addCrashModelWith:@"截取字符串、数组、NSData越界" andWith:MMCrashSubstringRange]];
        [_dataArray addObject:[self addCrashModelWith:@"字符串类型错误" andWith:MMCrashStringTypeError]];
        [_dataArray addObject:[self addCrashModelWith:@"主线程死锁1" andWith:MMCrashDeadLockError1]];
        [_dataArray addObject:[self addCrashModelWith:@"主线程死锁2" andWith:MMCrashDeadLockError2]];
        [_dataArray addObject:[self addCrashModelWith:@"Inf" andWith:MMCrashInfError]];
        [_dataArray addObject:[self addCrashModelWith:@"Nan" andWith:MMCrashNanError]];
        [_dataArray addObject:[self addCrashModelWith:@"NSMutableString属性声明为copy程序崩溃了" andWith:MMCrashMutableStringCopy]];
        
    }
    return _dataArray;
}

- (MMCrashModel *)addCrashModelWith:(NSString *)crashName andWith:(MMCrashType)crashType{
    MMCrashModel *model = [[MMCrashModel alloc]init];
    model.crashName = crashName;
    model.crashType = crashType;
    return model;
}

@end
