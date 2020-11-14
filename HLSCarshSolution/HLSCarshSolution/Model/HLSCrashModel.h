//
//  HLSCrashModel.h
//  HLSCrashSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger , HLSCrashType) {
    HLSCrashDicKeyNil = 0,          //字典key为nil
    HLSCrashDicValueNil = 1,        //字典value为nil
    HLSCrashDicValueNilForArray = 2,        //当字典通过key取出的值已数组接收，但其实是字符串崩溃
    HLSCrashArrayBounds = 3,      // index>数组的count造成崩溃
    HLSCrashMutArrayAdd = 4,      // 可变数组的添加
    HLSCrashMutArrayInsert = 5,      // 可变数组的插入
    HLSCrashMutArrayRemove = 6,      // 可变数组的删除
};

@interface HLSCrashModel : NSObject

///crash 名称
@property (nonatomic,copy)NSString *crashName;

///className 展示类目
@property (nonatomic,copy)NSString *className;

///crashType
@property (nonatomic,assign)HLSCrashType crashType;

///dataArray 模型数组
@property (nonatomic,strong)NSMutableArray<HLSCrashModel *> *dataArray;

@end

NS_ASSUME_NONNULL_END
