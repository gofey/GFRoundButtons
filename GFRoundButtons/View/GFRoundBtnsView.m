//
//  GFRoundBtnsView.m
//  GFRoundButtons
//
//  Created by gofeyLee on 2018/8/29.
//  Copyright © 2018年 gofeyLee. All rights reserved.
//

#import "GFRoundBtnsView.h"
@interface GFRoundBtnsView()<CAAnimationDelegate>
@property(copy,nonatomic)NSArray<UIButton *> *buttons;
@property(strong,nonatomic)UIButton *centerBtn;
@property(nonatomic, assign)BOOL isDispersal;//按钮初始值是分散还是集中
@property(nonatomic, strong)UIView *bgView;
@end

@implementation GFRoundBtnsView

- (instancetype)initWithCenterButton:(UIButton *)centerBtn aroundButtons:(NSArray<UIButton *> *)buttons frame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        CGFloat sideLength = frame.size.width >= frame.size.height ? frame.size.height:frame.size.width;
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sideLength, sideLength)];
        self.buttons = buttons;
        self.centerBtn = centerBtn;
        [self.centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews{
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.centerBtn];
    for (UIButton *btn in self.buttons) {
        [self.bgView addSubview:btn];
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
    self.bgView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    CGSize size = self.bgView.frame.size;
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
        for (int i = 0; i < self.buttons.count; i++) {
            UIButton *btn = self.buttons[i];
            i = i + 1;
            btn.center = CGPointMake((startPoint.x - self.centerBtn.center.x) * cos(angle * i) + (self.centerBtn.center.y - startPoint.y) * sin(angle * i) + self.centerBtn.center.x, (self.centerBtn.center.x - startPoint.x) * sin(angle * i) + (startPoint.y - self.centerBtn.center.y) * cos(angle * i) + self.centerBtn.center.y);
        }
        return;
    }
    if (self.buttons.count == 5) {
        for (int i = 0; i < self.buttons.count; i++) {
            UIButton *btn = self.buttons[i];
            btn.center = CGPointMake((startPoint.x - self.centerBtn.center.x) * cos(angle * i) + (self.centerBtn.center.y - startPoint.y) * sin(angle * i) + self.centerBtn.center.x, (self.centerBtn.center.x - startPoint.x) * sin(angle * i) + (startPoint.y - self.centerBtn.center.y) * cos(angle * i) + self.centerBtn.center.y);
        }
        return;
    }
    if (self.buttons.count == 3) {
        for (int i = 0; i < self.buttons.count; i++) {
            UIButton *btn = self.buttons[i];
            i = i + 1;
            btn.center = CGPointMake((startPoint.x - self.centerBtn.center.x) * cos(angle * i) + (self.centerBtn.center.y - startPoint.y) * sin(angle * i) + self.centerBtn.center.x, (self.centerBtn.center.x - startPoint.x) * sin(angle * i) + (startPoint.y - self.centerBtn.center.y) * cos(angle * i) + self.centerBtn.center.y);
        }
        return;
    }
}

- (void)centerBtnClick:(UIButton *)sender{
    if (_isDispersal) {
        //按钮分散
        for (int i = 0; i < self.buttons.count; i++) {
            //制作动画
            UIButton *btn = self.buttons[i];
            btn.enabled = YES;
            btn.adjustsImageWhenDisabled = YES;
            CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
            
            CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transfrom.scale"];
            
            CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
            
            CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
            
            scaleAnimation.toValue = @(1);
            scaleAnimation.fromValue = @(0);
            opacityAnimation.toValue = @1;
            opacityAnimation.fromValue = @0;
            moveAnimation.fromValue = [NSValue valueWithCGPoint:sender.center];
            moveAnimation.toValue = [NSValue valueWithCGPoint:btn.center];
            
            animationGroup.animations = @[moveAnimation, scaleAnimation,opacityAnimation];
            animationGroup.duration = 0.5;
            animationGroup.repeatCount = 1;
            animationGroup.fillMode = kCAFillModeForwards;
            animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
            animationGroup.removedOnCompletion = NO;
            animationGroup.delegate = self;
            [btn.layer addAnimation:animationGroup forKey:@"dispersal"];
        }
        
    }else{
        //按钮集中
        
        for (int i = 0; i < self.buttons.count; i++) {
            UIButton *btn = self.buttons[i];
            CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
            btn.enabled = NO;
            btn.adjustsImageWhenDisabled = NO;
            CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transfrom.scale"];
            
            CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
            
            scaleAnimation.toValue = @(0);
            scaleAnimation.fromValue = @(1);
            opacityAnimation.toValue = @1;
            opacityAnimation.toValue = @0;
            moveAnimation.toValue = [NSValue valueWithCGPoint:sender.center];
            moveAnimation.fromValue = [NSValue valueWithCGPoint:btn.center];
            
            CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
            animationGroup.animations = @[moveAnimation, scaleAnimation,opacityAnimation];
            animationGroup.duration = 0.5;
            animationGroup.repeatCount = 1;
            animationGroup.fillMode = kCAFillModeForwards;
            animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
            animationGroup.removedOnCompletion = NO;
            
            [btn.layer addAnimation:animationGroup forKey:@"concentrate"];
        }
    }
    _isDispersal = !_isDispersal;
}
#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
