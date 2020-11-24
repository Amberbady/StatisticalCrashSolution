//
//  ViewController.m
//  HLSCrashSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import "ViewController.h"
#import "HLSCrashModel.h"
#define kCrashStringError  123

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)HLSCrashModel *crashModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.frame = self.view.bounds;
    //添加数据元素
    [self.view addSubview:self.tableview];
    [self.tableview reloadData];
}

-(HLSCrashModel *)crashModel{
    if (!_crashModel) {
        _crashModel = [[HLSCrashModel alloc]init];
    }
    return _crashModel;
}


-(UITableView *)tableview{
    if(_tableview == nil){
        //bounds 和 frame 区别:bounds,指的是空间本身大小，x=0，y=0；frame，x指的是在父控件的位置和大小
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableview.dataSource = self;//遵循数据源
        _tableview.delegate = self;//遵循协议
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
//每组返回行数 Rows 行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.crashModel.dataArray.count;
}

//每个单元格的e内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    }
    HLSCrashModel *model = self.crashModel.dataArray[indexPath.row];
    cell.textLabel.text = model.crashName;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HLSCrashModel *model = self.crashModel.dataArray[indexPath.row];
    [self crashExampleWithType:model.crashType];
}

- (void)crashExampleWithType:(HLSCrashType)type{
    switch (type) {
        case HLSCrashDicKeyNil:{
            NSString *str;
            NSDictionary *dic = @{str: @"key"}; // 插入nil对象崩溃
            NSLog(@"%@",dic[@"key"]);
        }
            break;
        case HLSCrashDicValueNil:{
            //attempt to insert nil object from objects[0]"
            NSString *str;
            NSDictionary *dic = @{@"key": str}; // 插入nil对象崩溃
            NSLog(@"%@",dic[@"key"]);
            
            
            //    object cannot be nil
            //          NSMutableDictionary *mutDic = [[NSMutableDictionary alloc]init];
            //          [mutDic hls_setSafeValue:@"key" forSafeKey:nil];
            //          [mutDic setObject:nil forKey:@"key"]; // 插入nil对象崩溃
        }
            break;
        case HLSCrashDicValueNilForArray:{
            
            //unrecognized selector sent to instance
            NSDictionary *dic = @{@"key": @"a"};
            NSArray *arr = dic[@"key"];  // arr其实是字符串，但编译器不会报错
            //            NSArray *arr = [dic hls_arraySafeForKey:@"key"]; //解决方案
            NSLog(@"%@", arr[0]);        // 崩溃
            
        }
            break;
            
        case HLSCrashArrayBounds:{
            //index 3 beyond bounds
            NSArray *array= @[@1, @2, @3];
            NSNumber *num = array[3]; // 崩溃
            //            NSNumber *num = [array hls_objectAtSafeIndex:3]; //解决方案
            NSLog(@"%@", num);
            
        }
        case HLSCrashMutArrayAdd:
        {
            //object cannot be nil
            NSMutableArray *array = [NSMutableArray arrayWithObjects:@1,@2,@3, nil];
            NSString *str;
            //            [array hls_addObjectSafe:str];
            [array addObject:str];
        }
            break;
        case HLSCrashMutArrayRemove:
        {
            //range {4, 1} extends beyond bounds [0 .. 2]"
            NSMutableArray *array = [NSMutableArray arrayWithObjects:@1,@2,@3, nil];
            [array removeObjectAtIndex:4];
            //            [array hls_removeObjectAtIndexSafe:4];
        }
            break;
        case HLSCrashMutArrayInsert:
        {
            // index 5 beyond bounds [0 .. 2]"
            NSMutableArray *array = [NSMutableArray arrayWithObjects:@1,@2,@3, nil];
            [array insertObject:@4 atIndex:5];
            //            [array hls_insertObjectSafe:nil atIndex:5];
        }
            break;
        case HLSCrashStringOperation:
        {
            [self filterContentXml:nil];
        }
            break;
        case HLSCrashMemoryExplosion:
        {
            HLSDicKeyNilViewController *VC = [[HLSDicKeyNilViewController alloc]init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case HLSCrashSubstringRange:
        {
            //Range {0, 8} out of bounds; string length 7"
            NSString *str = @"abcdefg";
            //            [str substringWithRange:NSMakeRange(0, 8)]; // 崩溃
            NSString *resultString = [str hls_substringWithRangeSafe:NSMakeRange(0, 8)];;
            
            NSLog(@"%@",resultString);
        }
            break;
        case HLSCrashStringTypeError:
        {
            //Format specifies type 'id' but the argument has type 'int'
            NSString *resultString = [NSString stringWithFormat:@"appkey%@",kCrashStringError];
            //            NSString *resultString = [NSString stringWithFormat:@"appkey%d",(long)kCrashStringError];
            NSLog(@"%@",resultString);
        }
            break;
        case HLSCrashDeadLockError1:
        {
            [self bugThreeButtonClick];
        }
            break;
        case HLSCrashDeadLockError2:
        {
            [self bugTwoButtonClick];
        }
            break;
        case HLSCrashInfError:
        {
            //Thread 1: "Invalid number value (infinite) in JSON write"
            CGFloat num = 10.0;
            CGFloat newNum = num / 0;
            
            if (isnan(newNum)) {
                NSLog(@"NaN");
            }
            
            if (isinf(newNum)) {
                NSLog(@"+inf");
            }
            
            NSData *json1 = [NSJSONSerialization dataWithJSONObject:@{@"key":@(newNum)} options:NSJSONWritingPrettyPrinted error:nil];
            NSLog(@"%@",json1);
            

            //各种类型 变量/0 或者变量/0.0
            int ia = 1;
            NSInteger na = 1;
            CGFloat cfa = 1.0;
            double da = 1.0;
            float fa = 1.0;

//            int ria = ia/0;         //-374309760
//            NSInteger rna = na/0;   //0
            CGFloat rcfa = cfa/0;   //+inf
            double rda = da/0;      //+inf
            float rfa = fa/0;       //+inf

            rcfa = cfa/0.0;         //+inf
            rda = da/0.0;           //+inf
            rfa = fa/0.0;           //+inf

//            int ria1 = ia/0;        //0
//            int rna1 = na/0;        //32671
            int rcfa1 = cfa/0;      //-2147483648
            int rda1 = da/0;        //-2147483648
            int rfa1 = fa/0;        //-2147483648
            
            
        }
            break;
        case HLSCrashNanError:{
            // 变量/变量 第二个变量是0或者0.0
             int ia = 1;
              NSInteger na = 1;
              CGFloat cfa = 1.0;
              double da = 1.0;
              float fa = 1.0;
              int zi = 0;
              double zd = 0.0;
              
//              int ria2 = ia/zi;           //crash: Thread 1: EXC_ARITHMETIC (code=EXC_I386_DIV, subcode=0x0)
//              NSInteger rna2 = na/zi;     //crash: Thread 1: EXC_ARITHMETIC (code=EXC_I386_DIV, subcode=0x0)
              CGFloat rcfa2 = cfa/zi;     //+inf
              double rda2 = da/zi;        //+inf
              float rfa2 = fa/zi;         //+inf

              int ria3 = ia/zd;           //-2147483648
              NSInteger rna3 = na/zd;     //-9223372036854775808
              CGFloat rcfa3= cfa/zd;      //+inf
              double rda3 = da/zd;        //+inf
              float rfa3 = fa/zd;         //+inf
            
            NSLog(@"%f",rfa3);
        }
            break;
        default:
            break;
    }
}

///对空字符串进行操作，导致奔溃

-(void)filterContentXml:(NSString *)contentXml{
    
    //    if (![self isNull:contentXml]) return;
    
    //nil argument"
    NSString * str = [NSString stringWithString:contentXml];
    
}


- (void)bugTwoButtonClick{
    
    //加入myQueue队列的顺序是【任务2、任务4、任务3】，同步线程【任务2、任务3、任务4】造成死锁
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"任务1 - %@", [NSThread currentThread]);
    dispatch_async(queue, ^{
        NSLog(@"任务2 - %@",[NSThread currentThread]);
        dispatch_sync(queue, ^{
            NSLog(@"任务3 - %@", [NSThread currentThread]);
        });
        NSLog(@"任务4 - %@",[NSThread currentThread]);
    });
    NSLog(@"任务5 - %@", [NSThread currentThread]);
}

- (void)bugThreeButtonClick{
    
    //加入主队列的顺序是【异步线程、任务4、死循环、任务5、任务2】
    //这里主队列中死循环使Main Queue阻塞，所以任务2没有执行，又因为任务2是同步线程中，任务3没办法执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务1 - %@", [NSThread currentThread]); // 任务1
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"任务2 - %@", [NSThread currentThread]); // 任务2
        });
        NSLog(@"任务3 - %@", [NSThread currentThread]); // 任务3
    });
    NSLog(@"任务4 - %@", [NSThread currentThread]); // 任务4
    while (1) {
        
    }
    NSLog(@"任务5 - %@", [NSThread currentThread]); // 任务5
}


@end
