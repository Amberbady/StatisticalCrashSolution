//
//  HLSDicKeyNilViewController.m
//  HLSCrashSolution
//
//  Created by liaoshen on 2020/11/14.
//

#import "HLSDicKeyNilViewController.h"

@interface HLSDicKeyNilViewController ()

@end

@implementation HLSDicKeyNilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 5000000; i++) {
            NSObject *obj = [[NSObject alloc] init];  // 内存暴增，局部变量没有释放
            NSLog(@"aaaaaa %p", &obj);
         }
    });
    
}

-(void)dealloc{
    
}

@end
