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
    NSArray<NSString *> *btnImgName = @[@"littleCharts",@"vote",@"charts",@"topic",@"mine",];
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        btn.frame = CGRectMake(0, 0, 34, 34);
        [btn setImage:[UIImage imageNamed:btnImgName[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 79, 79);
    [btn setImage:[UIImage imageNamed:@"voteArea"] forState:UIControlStateNormal];
    GFRoundBtnsView *roundBtns = [[GFRoundBtnsView alloc] initWithCenterButton:btn aroundButtons:array frame:CGRectMake(100, 100, 200, 400)];
    [self.view addSubview:roundBtns];
    roundBtns.backgroundColor = [UIColor lightGrayColor];
}
- (void)btnClick:(UIButton *)sender{
    NSLog(@" === %ld",(long)sender.tag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
