//
//  GFRoundBtnsView.m
//  GFRoundButtons
//
//  Created by gofeyLee on 2018/8/29.
//  Copyright © 2018年 gofeyLee. All rights reserved.
//

#import "GFRoundBtnsView.h"
@interface GFRoundBtnsView()
@property(copy,nonatomic)NSArray<UIButton *> *buttons;
@property(strong,nonatomic)UIButton *centerBtn;
@end

@implementation GFRoundBtnsView

- (instancetype)initWithCenterButton:(UIButton *)centerBtn aroundButtons:(NSArray<UIButton *> *)buttons frame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.buttons = buttons;
        self.centerBtn = centerBtn;
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews{
    [self addSubview:self.centerBtn];
    for (UIButton *btn in self.buttons) {
        [self addSubview:btn];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    if (!self.buttons) {
        return;
    }
    if (!self.centerBtn) {
        return;
    }
    CGSize size = self.frame.size;
    self.centerBtn.center = CGPointMake(size.width / 2, size.height / 2);
    double angle = 0;
    if (self.buttons.count % 2 == 0) {
        angle = M_PI / 3;
    } else {
        angle = M_PI / 4;
    }
//    b.x = (a.x - O.x)cos(angle) + (O.y - a.y)sin(angle) + O.x
//
//    b.y = (O.x - a.x)sin(angle) + (a.y - O.y)cos(angle) + O.y
//
    UIButton *tempBtn = self.buttons.firstObject;
    CGPoint startPoint = CGPointMake(self.centerBtn.center.x,tempBtn.frame.size.height / 2);
    if (self.buttons.count == 4) {
        for (int i = 0; i < self.buttons.count; i++) {
            UIButton *btn = self.buttons[i];
            btn.center = CGPointMake((startPoint.x - self.centerBtn.center.x) * cos(angle * i) + (self.centerBtn.center.y - startPoint.y) * sin(angle * i) + self.centerBtn.center.x, (self.centerBtn.center.x - startPoint.x) * sin(angle * i) + (startPoint.y - self.centerBtn.center.y) * cos(angle * i) + self.centerBtn.center.y);
        }
        return;
    }
    if (self.buttons.count == 2) {
        
        return;
    }
    if (self.buttons.count == 2) {
        
        return;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
