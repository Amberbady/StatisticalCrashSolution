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
        [_dataArray addObject:[self addCrashModelWith:@"key为nil 会崩溃" andWith:HLSCrashDicKeyNil]];
        [_dataArray addObject:[self addCrashModelWith:@"value为nil 会崩溃" andWith:HLSCrashDicValueNil]];
        [_dataArray addObject:[self addCrashModelWith:@"字典通过key取出值数组接收，是字符串崩溃" andWith:HLSCrashDicValueNilForArray]];
        [_dataArray addObject:[self addCrashModelWith:@"index>数组的count造成崩溃" andWith:HLSCrashArrayBounds]];
        [_dataArray addObject:[self addCrashModelWith:@"可变数组的添加" andWith:HLSCrashMutArrayAdd]];
        [_dataArray addObject:[self addCrashModelWith:@"可变数组的插入" andWith:HLSCrashMutArrayInsert]];
        [_dataArray addObject:[self addCrashModelWith:@"可变数组的删除" andWith:HLSCrashMutArrayRemove]];

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
