//
//  HLSCrashModel.m
//  HLSCrashSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import "HLSCrashModel.h"
@implementation HLSCrashModel

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
        [_dataArray addObject:[self addCrashModelWith:@"消息转发" andWith:HLSCrashForwardingMessage]];
        [_dataArray addObject:[self addCrashModelWith:@"获取的数据为null导致奔溃" andWith:HLSCrashNSNull]];
        [_dataArray addObject:[self addCrashModelWith:@"key为nil 会崩溃" andWith:HLSCrashDicKeyNil]];
        [_dataArray addObject:[self addCrashModelWith:@"value为nil 会崩溃" andWith:HLSCrashDicValueNil]];
        [_dataArray addObject:[self addCrashModelWith:@"字典通过key取出值数组接收，是字符串崩溃" andWith:HLSCrashDicValueNilForArray]];
        [_dataArray addObject:[self addCrashModelWith:@"index>数组的count造成崩溃" andWith:HLSCrashArrayBounds]];
        [_dataArray addObject:[self addCrashModelWith:@"可变数组的添加" andWith:HLSCrashMutArrayAdd]];
        [_dataArray addObject:[self addCrashModelWith:@"可变数组的插入" andWith:HLSCrashMutArrayInsert]];
        [_dataArray addObject:[self addCrashModelWith:@"可变数组的删除" andWith:HLSCrashMutArrayRemove]];
        [_dataArray addObject:[self addCrashModelWith:@"字符串操作" andWith:HLSCrashStringOperation]];
        [_dataArray addObject:[self addCrashModelWith:@"内存暴增，局部变量没有释放" andWith:HLSCrashMemoryExplosion]];
        [_dataArray addObject:[self addCrashModelWith:@"截取字符串、数组、NSData越界" andWith:HLSCrashSubstringRange]];
        [_dataArray addObject:[self addCrashModelWith:@"字符串类型错误" andWith:HLSCrashStringTypeError]];
        [_dataArray addObject:[self addCrashModelWith:@"主线程死锁1" andWith:HLSCrashDeadLockError1]];
        [_dataArray addObject:[self addCrashModelWith:@"主线程死锁2" andWith:HLSCrashDeadLockError2]];
        [_dataArray addObject:[self addCrashModelWith:@"Inf" andWith:HLSCrashInfError]];
        [_dataArray addObject:[self addCrashModelWith:@"Nan" andWith:HLSCrashNanError]];
        [_dataArray addObject:[self addCrashModelWith:@"NSMutableString属性声明为copy程序崩溃了" andWith:HLSCrashMutableStringCopy]];
        
    }
    return _dataArray;
}

- (HLSCrashModel *)addCrashModelWith:(NSString *)crashName andWith:(HLSCrashType)crashType{
    HLSCrashModel *model = [[HLSCrashModel alloc]init];
    model.crashName = crashName;
    model.crashType = crashType;
    return model;
}

@end
