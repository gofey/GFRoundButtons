//
//  ViewController.m
//  GFRoundButtons
//
//  Created by gofeyLee on 2018/8/29.
//  Copyright © 2018年 gofeyLee. All rights reserved.
//

#import "ViewController.h"
#import "GFRoundBtnsView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray<UIButton *> *array = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor whiteColor];
        btn.frame = CGRectMake(0, 0, 10, 10);
        [array addObject:btn];
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor whiteColor];
    btn.frame = CGRectMake(0, 0, 20, 20);
    GFRoundBtnsView *roundBtns = [[GFRoundBtnsView alloc] initWithCenterButton:btn aroundButtons:array frame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:roundBtns];
    
    roundBtns.backgroundColor = [UIColor blackColor];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
