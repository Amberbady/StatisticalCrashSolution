# StatisticalCrashSolution
统计解决奔溃问题
各种案例已经解决方案
例如
    HLSCrashDicKeyNil = 0,          //字典key为nil
    HLSCrashDicValueNil = 1,        //字典value为nil
    HLSCrashDicValueNilForArray = 2,        //当字典通过key取出的值已数组接收，但其实是字符串崩溃
    HLSCrashArrayBounds = 3,      // index>数组的count造成崩溃
    HLSCrashMutArrayAdd = 4,      // 可变数组的添加
    HLSCrashMutArrayInsert = 5,      // 可变数组的插入
    HLSCrashMutArrayRemove = 6,      // 可变数组的删除
    HLSCrashStringOperation = 7,      // 字符串操作
    HLSCrashMemoryExplosion = 8,      // 内存暴增，局部变量没有释放
    HLSCrashSubstringRange = 9,      // 截取字符串、数组、NSData越界
    HLSCrashStringTypeError = 10,      // 格式化字符串类型错误
    HLSCrashDeadLockError1 = 11,      // 主线程死锁1
    HLSCrashDeadLockError2 = 12,      // 主线程死锁2
    HLSCrashInfError = 13,      // Inf
    HLSCrashNanError = 14,      // Nan
    HLSCrashMutableStringCopy = 15,      // NSMutableString属性声明为copy程序崩溃了
    HLSCrashForwardingMessage = 16,     //消息转发
    HLSCrashNSNull = 17,     //获取的数据为null导致奔溃
 后面会持续更新
