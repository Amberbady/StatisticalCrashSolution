//
//  MMCrashModel.h
//  MMCrashSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger , MMCrashType) {
    MMCrashDicKeyNil = 0,          //字典key为nil
    MMCrashDicValueNil = 1,        //字典value为nil
    MMCrashDicValueNilForArray = 2,        //当字典通过key取出的值已数组接收，但其实是字符串崩溃
    MMCrashArrayBounds = 3,      // index>数组的count造成崩溃
    MMCrashMutArrayAdd = 4,      // 可变数组的添加
    MMCrashMutArrayInsert = 5,      // 可变数组的插入
    MMCrashMutArrayRemove = 6,      // 可变数组的删除
    MMCrashStringOperation = 7,      // 字符串操作
    MMCrashMemoryExplosion = 8,      // 内存暴增，局部变量没有释放
    MMCrashSubstringRange = 9,      // 截取字符串、数组、NSData越界
    MMCrashStringTypeError = 10,      // 格式化字符串类型错误
    MMCrashDeadLockError1 = 11,      // 主线程死锁1
    MMCrashDeadLockError2 = 12,      // 主线程死锁2
    MMCrashInfError = 13,      // Inf
    MMCrashNanError = 14,      // Nan
    MMCrashMutableStringCopy = 15,      // NSMutableString属性声明为copy程序崩溃了
    MMCrashNSNull = 16,     //获取的数据为null导致奔溃
    MMCrashObjectForwardingMessage = 17,     //objcet 消息转发
    MMCrashControllerForwardingMessage = 18,     //Controller 消息转发
    MMCrashViewForwardingMessage = 19,     //View 消息转发
};

@interface MMCrashModel : NSObject

///crash 名称
@property (nonatomic,copy)NSString *crashName;

///className 展示类目
@property (nonatomic,copy)NSString *className;

///crashType
@property (nonatomic,assign)MMCrashType crashType;

///dataArray 模型数组
@property (nonatomic,strong)NSMutableArray<MMCrashModel *> *dataArray;

@end

NS_ASSUME_NONNULL_END
