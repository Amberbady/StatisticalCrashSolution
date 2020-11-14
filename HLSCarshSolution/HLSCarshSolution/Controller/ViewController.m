//
//  ViewController.m
//  HLSCrashSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import "ViewController.h"
#import "HLSCrashModel.h"
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

        default:
            break;
    }
}





@end
