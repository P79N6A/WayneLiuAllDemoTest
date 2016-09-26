//
//  ViewController.m
//  control
//
//  Created by didi on 16/8/6.
//  Copyright © 2016年 didi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
- (IBAction)add:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *time;

@property (nonatomic,assign)float timeNumber;

@property(nonatomic,strong)UIWebView *webview;

@end

@implementation ViewController

+(void)load{
    NSLog(@"11");
}

+(void)initialize{
    NSLog(@"222");
}


- (instancetype)init{
    self = [super init];
    if(self){
        self.timeNumber = 0.0;//[NSNumber numberWithFloat:0.0];
        
            }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *fatherView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 300, 300)];
    [self.view addSubview:fatherView];
    
//    fatherView.userInteractionEnabled = NO;
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
    [btn addTarget:self action:@selector(printStr) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [fatherView addSubview:btn];

    
    
//    [self dingshiqi];
    [self testForObjectAndValue];
   
    
    
    
    
}


- (void)printStr{
    NSLog(@"button");
}


//测试父view的bounds改变过后，子类怎么变化(结论： 子类会去找父类的原点(0,0)，然后在根据其来布局)
- (void)testForBoundsAndFrame{
    //    [self.view setBounds:CGRectMake(100, 100, 300, 300)];
    ////    self.view.bounds = CGRectMake(100, 100, 300, 300);
    //    self.view.backgroundColor = [UIColor greenColor];
    
    UIView *fatherView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 300, 300)];
    fatherView.bounds = CGRectMake(-50, -50, 300, 300);
    fatherView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:fatherView];
    
    UIView *sonView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    sonView.backgroundColor = [UIColor orangeColor];
    [fatherView addSubview:sonView];
}

//测试setOBject和setValue
-(void)testForObjectAndValue{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:@"object" forKey:@"objcKey"];
    [dictionary setValue:@"value" forKey:@"valueKey"];
    
    
    NSLog(@"%@",[dictionary objectForKey:@"valueKey"]);
    NSLog(@"%@",[dictionary valueForKey:@"objcKey"]);
    
    //会自动抹掉该value
    [dictionary setValue:nil forKey:@"objcKey"];
//    [dictionary setObject:nil forKey:@"dddd"];
    
}


//测试webview
-(void)testForWebview{
    self.webview = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:self.webview];
    
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://common.rdtest.didichuxing.com/JSBridge/JSBridge.html"]]];

}


//测试定时器
- (void)dingshiqi{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(update) userInfo:nil repeats:YES];
    
    
    //    [timer fire];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addTimer:timer forMode:NSRunLoopCommonModes];
        //        [timer fire];
    });

}

- (void)update{
    self.time.text =[NSString stringWithFormat:@"%f", self.timeNumber++];
//   self.timeNumber++ =  [self.timeNumber floatValue]++;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(UISlider *)sender {
//    (UISlider *)sender = sender;
    NSLog(@"pppp = %f",sender.value);
}
@end
